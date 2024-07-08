import 'package:flutter/material.dart';

class BuscaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/logo marcasom tela inicial.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Artistas locais a poucos\ncliques de você',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.location_city),
                        hintText: 'Cidade',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.music_note),
                        hintText: 'Gênero Musical',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today),
                        hintText: 'Hoje',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.filter_list),
                        hintText: 'Preferências',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Ação ao clicar no botão de procurar
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF9C27B0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          'Procurar',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Artistas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil',
          ),
        ],
        selectedItemColor: Colors.purple,
      ),
    );
  }
}