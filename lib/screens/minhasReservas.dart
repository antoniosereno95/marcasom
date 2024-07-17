import 'package:flutter/material.dart';
import 'package:marcasom/widgets/barraNavegacao.dart';
import 'package:marcasom/widgets/cardReservation.dart';
import 'package:marcasom/widgets/reservasArquivadasButton.dart';

class MinhasReservasScreen extends StatefulWidget {
  @override
  _MinhasReservasScreenState createState() => _MinhasReservasScreenState();
}

class _MinhasReservasScreenState extends State<MinhasReservasScreen> {
  List<Map<String, dynamic>> reservas = [
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
      'status': 'Em análise',
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
      'status': 'Em análise',
      'tipoUsuario': 'Artista',
      'nome': 'Sliptknot',
      'generoMusical': 'Gênero Musical: Hard Rock',
      'local': 'Bar do Rock',
      'data': '28/07/2024',
      'hora': '23:30h',
      'iconeStatus': Icons.check_circle,
      'iconeUsuario': Icons.mic,
    },
  ];

  List<Map<String, dynamic>> archivedReservations = [
    {
      'status': 'Finalizado com sucesso',
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
      'status': 'Cancelado',
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
      'status': 'Finalizado com sucesso',
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

  void _archiveReservation(Map<String, dynamic> reservation) {
    setState(() {
      reservas.remove(reservation);
      archivedReservations.insert(0, reservation);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Reservas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: reservas.length,
                itemBuilder: (context, index) {
                  final reserva = reservas[index];
                  return Dismissible(
                    key: Key(reserva.toString()),
                    onDismissed: (direction) {
                      _archiveReservation(reserva);
                    },
                    child: ReservationCard(reserva: reserva),
                  );
                },
              ),
            ),
            ReservasArquivadasWidget(archivedReservations: archivedReservations),
          ],
        ),
      ),
      bottomNavigationBar: BarraDeNavegacao(selectedIndex: 2),
    );
  }
}