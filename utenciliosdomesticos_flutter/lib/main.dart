import 'package:flutter/material.dart';
import 'package:utenciliosdomesticos_flutter/screens/utensilios_detalhes.dart';
import 'package:utenciliosdomesticos_flutter/screens/utensilios_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utensilios Domesticos',
      theme: new ThemeData(
        primaryColor: Color.fromRGBO(211, 211, 211, 1.0),
        fontFamily: 'Arial',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => UtensiliosScreen(),
        '/utensilios_detalhes': (context) => UtensiliosDetalhesScreen(),
      },
    );
  }
}
