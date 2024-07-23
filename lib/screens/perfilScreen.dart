import 'package:flutter/material.dart';
import 'package:marcasom/screens/loginScreen.dart';
import '../widgets/barraNavegacao.dart'; 

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

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
      backgroundColor: const Color(0xFFFAFAFA),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xFF9C27B0),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Editar Informações'),
              onTap: () {
                // Não foi desenvolvida a logica de edição de valores.
              },
            ),
             ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Meu Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('lib/assets/perfinIcon.svg'),
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
                    Icon(Icons.control_point, color: Colors.orange),
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
                        onSubmitted: (value) {
                          setState(() {
                            bioText = value;
                            mostraBio = false;
                          });
                        },
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('MiniBiografia: $bioText'),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              SizedBox(height: 20),
              Text(
                'Preferências',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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
                    Icon(Icons.control_point, color: Colors.orange),
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
                        onSubmitted: (value) {
                          setState(() {
                            preferenciasText = value;
                            mostraPreferencias = false;
                          });
                        },
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Preferências: $preferenciasText'),
                      SizedBox(height: 10),
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
                  setState(() {
                    mostraPortifolio = !mostraPortifolio;
                  });
                },
                child: Row(
                  children: [
                    Icon(Icons.control_point, color: Colors.orange),
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
                        onSubmitted: (value) {
                          setState(() {
                            portifolioText = value;
                            mostraPortifolio = false;
                          });
                        },
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Portfólio: $portifolioText'),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BarraDeNavegacao(selectedIndex: 3, onTap: (int index) {  },),
    );
  }
}
