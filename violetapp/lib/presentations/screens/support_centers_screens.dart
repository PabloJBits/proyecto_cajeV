import 'package:flutter/material.dart';

class SupportCentersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Centros de Apoyo')),
      body: Center(
        child: Text('Aquí encontrarás los centros de apoyo de tu localidad.'),
      ),
    );
  }
}
