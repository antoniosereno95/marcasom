import 'package:flutter/material.dart';
import 'package:marcasom/screens/loginScreen.dart';

class PerfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Meu Perfil',
          style: TextStyle(
            color: Color(0xFF9C27B0),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
        ),
      ),
      backgroundColor: const Color(0xFFFAFAFA),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('lib/assets/images/perfil.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Nome',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Dados Pessoais',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('Nome: xxxxxxxxxx'),
            Text('Sobrenome: xxxxxxxxxx'),
            Text('Data de nascimento: 05/12/2003'),
            Text('Contato: (xx) 9xxxx-xxxx'),
            Text('Endereço de e-mail: xxxxxxxx@gmail.com'),
            SizedBox(height: 20),
            Text(
              'Sobre você',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Ação para adicionar mini biografia
              },
              child: Row(
                children: [
                  Icon(Icons.add, color: Colors.orange),
                  SizedBox(width: 10),
                  Text(
                    'Adicione miniBiografia',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Ação para adicionar preferências
              },
              child: Row(
                children: [
                  Icon(Icons.add, color: Colors.orange),
                  SizedBox(width: 10),
                  Text(
                    'Adicione preferências',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Portfólio',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Ação para adicionar link do portfólio
              },
              child: Row(
                children: [
                  Icon(Icons.add, color: Colors.orange),
                  SizedBox(width: 10),
                  Text(
                    'Adicione Link (Portfólio)',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
