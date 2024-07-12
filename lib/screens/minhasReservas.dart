import 'package:flutter/material.dart';
import '../widgets/barraNavegacao.dart';
import 'loginScreen.dart';

class MinhasReservas extends StatelessWidget {
  final List<Map<String, dynamic>> reservas = [
    {
      'status': 'Confirmado',
      'tipoUsuario': 'Artista',
      'nome': 'Aline e os Trevosos',
      'generoMusical': 'Gênero Musical: MPB',
      'local': 'Bar do Seu Peu',
      'data': '12/07/2024',
      'hora': '21:30h',
      'iconeStatus': Icons.check_circle,
      'iconeUsuario': Icons.mic,
    },
    {
      'status': 'Em analise',
      'tipoUsuario': 'Artista',
      'nome': 'DJ Sapeka',
      'generoMusical': 'Gênero Musical: Tudo e mais um Pouco',
      'local': 'Espetinho Universitário',
      'data': '13/07/2024',
      'hora': '18:30h',
      'iconeStatus': Icons.timelapse,
      'iconeUsuario': Icons.mic,
    },
    {
      'status': 'Confirmado',
      'tipoUsuario': 'Artista',
      'nome': 'Aline e os Trevosos',
      'generoMusical': 'Gênero Musical: MPB',
      'local': 'Bar do Seu Peu',
      'data': '12/07/2024',
      'hora': '21:30h',
      'iconeStatus': Icons.check_circle,
      'iconeUsuario': Icons.mic,
    },
    {
      'status': 'Confirmado',
      'tipoUsuario': 'Artista',
      'nome': 'Aline e os Trevosos',
      'generoMusical': 'Gênero Musical: MPB',
      'local': 'Bar do Seu Peu',
      'data': '12/07/2024',
      'hora': '21:30h',
      'iconeStatus': Icons.check_circle,
      'iconeUsuario': Icons.mic,
    },
    {
      'status': 'Confirmado',
      'tipoUsuario': 'Artista',
      'nome': 'Aline e os Trevosos',
      'generoMusical': 'Gênero Musical: MPB',
      'local': 'Bar do Seu Peu',
      'data': '12/07/2024',
      'hora': '21:30h',
      'iconeStatus': Icons.check_circle,
      'iconeUsuario': Icons.mic,
    },
    {
      'status': 'Confirmado',
      'tipoUsuario': 'Artista',
      'nome': 'Aline e os Trevosos',
      'generoMusical': 'Gênero Musical: MPB',
      'local': 'Bar do Seu Peu',
      'data': '12/07/2024',
      'hora': '21:30h',
      'iconeStatus': Icons.check_circle,
      'iconeUsuario': Icons.mic,
    },
    {
      'status': 'Confirmado',
      'tipoUsuario': 'Artista',
      'nome': 'Aline e os Trevosos',
      'generoMusical': 'Gênero Musical: MPB',
      'local': 'Bar do Seu Peu',
      'data': '12/07/2024',
      'hora': '21:30h',
      'iconeStatus': Icons.check_circle,
      'iconeUsuario': Icons.mic,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9C27B0),
        elevation: 0,
        centerTitle: true,
        title: const Text('Minhas Reservas'),
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
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: reservas.length,
        itemBuilder: (context, index) {
          final reserva = reservas[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    SizedBox(height: 5),
                    Text(reserva['generoMusical']),
                  ],
                  if (reserva.containsKey('local')) ...[
                    SizedBox(height: 5),
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
          );
        },
      ),
      bottomNavigationBar: BarraDeNavegacao(selectedIndex: 2),
    );
  }
}
