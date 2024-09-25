import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class EmergencyAssistanceScreen extends StatefulWidget {
  @override
  _EmergencyAssistanceScreenState createState() => _EmergencyAssistanceScreenState();
}

class _EmergencyAssistanceScreenState extends State<EmergencyAssistanceScreen> {
  String _locationMessage = "Obteniendo ubicación...";
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _locationMessage = "Permiso de ubicación denegado.";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _locationMessage = "Permiso de ubicación denegado permanentemente.";
      });
      return;
    }

    try {
      _currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _locationMessage = "Tu ubicación: ${_currentPosition!.latitude}, ${_currentPosition!.longitude}";
      });
    } catch (e) {
      setState(() {
        _locationMessage = "No se pudo obtener la ubicación.";
      });
    }
  }

  void _sendLocation() {
    if (_currentPosition != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Ubicación enviada: $_locationMessage")),
      );
    }
  }

  void _makeEmergencyCall() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Llamada de emergencia realizada.")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asistencia Inmediata'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: Colors.red, size: 30), // Icono de ubicación
                  SizedBox(width: 8), // Espacio entre el icono y el texto
                  Expanded(
                    child: Text(
                      _locationMessage,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _sendLocation,
                icon: Icon(Icons.send),
                label: Text('ENVIAR'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _makeEmergencyCall,
                icon: Icon(Icons.call),
                label: Text('LLAMADA EMERGENCIA'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
