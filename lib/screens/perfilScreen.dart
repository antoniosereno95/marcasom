import 'package:flutter/material.dart';
import 'package:marcasom/screens/loginScreen.dart';
import '../widgets/barraNavegacao.dart';

class PerfilScreen extends StatefulWidget {
  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  
  final Map<String, String> userInfo = {
    'nome': 'Antonio',
    'sobrenome': 'Sereno',
    'dataNascimento': '12/06/2024',
    'contato': '(81) 98084-0216',
    'email': 'antonio.jsereno@upe.br',
  };

  bool mostraBio = false;
  bool mostraPreferencias = false;
  bool mostraPortifolio = false;

  final TextEditingController bioController = TextEditingController();
  final TextEditingController preferenciasController = TextEditingController();
  final TextEditingController portifolioController = TextEditingController();

  String? bioText;
  String? preferenciasText;
  String? portifolioText;

  @override
  void dispose() {
    bioController.dispose();
    preferenciasController.dispose();
    portifolioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9C27B0),
        elevation: 0,
        centerTitle: true,
        title: const Text('Perfil do Usuário'),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
            const Center(
              child: Text(
                'LogOut',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFFAFAFA),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('lib/assets/images/UserIcon.svg'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      userInfo['nome']!,
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
              Text('Nome: ${userInfo['nome']}'),
              Text('Sobrenome: ${userInfo['sobrenome']}'),
              Text('Data de nascimento: ${userInfo['dataNascimento']}'),
              Text('Contato: ${userInfo['contato']}'),
              Text('Endereço de e-mail: ${userInfo['email']}'),
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
                  setState(() {
                    mostraBio = !mostraBio;
                  });
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
              if (mostraBio)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextField(
                        controller: bioController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Digite sua miniBiografia',
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          bioText = bioController.text;
                          mostraBio = false;
                        });
                      },
                      child: Text('Salvar'),
                    ),
                  ],
                ),
              if (bioText != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('MiniBiografia: $bioText'),
                ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    mostraPreferencias = !mostraPreferencias;
                  });
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
              if (mostraPreferencias)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextField(
                        controller: preferenciasController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Digite suas preferências',
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          preferenciasText = preferenciasController.text;
                          mostraPreferencias = false;
                        });
                      },
                      child: Text('Salvar'),
                    ),
                  ],
                ),
              if (preferenciasText != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('Preferências: $preferenciasText'),
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
                  setState(() {
                    mostraPortifolio = !mostraPortifolio;
                  });
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
              if (mostraPortifolio)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextField(
                        controller: portifolioController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Digite o link do seu portfólio',
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          portifolioText = portifolioController.text;
                          mostraPortifolio = false;
                        });
                      },
                      child: Text('Salvar'),
                    ),
                  ],
                ),
              if (portifolioText != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('Portfólio: $portifolioText'),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BarraDeNavegacao(selectedIndex: 3),
    );
  }
}
