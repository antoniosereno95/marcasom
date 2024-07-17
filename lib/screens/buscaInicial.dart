import 'package:flutter/material.dart';
import '../widgets/SearchArtist.dart';
import '../widgets/barraNavegacao.dart';

class BuscaInicial extends StatelessWidget {
  const BuscaInicial({Key? key}) : super(key: key);

//Icone seta do filtro: arrow_back_ios

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/marcasom 1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Artistas locais a poucos cliques de você!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              SearchArtist(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BarraDeNavegacao(selectedIndex: 0, onTap: (int index) {  },),
    );
  }
}
