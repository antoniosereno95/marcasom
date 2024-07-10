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
              const SizedBox(height: 100),
              Center(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'lib/assets/Logo-LoginCadastro.svg',
                width: 240,
                height: 40,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
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
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Ação ao clicar no botão de cadastrar
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9C27B0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    const Text(
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
                      child: const Text(
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
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Ao se cadastrar, você aceita nossos ',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    TextSpan(
                      text: 'Termos de Uso',
                      style: const TextStyle(color: Colors.orange, fontSize: 14),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navegar para a página de Termos de Uso
                        },
                    ),
                    const TextSpan(
                      text: ' e nossa ',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    TextSpan(
                      text: 'Política de Privacidade.',
                      style: const TextStyle(color: Colors.orange, fontSize: 14),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navegar para a página de Política de Privacidade
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'As informações coletadas pela Comuto Serviços de Tecnologia LTDA são processadas com o propósito de criar sua conta, administrar sua reserva, utilizar e melhorar nossos serviços e garantir a segurança de nossa plataforma.',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Você possui direitos sobre seus dados pessoais e pode exercê-los entrando em contato com a MarcaSoM através do nosso ',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    TextSpan(
                      text: 'Formulário de contato.',
                      style: const TextStyle(color: Colors.orange, fontSize: 14),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navegar para a página de Formulário de Contato
                        },
                    ),
                    const TextSpan(
                      text: ' Para saber mais sobre seus direitos e sobre como lidamos com seus dados pessoais, confira nossa ',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    TextSpan(
                      text: 'Política de Privacidade.',
                      style: const TextStyle(color: Colors.orange, fontSize: 14),
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