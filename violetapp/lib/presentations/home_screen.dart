import 'package:flutter/material.dart';
import 'screens/emergency_screen.dart';
import 'screens/psycho_screen.dart';
import 'screens/law_screen.dart';
import 'screens/educational_resources_screen.dart';
import 'screens/community_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('VioletApp'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildEmergencyButton(context),
            SizedBox(height: 20), // Espacio entre botones
            _buildModuleButton(context, 'Apoyo Psicológico', Icons.favorite, PsychologicalScreen()),
            SizedBox(height: 16),
            _buildModuleButton(context, 'Apoyo Legal', Icons.gavel, LawScreen()),
            SizedBox(height: 16),
            _buildModuleButton(context, 'Recursos Educativos', Icons.book, EducationalResourcesScreen()),
            SizedBox(height: 16),
            _buildModuleButton(context, 'Comunidad', Icons.group, CommunityScreen()),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EmergencyScreen()),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, 
        backgroundColor: Colors.red, // Color del texto
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        textStyle: TextStyle(fontSize: 20), // Tamaño de texto
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.warning, size: 30), // Ícono de advertencia
          SizedBox(width: 10), // Espacio entre el ícono y el texto
          Text('Asistencia Inmediata'),
        ],
      ),
    );
  }

  Widget _buildModuleButton(BuildContext context, String title, IconData icon, Widget screen) {
    return ElevatedButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, 
        backgroundColor: Colors.purple, // Color del texto
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        textStyle: TextStyle(fontSize: 18), // Tamaño de texto
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30), // Ícono del módulo
          SizedBox(width: 10), // Espacio entre el ícono y el texto
          Text(title),
        ],
      ),
    );
  }
}
