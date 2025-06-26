import 'package:flutter/material.dart';

class MyTabbedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegación con Tabs',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Navegación con Tabs'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.article), text: 'Noticias'),
                Tab(icon: Icon(Icons.message), text: 'Mensajes'),
                Tab(icon: Icon(Icons.person), text: 'Perfil'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text('Pestaña de Noticias')),
              Center(child: Text('Pestaña de Mensajes')),
              Center(child: Text('Pestaña de Perfil')),
            ],
          ),
        ),
      ),
    );
  }
}