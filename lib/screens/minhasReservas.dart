import 'package:flutter/material.dart';
import '../widgets/MarcasomAppBar.dart';
import '../widgets/barraNavegacao.dart';

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
      'nome': 'Jeito Moleque',
      'generoMusical': 'Gênero Musical: Samba',
      'local': 'Bar do Cão',
      'data': '21/07/2024',
      'hora': '22:30h',
      'iconeStatus': Icons.check_circle,
      'iconeUsuario': Icons.mic,
    },
    {
      'status': 'Em analise',
      'tipoUsuario': 'Artista',
      'nome': 'Sliptknot',
      'generoMusical': 'Gênero Musical: Hard Rock',
      'local': 'Bar do Rock',
      'data': '28/07/2024',
      'hora': '23:30h',
      'iconeStatus': Icons.check_circle,
      'iconeUsuario': Icons.mic,
    },
    {
      'status': 'Confirmado',
      'tipoUsuario': 'Artista',
      'nome': 'Sibá',
      'generoMusical': 'Gênero Musical: MPB',
      'local': 'Bar Dom Pedro',
      'data': '19/07/2024',
      'hora': '20:00h',
      'iconeStatus': Icons.check_circle,
      'iconeUsuario': Icons.mic,
    },
    {
      'status': 'Em analise',
      'tipoUsuario': 'Artista',
      'nome': 'Alice in Chains',
      'generoMusical': 'Gênero Musical: Rock',
      'local': 'Bar caverna do Dragão',
      'data': '4/07/2029',
      'hora': '21:30h',
      'iconeStatus': Icons.check_circle,
      'iconeUsuario': Icons.mic,
    },
    {
      'status': 'Confirmado',
      'tipoUsuario': 'Artista',
      'nome': 'Sabotagem',
      'generoMusical': 'Gênero Musical: RAP',
      'local': 'Arena da Eterna Lembrança',
      'data': '12/07/1993',
      'hora': '29:72h',
      'iconeStatus': Icons.check_circle,
      'iconeUsuario': Icons.mic,
    },
  ];

  MinhasReservas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MarcasomAppBar(title: 'Minhas Reservas'),
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
