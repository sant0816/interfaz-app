import 'package:flutter/material.dart';
import 'package:flutter_application_7/views/noticias.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicación de Noticias',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NewsHomePage(),
    );
  }
}