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
    runApp(MyApp());
  });
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
      ),
            localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('pt', 'BR'),
      ],
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
