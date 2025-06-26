import 'package:flutter/material.dart';
import 'package:navegacion_tabs/views/navegacion.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegacion Tabs',
      home:MyTabbedApp(),
    );
  }
}