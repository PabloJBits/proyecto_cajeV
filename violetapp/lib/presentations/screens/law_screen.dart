import 'package:flutter/material.dart';

class LawScreen extends StatelessWidget {
  final List<LegalResourceCategory> categories = [
    LegalResourceCategory(
      title: 'Asesoría Legal',
      description: 'Acceso a abogados y consultas legales.',
      icon: Icons.gavel,
    ),
    LegalResourceCategory(
      title: 'Derechos de la Mujer',
      description: 'Información sobre derechos legales y protección.',
      icon: Icons.female,
    ),
    LegalResourceCategory(
      title: 'Recursos Judiciales',
      description: 'Guías sobre cómo proceder legalmente.',
      icon: Icons.library_books,
    ),
    LegalResourceCategory(
      title: 'Líneas de Ayuda',
      description: 'Contactos de organizaciones que ofrecen apoyo legal.',
      icon: Icons.phone_in_talk,
    ),
    LegalResourceCategory(
      title: 'Documentos Legales',
      description: 'Plantillas y ejemplos de documentos legales.',
      icon: Icons.description,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apoyo Legal'),
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
                // Navegar a la pantalla de detalles de recursos legales
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LegalResourceDetailScreen(category: categories[index]),
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

class LegalResourceDetailScreen extends StatelessWidget {
  final LegalResourceCategory category;

  LegalResourceDetailScreen({required this.category});

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

class LegalResourceCategory {
  final String title;
  final String description;
  final IconData icon;

  LegalResourceCategory({
    required this.title,
    required this.description,
    required this.icon,
  });
}
