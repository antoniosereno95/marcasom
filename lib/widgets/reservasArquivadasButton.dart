import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:marcasom/screens/ReservasArquivadasScreen.dart';

class ReservasArquivadasWidget extends StatelessWidget {
  final List<Map<String, dynamic>> archivedReservations;

  const ReservasArquivadasWidget({required this.archivedReservations});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReservasArquivadasScreen(
              archivedReservations: archivedReservations,
            ),
          ),
        );
      },
      child: Container(
        width: 321,
        height: 27,
        margin: const EdgeInsets.only(top: 20),
        alignment: Alignment.center,
        child: Text(
          'Reservas Arquivadas',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 22,
            height: 1.18, // line height as a multiplier of the font size
            color: Color(0xFFE67E22),
          ),
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              spreadRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
      ),
    );
  }
}