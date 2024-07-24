import 'package:flutter/material.dart';
import 'package:marcasom/screens/perfilArtistScreen.dart';
import 'package:marcasom/widgets/filtroArtista.dart';

final List<Map<String, String>> musicians = [
    {
      "nome": "Sibá",
      "tipo": "Solo",
      "generoMusical": "MPB",
      "cache": "R\$ 150,00/Hora",
      "avaliacao": "4.8",
      "local": "Garanhuns",
      "dataNascimento": "01/02/2000",
      "contato": "(87) 9-9876-4567",
      "email": "email@email.com"
    },
    {
      "nome": "Alice in Chains",
      "tipo": "Banda",
      "generoMusical": "Rock",
      "cache": "R\$ 250,00/Hora",
      "avaliacao": "4.7",
      "local": "Recife",
      "dataNascimento": "01/02/2000",
      "contato": "(81) 9-9876-4567",
      "email": "email@email.com"
    },
    {
      "nome": "Sabotagem",
      "tipo": "Solo",
      "generoMusical": "RAP",
      "cache": "R\$ 100,00/Hora",
      "avaliacao": "5.0",
      "local": "Caruaru",
      "dataNascimento": "01/02/2003",
      "contato": "(81) 9-9876-4567",
      "email": "email@email.com"
    },
    {
      "nome": "Aline e os Trevosos",
      "tipo": "Trio",
      "generoMusical": "MPB",
      "cache": "R\$ 50,00/Hora",
      "avaliacao": "2.5",
      "local": "Garanhuns",
      "dataNascimento": "01/02/2000",
      "contato": "(87) 9-9876-4567",
      "email": "email@email.com"
    },
    {
      "nome": "DJ Sapeka",
      "tipo": "Solo",
      "generoMusical": "Eletrônica",
      "cache": "R\$ 450,00/Hora",
      "avaliacao": "3.5",
      "local": "Recife",
      "dataNascimento": "01/02/2000",
      "contato": "(81) 9-9876-4567",
      "email": "email@email.com"
    },
    {
      "nome": "Jeito Moleque",
      "tipo": "Trio",
      "generoMusical": "Samba",
      "cache": "R\$ 600,00/Hora",
      "avaliacao": "1.7",
      "local": "Caruaru",
      "dataNascimento": "01/02/2003",
      "contato": "(81) 9-9876-4567",
      "email": "email@email.com"
    },
    {
      "nome": "Sliptknot",
      "tipo": "Banda",
      "generoMusical": "Rock",
      "cache": "R\$ 10,00/Hora",
      "avaliacao": "4.3",
      "local": "Garanhuns",
      "dataNascimento": "01/02/2000",
      "contato": "(87) 9-9876-4567",
      "email": "email@email.com"
    },
    {
      "nome": "Forró Alegre",
      "tipo": "Banda",
      "generoMusical": "Forró",
      "cache": "R\$ 200,00/Hora",
      "avaliacao": "4.8",
      "local": "Caruaru",
      "dataNascimento": "23/06/1990",
      "contato": "(81) 9-6543-2109",
      "email": "forro@musica.com"
    },
    {
      "nome": "Jazz & Blues",
      "tipo": "Banda",
      "generoMusical": "Jazz",
      "cache": "R\$ 320,00/Hora",
      "avaliacao": "4.7",
      "local": "Recife",
      "dataNascimento": "18/11/1985",
      "contato": "(81) 9-2345-6789",
      "email": "jazzblues@musica.com"
    },
    {
      "nome": "Café com Samba",
      "tipo": "Banda",
      "generoMusical": "Samba",
      "cache": "R\$ 300,00/Hora",
      "avaliacao": "4.7",
      "local": "Caruaru",
      "dataNascimento": "23/11/1985",
      "contato": "(81) 9-9012-3456",
      "email": "cafe@musica.com"
    },
    {
      "nome": "Rock Fusion",
      "tipo": "Banda",
      "generoMusical": "Rock",
      "cache": "R\$ 330,00/Hora",
      "avaliacao": "4.8",
      "local": "Garanhuns",
      "dataNascimento": "17/02/1990",
      "contato": "(87) 9-3456-7890",
      "email": "rockfusion@musica.com"
    },
    {
      "nome": "Luzia & the Jazz",
      "tipo": "Banda",
      "generoMusical": "Jazz",
      "cache": "R\$ 300,00/Hora",
      "avaliacao": "4.6",
      "local": "Recife",
      "dataNascimento": "14/03/1985",
      "contato": "(81) 9-8765-4321",
      "email": "luzia@musica.com"
    },
    {
      "nome": "Jovem DJ",
      "tipo": "DJ",
      "generoMusical": "Eletrônica",
      "cache": "R\$ 350,00/Hora",
      "avaliacao": "4.7",
      "local": "Recife",
      "dataNascimento": "09/11/1995",
      "contato": "(87) 9-5432-1098",
      "email": "jovemdj@musica.com"
    },
    {
      "nome": "Maria do Samba",
      "tipo": "Artista Solo",
      "generoMusical": "Samba",
      "cache": "R\$ 280,00/Hora",
      "avaliacao": "4.9",
      "local": "Recife",
      "dataNascimento": "30/12/1982",
      "contato": "(81) 9-4321-6789",
      "email": "maria@musica.com"
    },
    {
      "nome": "Rockstar Recife",
      "tipo": "Banda",
      "generoMusical": "Rock",
      "cache": "R\$ 400,00/Hora",
      "avaliacao": "4.5",
      "local": "Recife",
      "dataNascimento": "15/08/2001",
      "contato": "(81) 9-3210-9876",
      "email": "rockstar@musica.com"
    },
    {
      "nome": "Ritmo Tropical",
      "tipo": "Banda",
      "generoMusical": "Sertanejo",
      "cache": "R\$ 260,00/Hora",
      "avaliacao": "4.6",
      "local": "Garanhuns",
      "dataNascimento": "12/10/1992",
      "contato": "(87) 9-3456-7890",
      "email": "ritmo@musica.com"
    },
    {
      "nome": "Festa Pop",
      "tipo": "Banda",
      "generoMusical": "Pop",
      "cache": "R\$ 360,00/Hora",
      "avaliacao": "4.9",
      "local": "Caruaru",
      "dataNascimento": "26/07/1992",
      "contato": "(81) 9-4567-8901",
      "email": "festa@musica.com"
    },
    {
      "nome": "Rockway",
      "tipo": "Banda",
      "generoMusical": "Rock",
      "cache": "R\$ 290,00/Hora",
      "avaliacao": "4.7",
      "local": "Jaboatão dos Guararapes",
      "dataNascimento": "15/04/1990",
      "contato": "(81) 9-4567-8901",
      "email": "rockway@musica.com"
    },
    {
      "nome": "Léo & o Forró",
      "tipo": "Banda",
      "generoMusical": "Forró",
      "cache": "R\$ 230,00/Hora",
      "avaliacao": "4.6",
      "local": "Igarassu",
      "dataNascimento": "22/05/1988",
      "contato": "(81) 9-5678-9012",
      "email": "leo@musica.com"
    },
    {
      "nome": "Duo Samba & Jazz",
      "tipo": "Duo",
      "generoMusical": "Samba",
      "cache": "R\$ 270,00/Hora",
      "avaliacao": "4.8",
      "local": "Paulista",
      "dataNascimento": "11/09/1985",
      "contato": "(81) 9-6789-0123",
      "email": "duosamba@musica.com"
    },
    {
      "nome": "Vocal Jazz",
      "tipo": "Grupo",
      "generoMusical": "Jazz",
      "cache": "R\$ 310,00/Hora",
      "avaliacao": "4.7",
      "local": "Olinda",
      "dataNascimento": "03/02/1990",
      "contato": "(81) 9-7890-1234",
      "email": "vocalJazz@musica.com"
    },
    {
      "nome": "Jazz Express",
      "tipo": "Banda",
      "generoMusical": "Jazz",
      "cache": "R\$ 340,00/Hora",
      "avaliacao": "4.9",
      "local": "Recife",
      "dataNascimento": "21/05/1982",
      "contato": "(81) 9-8901-2345",
      "email": "jazzexpress@musica.com"
    },
    {
      "nome": "Funk da Feira",
      "tipo": "Banda",
      "generoMusical": "Funk",
      "cache": "R\$ 280,00/Hora",
      "avaliacao": "4.6",
      "local": "Caruaru",
      "dataNascimento": "30/06/1994",
      "contato": "(81) 9-8901-2345",
      "email": "funkdafeira@musica.com"
    },
    {
      "nome": "Ritmo de Agreste",
      "tipo": "Solo",
      "generoMusical": "Rock",
      "cache": "R\$ 300,00/Hora",
      "avaliacao": "4.5",
      "local": "Garanhuns",
      "dataNascimento": "11/02/1989",
      "contato": "(87) 9-9012-3456",
      "email": "ritmodeagreste@musica.com"
    },
    {
      "nome": "Jazz no Capibaribe",
      "tipo": "Trio",
      "generoMusical": "Jazz",
      "cache": "R\$ 320,00/Hora",
      "avaliacao": "4.8",
      "local": "Recife",
      "dataNascimento": "07/05/1983",
      "contato": "(81) 9-0123-4567",
      "email": "jazznocapibaribe@musica.com"
    },
    {
      "nome": "Cumbia de Sertão",
      "tipo": "Banda",
      "generoMusical": "Cumbia",
      "cache": "R\$ 270,00/Hora",
      "avaliacao": "4.7",
      "local": "Caruaru",
      "dataNascimento": "22/08/1991",
      "contato": "(81) 9-1234-5678",
      "email": "cumbiadsertao@musica.com"
    },
    {
      "nome": "Sons da Serra",
      "tipo": "Solo",
      "generoMusical": "MPB",
      "cache": "R\$ 260,00/Hora",
      "avaliacao": "4.6",
      "local": "Garanhuns",
      "dataNascimento": "03/12/1987",
      "contato": "(87) 9-2345-6789",
      "email": "sonsdaserra@musica.com"
    },
    {
      "nome": "Maré de Recife",
      "tipo": "Grupo",
      "generoMusical": "Rock",
      "cache": "R\$ 310,00/Hora",
      "avaliacao": "4.7",
      "local": "Recife",
      "dataNascimento": "18/09/1990",
      "contato": "(81) 9-3456-7890",
      "email": "marederecife@musica.com"
    },
    {
      "nome": "Melodia das Montanhas",
      "tipo": "Banda",
      "generoMusical": "MPB",
      "cache": "R\$ 290,00/Hora",
      "avaliacao": "4.8",
      "local": "Garanhuns",
      "dataNascimento": "12/04/1985",
      "contato": "(87) 9-4567-8901",
      "email": "melodiadasmontanhas@musica.com"
    },
    {
      "nome": "Pop na Praça",
      "tipo": "Trio",
      "generoMusical": "Pop",
      "cache": "R\$ 340,00/Hora",
      "avaliacao": "4.9",
      "local": "Caruaru",
      "dataNascimento": "27/11/1993",
      "contato": "(81) 9-5678-9012",
      "email": "popnapraca@musica.com"
    },
    {
      "nome": "Soul do Recife",
      "tipo": "Solo",
      "generoMusical": "MPB",
      "cache": "R\$ 330,00/Hora",
      "avaliacao": "4.7",
      "local": "Recife",
      "dataNascimento": "14/03/1988",
      "contato": "(81) 9-6789-0123",
      "email": "souldorecife@musica.com"
    }
];
class ListagemArtista extends StatefulWidget {
  const ListagemArtista({super.key, required this.data, this.genero = '', required this.local});
  
