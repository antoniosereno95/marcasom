import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 100),
              Center(
                child: SvgPicture.asset(
                  'lib/assets/Logo-LoginCadastro.svg',
                  width: 240,
                  height: 40,
                ),
              ),
              SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Nome',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Sobrenome',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Data de Nascimento',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Contato(telefone)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
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
                    borderSide: BorderSide.none,
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
                    borderSide: BorderSide.none,
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
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9C27B0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      text:
                          'Você possui direitos sobre seus dados pessoais e pode exercê-los entrando em contato com a MarcaSoM através do nosso ',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    TextSpan(
                      text: 'Formulário de contato.',
                      style: TextStyle(color: Colors.orange, fontSize: 14),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                        },
                    ),
                    TextSpan(
                      text:
                          ' Para saber mais sobre seus direitos e sobre como lidamos com seus dados pessoais, confira nossa ',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    TextSpan(
                      text: 'Política de Privacidade.',
                      style: TextStyle(color: Colors.orange, fontSize: 14),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
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
