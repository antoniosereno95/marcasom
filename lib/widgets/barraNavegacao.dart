import 'package:flutter/material.dart';

class BarraDeNavegacao extends StatelessWidget {
  final int selectedIndex;

  BarraDeNavegacao({required this.selectedIndex});

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/feed');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/minhasreservas');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/perfil');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFF9C27B0),
      selectedItemColor: Colors.yellow,
      unselectedItemColor: Colors.white,
      currentIndex: selectedIndex,
      onTap: (index) => _onItemTapped(context, index),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Busca',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.music_note),
          label: 'Feed',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Calendario',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }
}
