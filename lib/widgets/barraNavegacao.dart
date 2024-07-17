import 'package:flutter/material.dart';
import 'package:marcasom/screens/buscaInicial.dart';
import 'package:marcasom/screens/offerService.dart';
import 'package:marcasom/screens/minhasReservas.dart';
import 'package:marcasom/screens/perfilScreen.dart';
import 'package:page_transition/page_transition.dart';

class BarraDeNavegacao extends StatelessWidget {
  final int selectedIndex;

  const BarraDeNavegacao({required this.selectedIndex});

  void _onItemTapped(BuildContext context, int index) {
    Widget page;
    switch (index) {
      case 0:
        page = const BuscaInicial();
        break;
      case 1:
        page = const OfferService();
        break;
      case 2:
        page = MinhasReservasScreen();
        break;
      case 3:
        page = const PerfilScreen();
        break;
      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF9C27B0),
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => _onItemTapped(context, index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Oferecer Serviço',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Minhas Reservas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Meu Perfil',
          ),
        ],
      ),
    );
  }
}
