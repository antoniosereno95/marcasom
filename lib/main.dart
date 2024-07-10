import 'package:flutter/material.dart';
import 'screens/loadingScreen.dart';
import 'screens/loginScreen.dart';
import 'screens/cadastroScreen.dart';
import 'screens/buscaInicial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MarcaSoM',
      theme: ThemeData(
        primaryColor: Color(0xFF9B59B6),
        secondaryHeaderColor: Color(0xFFF1C40F),
      ),
      home: LoadingScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/home': (context) => BuscaInicial(),
      },
    );
  }
}
