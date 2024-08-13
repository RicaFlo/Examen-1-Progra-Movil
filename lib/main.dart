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
        '/tasks': (context) => TaskListScreen(),
        '/currency': (context) => CurrencyConverterScreen(),
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
                      child: const Text('Boton 1'),
                      onPressed: () { /* ... */ },
                    ),
                    TextButton(
                      child: const Text('Boton 2'),
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

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.person),
            title: Text('Ricardo Flores 62311512'),
            subtitle: Text('Tienes una nueva tarea'),
            trailing: Icon(Icons.star_border),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CurrencyConverterScreen extends StatefulWidget {
  @override
  _CurrencyConverterScreenState createState() => _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  String selectedCurrency = 'USD';
  double rate = 24.68;
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cambio de Moneda'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedCurrency = 'USD';
                      rate = 24.68;
                    });
                  },
                  child: Text('Dólar'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedCurrency = 'EUR';
                      rate = 28.50;
                    });
                  },
                  child: Text('Euro'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Tasa de Cambio: $rate',
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'USD:',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  result = double.parse(value) * rate;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Lps: $result',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}