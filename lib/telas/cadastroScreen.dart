import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        backgroundColor: Color(0xFF9C27B0),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'lib/assets/images/logobranco.png',
                      height: 100,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'MarcaSoM',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9C27B0),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Nome',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'E-mail',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Senha',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Confirme a Senha',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Ação ao clicar no botão de cadastrar
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF9C27B0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Já se cadastrou?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navegar para a página de login
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Ao se cadastrar, você aceita nossos ',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    TextSpan(
                      text: 'Termos de Uso',
                      style: TextStyle(color: Colors.orange, fontSize: 14),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navegar para a página de Termos de Uso
                        },
                    ),
                    TextSpan(
                      text: ' e nossa ',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    TextSpan(
                      text: 'Política de Privacidade.',
                      style: TextStyle(color: Colors.orange, fontSize: 14),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navegar para a página de Política de Privacidade
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'As informações coletadas pela Comuto Serviços de Tecnologia LTDA são processadas com o propósito de criar sua conta, administrar sua reserva, utilizar e melhorar nossos serviços e garantir a segurança de nossa plataforma.',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Você possui direitos sobre seus dados pessoais e pode exercê-los entrando em contato com a MarcaSoM através do nosso ',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    TextSpan(
                      text: 'Formulário de contato.',
                      style: TextStyle(color: Colors.orange, fontSize: 14),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navegar para a página de Formulário de Contato
                        },
                    ),
                    TextSpan(
                      text: ' Para saber mais sobre seus direitos e sobre como lidamos com seus dados pessoais, confira nossa ',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    TextSpan(
                      text: 'Política de Privacidade.',
                      style: TextStyle(color: Colors.orange, fontSize: 14),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navegar para a página de Política de Privacidade
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}