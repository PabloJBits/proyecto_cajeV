import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Comunidad')),
      body: Center(
        child: Text('Aquí puedes compartir tus experiencias y apoyarte mutuamente.'),
      ),
    );
  }
}
