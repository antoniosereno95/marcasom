import 'package:flutter/material.dart';

class Filtros extends StatelessWidget {
  const Filtros({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Color(0xFF9B59B6)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Filtros', style: TextStyle(color: Color(0xFF9B59B6))),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const Center(
        child: Text('Aqui ficam os filtros'),
      ),
    );
  }
}
