import 'package:flutter/material.dart';
import 'package:marcasom/screens/loginScreen.dart';

import '../widgets/barraNavegacao.dart';

class PerfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9C27B0),
        elevation: 0,
        centerTitle: true,
        title: const Text('Perfil do Usuario'),
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
      body: Center(
        child: Text('Perfil do Usuario'),
      ),
      bottomNavigationBar: BarraDeNavegacao(selectedIndex: 3),
    );
  }
}
