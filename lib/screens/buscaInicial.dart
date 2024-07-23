import 'package:flutter/material.dart';
import '../widgets/SearchArtist.dart';
import '../widgets/barraNavegacao.dart';

class BuscaInicial extends StatelessWidget {
  const BuscaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/marcasom 1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: const SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Artistas locais a poucos cliques de você!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: SearchArtist(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BarraDeNavegacao(
        selectedIndex: 0,
        onTap: (int index) {},
      ),
    );
  }
}
