import 'package:flutter/material.dart';

class Filtros extends StatelessWidget {
  const Filtros({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Color(0xFF9B59B6)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Filtros', style: TextStyle(color: Color(0xFF9B59B6))),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const Center(
        child: OrdenarPorScreen(),
      ),
    );
  }
}

class OrdenarPorScreen extends StatefulWidget {
  const OrdenarPorScreen({super.key});

  @override
  _OrdenarPorScreenState createState() => _OrdenarPorScreenState();
}

class _OrdenarPorScreenState extends State<OrdenarPorScreen> {
  String _selectedOption = '';

  void _applyFilters() {
    // Navegar de volta para a tela de listagem de artistas com o filtro selecionado
    Navigator.pop(context, _selectedOption);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ordenar por',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              setState(() {
                _selectedOption = '';
              });
            },
            child: const Text(
              'Limpar tudo',
              style: TextStyle(color: Color(0xFFE67E22)),
            ),
          ),
          const SizedBox(height: 20),
          RadioListTile<String>(
            title: const Text('Mais antigo no mercado'),
            value: 'Mais antigo no mercado',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value!;
              });
            },
            secondary: const Icon(Icons.align_vertical_bottom_rounded),
          ),
          RadioListTile<String>(
            title: const Text('Preço mais baixo'),
            value: 'Preço mais baixo',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value!;
              });
            },
            secondary: const Icon(Icons.attach_money),
          ),
          RadioListTile<String>(
            title: const Text('Melhor avaliado'),
            value: 'Melhor avaliado',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value!;
              });
            },
            secondary: const Icon(Icons.star),
          ),
          RadioListTile<String>(
            title: const Text('Preço mais alto'),
            value: 'Preço mais alto',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value!;
              });
            },
            secondary: const Icon(Icons.call_made_sharp),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _applyFilters,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: const Color(0xFFE67E22),
            ),
            child: const Text('Aplicar'),
          ),
        ],
      ),
    );
  }
}
