import 'package:flutter/material.dart';
import 'package:marcasom/widgets/cardReservation.dart';

class ReservasArquivadasScreen extends StatelessWidget {
  final List<Map<String, dynamic>> archivedReservations;

  const ReservasArquivadasScreen({super.key, required this.archivedReservations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservas Arquivadas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: archivedReservations.length,
          itemBuilder: (context, index) {
            final reserva = archivedReservations[index];
            return ReservationCard(reserva: reserva);
          },
        ),
      ),
    );
  }
}