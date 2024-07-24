import 'package:flutter/material.dart';
import 'package:marcasom/screens/resumoDaReserva.dart';

class ReservationCard extends StatelessWidget {
  final Map<String, dynamic> reserva;

  const ReservationCard({super.key, required this.reserva});

  @override
  Widget build(BuildContext context) {
    Widget statusWidget;
    bool isClickable = true;

    if (reserva['status'] == 'Cancelado') {
      statusWidget = const Row(
        children: [
          Icon(
            Icons.block,
            color: Color(0xFFA0A0A0),
          ),
          SizedBox(width: 10),
          Text(
            "Reserva Cancelada",
            style: TextStyle(
              color: Color(0xFFA0A0A0),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
      isClickable = false; 
    } else if (reserva['status'] == 'Finalizado com sucesso') {
      statusWidget = const SizedBox.shrink();
      isClickable = false;
    } else {
      statusWidget = Row(
        children: [
          Icon(
            reserva['iconeStatus'],
            color: reserva['status'] == 'Confirmado' ? Colors.green : Colors.orange,
          ),
          const SizedBox(width: 10),
          Text(
            reserva['status'],
            style: TextStyle(
              color: reserva['status'] == 'Confirmado' ? Colors.green : Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    }

    return GestureDetector(
      onTap: isClickable 
          ? () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ResumoReservaScreen(reserva: reserva),
                ),
              );
            }
          : null,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              statusWidget,
              const SizedBox(height: 5),
              Row(
                children: [
                  Icon(reserva['iconeUsuario'], color: Colors.blue),
                  const SizedBox(width: 10),
                  Text(
                    reserva['nome'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(reserva['tipoUsuario']),
              if (reserva.containsKey('generoMusical')) ...[
                const SizedBox(height: 5),
                Text(reserva['generoMusical']),
              ],
              if (reserva.containsKey('local')) ...[
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.orange),
                    const SizedBox(width: 5),
                    Text(reserva['local']),
                  ],
                ),
              ],
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.orange),
                  const SizedBox(width: 5),
                  Text(reserva['data']),
                  const SizedBox(width: 20),
                  const Icon(Icons.access_time, color: Colors.orange),
                  const SizedBox(width: 5),
                  Text(reserva['hora']),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
