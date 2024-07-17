import 'package:flutter/material.dart';
import 'package:marcasom/screens/minhasReservas.dart';
import 'package:marcasom/screens/offerService.dart';
import 'screens/loadingScreen.dart';
import 'screens/loginScreen.dart';
import 'screens/cadastroScreen.dart';
import 'screens/buscaInicial.dart';
import 'screens/perfilScreen.dart';

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
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          displayLarge: TextStyle(fontFamily: 'Roboto'),
          displayMedium: TextStyle(fontFamily: 'Roboto'),
          displaySmall: TextStyle(fontFamily: 'Roboto'),
          headlineLarge: TextStyle(fontFamily: 'Roboto'),
          headlineMedium: TextStyle(fontFamily: 'Roboto'),
          headlineSmall: TextStyle(fontFamily: 'Roboto'),
          titleLarge: TextStyle(fontFamily: 'Roboto'),
          titleMedium: TextStyle(fontFamily: 'Roboto'),
          titleSmall: TextStyle(fontFamily: 'Roboto'),
          bodyLarge: TextStyle(fontFamily: 'Roboto'),
          bodyMedium: TextStyle(fontFamily: 'Roboto'),
          bodySmall: TextStyle(fontFamily: 'Roboto'),
          labelLarge: TextStyle(fontFamily: 'Roboto'),
          labelMedium: TextStyle(fontFamily: 'Roboto'),
          labelSmall: TextStyle(fontFamily: 'Roboto'),
        ),
      ),
      home: LoadingScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/home': (context) => BuscaInicial(),
        '/perfil': (context) => PerfilScreen(),
        '/minhasreservas': (context) => MinhasReservasScreen(),
        '/offerService': (context) => OfferService(),
      },
    );
  }
}
