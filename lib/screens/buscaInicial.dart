import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/barraNavegacao.dart';
import '../widgets/searchArtist.dart';
import 'loginScreen.dart';

class BuscaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9C27B0),
        elevation: 0,
        centerTitle: true,
        title: const Text('Busca Inicial'),
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

                //ja tentei de tudo pra arrumar esse overflow do logout
                //mas nada deu certo
                //quem quiser tentar, ajuda ai
                //negocio é que precisa do texto pq o botao é de logout
                //ou no minimo tem que arrumar um icon mais adequado pra situação
                //tipo um x com um circulo ou algo do tipo

              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFFAFAFA),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/ImagemDaHome.svg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Artistas locais a poucos\ncliques de você',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 2 - 80), 
                  Align(
                    alignment: Alignment.center,
                    child: SearchArtist(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BarraDeNavegacao(selectedIndex: 0),
    );
  }
}
