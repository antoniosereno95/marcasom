import 'package:flutter/material.dart';

class ResumoReservaScreen extends StatelessWidget {
  final Map<String, dynamic> reserva;

  const ResumoReservaScreen({required this.reserva});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Resumo da Reserva'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Resumo da Reserva',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
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
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  reserva['iconeUsuario'],
                  color: Colors.blue,
                ),
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
                  const SizedBox(width: 5),
                  Text(reserva['local']),
                ],
              ),
            ],
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.orange),
                const SizedBox(width: 5),
                Text(reserva['data']),
                const SizedBox(width: 20),
                Icon(Icons.access_time, color: Colors.orange),
                const SizedBox(width: 5),
                Text(reserva['hora']),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
