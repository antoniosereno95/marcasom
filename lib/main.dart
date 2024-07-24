import 'package:flutter/material.dart';
import 'package:marcasom/screens/minhasReservas.dart';
import 'package:marcasom/screens/offerService.dart';
import 'screens/loadingScreen.dart';
import 'screens/loginScreen.dart';
import 'screens/cadastroScreen.dart';
import 'screens/buscaInicial.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'screens/perfilScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  initializeDateFormatting('pt_BR', null).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MarcaSoM',
      theme: ThemeData(
        primaryColor: const Color(0xFF9B59B6),
        secondaryHeaderColor: const Color(0xFFF1C40F),
        fontFamily: 'Roboto',
      ),
            localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
      ],
      home: const LoadingScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const BuscaInicial(),
        '/perfil': (context) => const PerfilScreen(),
        '/minhasreservas': (context) => const MinhasReservasScreen(),
        '/offerService': (context) => const OfferService(),
      },
    );
  }
}
