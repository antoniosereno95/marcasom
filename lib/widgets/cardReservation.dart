import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marcasom/screens/resumoDaReserva.dart';

class ReservationCard extends StatelessWidget {
  final Map<String, dynamic> reserva;

  ReservationCard({required this.reserva});

  @override
  Widget build(BuildContext context) {
    Widget statusWidget;
    bool isClickable = true; // Variável para controlar a clicabilidade do card

    if (reserva['status'] == 'Cancelado') {
      statusWidget = Row(
        children: [
          Icon(
            Icons.block,
            color: Color(0xFFA0A0A0),
          ),
          const SizedBox(width: 10),
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
      statusWidget = SizedBox.shrink();
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
      onTap: isClickable // Verifica se o card é clicável
          ? () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ResumoReservaScreen(reserva: reserva),
                ),
              );
            }
          : null, // Se não for clicável, define como null para desativar o onTap
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
              offset: Offset(0, 4),
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
                    Icon(Icons.location_on, color: Colors.orange),
                    SizedBox(width: 5),
                    Text(reserva['local']),
                  ],
                ),
              ],
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.orange),
                  SizedBox(width: 5),
                  Text(reserva['data']),
                  SizedBox(width: 20),
                  Icon(Icons.access_time, color: Colors.orange),
                  SizedBox(width: 5),
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