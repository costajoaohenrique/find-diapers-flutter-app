import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(FindDiapersApp());

class FindDiapersApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busca Fraldas',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Home(title: 'Busca Fraldas'),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void _buscarFralda(String valor) {
    fetchDiapers().then((value) => print(value.body));
  }

  Future<http.Response> fetchDiapers() {
    return http.get('https://find-diapers-node-api.herokuapp.com/diapers');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                onChanged: _buscarFralda,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Digite aqui Ex: Pampers XXG',
                    icon: Icon(Icons.search)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
