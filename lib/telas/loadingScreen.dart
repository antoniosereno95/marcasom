import 'package:flutter/material.dart';
import 'loginScreen.dart';  

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9C27B0),  
      body: Center(
        child: GestureDetector(
          onTap: () {
            
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
