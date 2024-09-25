import 'package:flutter/material.dart';

class EducationalResourcesScreen extends StatelessWidget {
  final List<ResourceCategory> categories = [
    ResourceCategory(
      title: 'Artículos',
      description: 'Lecturas sobre violencia de género y prevención.',
      icon: Icons.article,
    ),
    ResourceCategory(
      title: 'Videos',
      description: 'Documentales y testimonios sobre la lucha contra la violencia.',
      icon: Icons.video_library,
    ),
    ResourceCategory(
      title: 'Infografías',
      description: 'Datos visuales sobre la violencia hacia la mujer.',
      icon: Icons.picture_as_pdf,
    ),
    ResourceCategory(
      title: 'Guías Prácticas',
      description: 'Cómo actuar y reconocer señales de alerta.',
      icon: Icons.assignment,
    ),
    ResourceCategory(
      title: 'Línea de Ayuda',
      description: 'Contactos de organizaciones que ofrecen apoyo.',
      icon: Icons.phone_in_talk,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recursos Educativos'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Icon(categories[index].icon, color: Colors.purple),
              title: Text(categories[index].title),
              subtitle: Text(categories[index].description),
              onTap: () {
                // Navegar a la pantalla de detalles de recursos
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResourcesDetailScreen(category: categories[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ResourcesDetailScreen extends StatelessWidget {
  final ResourceCategory category;

  ResourcesDetailScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Text('Aquí se mostrarían los recursos de ${category.title}.'),
      ),
    );
  }
}

class ResourceCategory {
  final String title;
  final String description;
  final IconData icon;

  ResourceCategory({
    required this.title,
    required this.description,
    required this.icon,
  });
}
