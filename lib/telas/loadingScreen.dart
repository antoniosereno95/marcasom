import 'package:flutter/material.dart';
import 'dart:async';
import 'buscaInicial.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // Redireciona para a página de login após 3 segundos
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BuscaInicial()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9C27B0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/images/logo marcasom tela inicial.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'MarcaSoM',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}