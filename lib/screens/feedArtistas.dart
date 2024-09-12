import 'package:flutter/material.dart';
import '../widgets/MarcasomAppBar.dart';
import '../widgets/barraNavegacao.dart';

class FeedArtistas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MarcasomAppBar(title: 'Feed de Artistas'),
      body: const Center(
        child: Text('Tela de Feed de Artistas'),
      ),
      bottomNavigationBar: BarraDeNavegacao(selectedIndex: 1),
    );
  }
}
