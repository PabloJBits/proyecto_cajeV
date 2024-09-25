import 'package:flutter/material.dart';
import 'presentations/home_screen.dart';

void main() {
  runApp(VioletApp());
}

class VioletApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VioletApp',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: HomeScreen(),
    );
  }
}