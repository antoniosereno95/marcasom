import 'package:flutter/material.dart';

import '../widgets/MarcasomAppBar.dart';
import '../widgets/barraNavegacao.dart';
import '../widgets/searchArtist.dart';

class BuscaInicial extends StatelessWidget {
  const BuscaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MarcasomAppBar(title: 'Busca Inicial'),
      backgroundColor: const Color(0xFFFAFAFA),
      body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SearchArtist(),
            ),
          ),
      bottomNavigationBar: BarraDeNavegacao(selectedIndex: 0),
    );
  }
}
