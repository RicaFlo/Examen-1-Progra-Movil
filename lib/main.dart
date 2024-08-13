import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App CEUTEC',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/news': (context) => NewsScreen(),
        
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App CEUTEC'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.newspaper),
              title: Text('Noticias'),
              onTap: () {
                Navigator.pushNamed(context, '/news');
              },
            ),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('El cambio de Monedas'),
              onTap: () {
                Navigator.pushNamed(context, '/currency');
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Lista de tareas'),
              onTap: () {
                Navigator.pushNamed(context, '/tasks');
              },
            ),
            ListTile(
              leading: Icon(Icons.speaker_notes),
              title: Text('Podcast'),
              onTap: () {
                Navigator.pushNamed(context, '/podcast');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Bienvenido a la App CEUTEC'),
      ),
    );
  }
}
class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.article),
                  title: Text('Título de la noticia'),
                  subtitle: Text('Descripción breve de la noticia.'),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Detalles adicionales de la noticia.'),
                ),
                ButtonBar(
                  children: <Widget>[
                    TextButton(
                      child: const Text('BUTTON 1'),
                      onPressed: () { /* ... */ },
                    ),
                    TextButton(
                      child: const Text('BUTTON 2'),
                      onPressed: () { /* ... */ },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}