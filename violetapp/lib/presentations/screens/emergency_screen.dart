import 'package:flutter/material.dart';

class EmergencyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Asistencia Inmediata')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Implementar funcionalidad de llamada de emergencia
            print('Llamando a emergencia...');
          },
          child: Text('Llamar a Emergencia'),
        ),
      ),
    );
  }
}
