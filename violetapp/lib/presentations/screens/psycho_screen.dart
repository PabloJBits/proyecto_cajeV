import 'package:flutter/material.dart';
import 'package:violetapp/presentations/screens/psychologics_screen.dart';
import 'package:violetapp/presentations/screens/support_centers_screens.dart';
import 'package:violetapp/presentations/screens/violetcaps_screen.dart';

class PsychologicalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apoyo Psicológico'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Botón de Psicólogos
            _buildModuleButton(
              context,
              'Psicólogos',
              Icons.man,
              PsychologicsScreen(),
            ),
            SizedBox(height: 16),
            // Botón de Centros de Apoyo
            _buildModuleButton(
              context,
              'Centros de Apoyo',
              Icons.handshake,
              SupportCentersScreen(),
            ),
            SizedBox(height: 16),
            // Botón de VioletaCaps
            _buildModuleButton(
              context,
              'VioletaCaps',
              Icons.book,
              VioletCapsScreen(),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // Método para crear los botones del módulo
  Widget _buildModuleButton(BuildContext context, String title, IconData icon, Widget screen) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, 
        backgroundColor: Colors.purple, // Color del botón
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      icon: Icon(icon, size: 24),
      label: Text(
        title,
        style: TextStyle(fontSize: 18.0),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}