  final String local;
  final String data;
  final String genero;

@override
  _ListagemArtistaState createState() => _ListagemArtistaState();
}

  class _ListagemArtistaState extends State<ListagemArtista> {
  String _filterOption = '';

  void _updateFilter(String filterOption) {
    setState(() {
      _filterOption = filterOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredMusicians = musicians.where((musician) => (musician['generoMusical'] == widget.genero && musician['local'] == widget.local)).toList();

    if(widget.genero == ''){
      filteredMusicians = musicians.where((musician) => (musician['local'] == widget.local)).toList();
    }

    // Ordenar conforme a opção selecionada
    switch (_filterOption) {
      case 'Mais antigo no mercado':
        filteredMusicians.sort((a, b) => int.parse(a['dataNascimento']!.split('/')[2]).compareTo(int.parse(b['dataNascimento']!.split('/')[2])));
        break;
      case 'Preço mais baixo':
        filteredMusicians.sort((a, b) => double.parse(a['cache']!.replaceAll(RegExp(r'[^\d]'), '')).compareTo(double.parse(b['cache']!.replaceAll(RegExp(r'[^\d]'), ''))));
        break;
      case 'Melhor avaliado':
        filteredMusicians.sort((a, b) => double.parse(b['avaliacao']!).compareTo(double.parse(a['avaliacao']!)));
        break;
      case 'Preço mais alto':
        filteredMusicians.sort((a, b) => double.parse(a['cache']!.replaceAll(RegExp(r'[^\d]'), '')).compareTo(double.parse(b['cache']!.replaceAll(RegExp(r'[^\d]'), ''))));
        filteredMusicians = filteredMusicians.reversed.toList(); // Inverter a lista para obter o preço mais alto primeiro
        break;
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 2.5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Color(0xFFA0A0A0)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            GestureDetector(
              onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Filtros()),
              );
              if (result != null) {
                _updateFilter(result as String);
              }
            },
              child: const Text(
                'Filtros',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFE67E22),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
          Expanded(
            child: ListaArtistas(musicians: filteredMusicians),
          ),
        ],
      ),
    );
  }
}

class ListaArtistas extends StatelessWidget {
  const ListaArtistas({
    super.key,
    required this.musicians,
  });

  final List<Map<String, String>> musicians;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: musicians.length,
      itemBuilder: (context, index) {
        return ArtistaCard(musicians: musicians, i: index);
      },
    );
  }
}

class ArtistaCard extends StatelessWidget {
  const ArtistaCard({
    super.key,
    required this.musicians,
    required this.i,
  });
  
  final int i;
  final List<Map<String, String>> musicians;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/PerfilIcon.png'),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    musicians[i]['nome']!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(musicians[i]['tipo']!),
                  Text('Gênero musical: ${musicians[i]['generoMusical']!}'),
                  Row(
                    children: [
                      Text(
                        musicians[i]['cache']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.star,
                        color: Colors.yellow[700],
                      ),
                      Text(musicians[i]['avaliacao']!),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PerfilArtistaScreen(artista: musicians[i]),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
