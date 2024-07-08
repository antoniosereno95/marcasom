import 'package:flutter/material.dart';
import 'telas/loginScreen.dart';
import 'telas/cadastroScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MarcaSoM App',
      home: LoginScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
      },
    );
  }
}
