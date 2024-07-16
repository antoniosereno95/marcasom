import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                TextFormField(
                  controller: nomeController,
                  decoration: InputDecoration(
                    hintText: 'Nome',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu nome.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu e-mail.';
                    }
                    // Aqui você pode adicionar validações adicionais, como verificar se o e-mail é válido
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: senhaController,
                  decoration: InputDecoration(
                    hintText: 'Senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 12.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                        child: Icon(
                          obscurePassword ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  obscureText: obscurePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira sua senha.';
                    }
                    // Aqui você pode adicionar validações adicionais para a senha
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: confirmarSenhaController,
                  decoration: InputDecoration(
                    hintText: 'Confirme a Senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 12.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureConfirmPassword = !obscureConfirmPassword;
                          });
                        },
                        child: Icon(
                          obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  obscureText: obscureConfirmPassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, confirme sua senha.';
                    }
                    if (value != senhaController.text) {
                      return 'As senhas não coincidem.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: submitForm,
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
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Já se cadastrou?',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      TextButton(
                        onPressed: () {
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
                            // Ação ao clicar no texto Termos de Uso
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
                            // Ação ao clicar no texto Política de Privacidade
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
                            // Ação ao clicar no texto Formulário de contato
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
                            // Ação ao clicar no texto Política de Privacidade
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cadastro realizado com sucesso!')),
      );
    }
  }
}
