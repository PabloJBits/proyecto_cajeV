import 'package:flutter/material.dart';

class PsychologicsScreen extends StatelessWidget {
  final List<Psychologist> psychologists = [
    Psychologist(
      name: 'Dra. Ana López',
      title: 'Psicóloga Clínica',
      specialties: 'Terapia cognitivo-conductual, Ansiedad, Depresión',
      areaOfInterest: 'Trastornos de Ansiedad',
    ),
    Psychologist(
      name: 'Dr. Carlos Pérez',
      title: 'Psicólogo Infantil',
      specialties: 'Desarrollo infantil, Terapia de juego',
      areaOfInterest: 'Niños y adolescentes',
    ),
    Psychologist(
      name: 'Dra. Marta Fernández',
      title: 'Psicóloga Organizacional',
      specialties: 'Psicología del trabajo, Coaching',
      areaOfInterest: 'Estrés laboral',
    ),
    Psychologist(
      name: 'Dr. Julio García',
      title: 'Psicólogo Familiar',
      specialties: 'Terapia familiar, Conflictos de pareja',
      areaOfInterest: 'Relaciones familiares',
    ),
    Psychologist(
      name: 'Dra. Lucía González',
      title: 'Psicóloga de la Salud',
      specialties: 'Intervenciones en crisis, Duelo',
      areaOfInterest: 'Salud emocional',
    ),
    Psychologist(
      name: 'Dr. Manuel Herrera',
      title: 'Psicólogo Neuropsicólogo',
      specialties: 'Neuropsicología, Demencias, Alzheimer',
      areaOfInterest: 'Trastornos neurodegenerativos',
    ),
    Psychologist(
      name: 'Dra. Silvia Torres',
      title: 'Psicóloga Deportiva',
      specialties: 'Psicología del deporte, Motivación',
      areaOfInterest: 'Rendimiento deportivo',
    ),
    Psychologist(
      name: 'Dr. Luis Martínez',
      title: 'Psicólogo Social',
      specialties: 'Psicología comunitaria, Intervenciones grupales',
      areaOfInterest: 'Bienestar comunitario',
    ),
    Psychologist(
      name: 'Dra. Paula Rojas',
      title: 'Psicóloga de la Educación',
      specialties: 'Orientación educativa, Dificultades de aprendizaje',
      areaOfInterest: 'Desarrollo educativo',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apoyo Psicológico'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.8,
          ),
          itemCount: psychologists.length,
          itemBuilder: (context, index) {
            return _buildPsychologistCard(context, psychologists[index]);
          },
        ),
      ),
    );
  }

  Widget _buildPsychologistCard(BuildContext context, Psychologist psychologist) {
    return GestureDetector(
      onTap: () {
        _showPsychologistDetails(context, psychologist);
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.purple,
                child: Icon(Icons.person, size: 40, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                psychologist.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Text(
                psychologist.title,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Text(
                psychologist.specialties,
                style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(height: 5),
              Text(
                'Área de interés: ${psychologist.areaOfInterest}',
                style: TextStyle(fontSize: 12, color: Colors.purple[800]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPsychologistDetails(BuildContext context, Psychologist psychologist) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(psychologist.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.purple,
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                psychologist.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Especialidades: ${psychologist.specialties}',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Área de interés: ${psychologist.areaOfInterest}',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}

class Psychologist {
  final String name;
  final String title;
  final String specialties;
  final String areaOfInterest;

  Psychologist({
    required this.name,
    required this.title,
    required this.specialties,
    required this.areaOfInterest,
  });
}
