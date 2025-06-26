import 'package:flutter/material.dart';

class Noticia {
  final String titulo;
  final String descripcion;
  final String imagenUrl;

  Noticia(this.titulo, this.descripcion, this.imagenUrl);
}
class NewsHomePage extends StatefulWidget {
  @override
  _NewsHomePageState createState() => _NewsHomePageState();
}

class _NewsHomePageState extends State<NewsHomePage> {
  String _currentSection = 'Inicio';

  final Map<String, List<Noticia>> secciones = {
    'Inicio': [
      Noticia(
        'Bienvenido a Noticias',
        'Resumen de las noticias más recientes.',
        'https://images.unsplash.com/photo-1504712598893-24159a89200e?auto=format&fit=crop&w=800&q=80',
      ),
    ],
    'Deportes': [
      Noticia(
        'Goleada del equipo local',
        'Marcador final 5-0.',
        'https://images.unsplash.com/photo-1517649763962-0c623066013b?auto=format&fit=crop&w=800&q=80',
      ),
    ],
    'Tecnología': [
      Noticia(
        'Nuevo smartphone lanzado',
        'La compañía apple lanza un nuevo modelo.',
        'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&fit=crop&w=800&q=80',
      ),
    ],
    'Entretenimiento': [
      Noticia(
        'Estreno de película',
        'Nueva cinta rompe récords en taquilla.',
        'https://images.unsplash.com/photo-1524985069026-dd778a71c7b4?auto=format&fit=crop&w=800&q=80',
      ),
    ],
  };

  final List<String> _bottomOptions = ['Inicio', 'Deportes'];

  void _onBottomNavTapped(int index) {
    setState(() {
      _currentSection = _bottomOptions[index];
    });
  }

  void _onDrawerItemSelected(String section) {
    Navigator.pop(context);
    setState(() {
      _currentSection = section;
    });
  }

  IconData _getIconForSection(String section) {
    switch (section) {
      case 'Inicio':
        return Icons.home;
      case 'Deportes':
        return Icons.sports_soccer;
      case 'Tecnología':
        return Icons.computer;
      case 'Entretenimiento':
        return Icons.movie;
      default:
        return Icons.article;
    }
  }

  @override
  Widget build(BuildContext context) {
    final noticias = secciones[_currentSection] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicación de Noticias'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Text('Menú',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ...secciones.keys.map((section) {
              return ListTile(
                leading: Icon(_getIconForSection(section)),
                title: Text(section),
                selected: section == _currentSection,
                onTap: () => _onDrawerItemSelected(section),
              );
            }).toList(),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: noticias.length,
        itemBuilder: (context, index) {
          final noticia = noticias[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  noticia.imagenUrl,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.broken_image),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    noticia.titulo,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(noticia.descripcion),
                ),
                SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomOptions.contains(_currentSection)
            ? _bottomOptions.indexOf(_currentSection)
            : 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'Deportes',
          ),
        ],
        onTap: _onBottomNavTapped,
      ),
    );
  }
}