import 'package:flutter/material.dart';
import 'loginScreen.dart';  // Importando a tela de login

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9C27B0),  // Cor de fundo roxa
      body: Center(
        child: GestureDetector(
          onTap: () {
            // Navegar para a página de login ao tocar no ícone
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
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
      ),
    );
  }
}
