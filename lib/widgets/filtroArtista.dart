import 'package:flutter/material.dart';

class Filtros extends StatelessWidget {
  const Filtros({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Color(0xFF9B59B6)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Filtros', style: TextStyle(color: Color(0xFF9B59B6))),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Text('Aqui ficam os filtros'),
      ),
    );
  }
}
