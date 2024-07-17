import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../widgets/MarcasomAppBar.dart';
import '../widgets/barraNavegacao.dart';

class OfferService extends StatefulWidget {
  const OfferService({Key? key}) : super(key: key);

  @override
  _OfferServiceState createState() => _OfferServiceState();
}

class _OfferServiceState extends State<OfferService> {
  int _currentStep = 1; // Controla a etapa atual

  String selectedCity = ''; // Guarda a cidade selecionada pelo usuário

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MarcasomAppBar(title: 'Oferecer Serviço'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34.0),
        child: _buildCurrentStep(), // Chama o método para construir a etapa atual
      ),
      bottomNavigationBar: BarraDeNavegacao(selectedIndex: 1),
    );
  }

  Widget _buildCurrentStep() {
    if (_currentStep == 1) {
      return _buildCitySelectionStep();
    } else if (_currentStep == 2) {
      return _buildServiceDaysStep();
    } else if (_currentStep == 3) {
      return _buildAvailableTimeStep();
    } else {
      return Container(); // Retorno padrão caso não haja etapa definida
    }
  }

  Widget _buildCitySelectionStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Em qual cidade deseja oferecer serviço?',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 28,
            height: 1,
            color: Color(0xFF2C3E50),
          ),
        ),
        SizedBox(height: 32),
        TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
            decoration: InputDecoration(
              hintText: 'Insira o nome da cidade',
              hintStyle: TextStyle(
                fontFamily: 'Roboto',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: Color(0xFF2C3E50),
              ),
              filled: true,
              fillColor: Color(0xFFF1F4F3),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          suggestionsCallback: (pattern) async {
            return await getCities(pattern);
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: Text(suggestion),
            );
          },
          onSuggestionSelected: (suggestion) {
            setState(() {
              selectedCity = suggestion;
              _currentStep = 2; // Avança para a próxima etapa
            });
          },
        ),
      ],
    );
  }

  Widget _buildServiceDaysStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dias de serviço disponíveis?',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 28,
            height: 1.18,
            color: Color(0xFF2C3E50),
          ),
        ),
        // Implementar o calendário e lógica de seleção de dias aqui
        // Exemplo: calendário com dias selecionáveis
        SizedBox(height: 32),
        // Botão de navegação para a próxima etapa
        FloatingActionButton(
          onPressed: () {
            setState(() {
              _currentStep = 3; // Avança para a próxima etapa
            });
          },
          backgroundColor: Colors.purple,
          child: Icon(Icons.arrow_forward, color: Colors.white),
        ),
        // Botão para voltar para a etapa anterior
        IconButton(
          onPressed: () {
            setState(() {
              _currentStep = 1; // Volta para a etapa anterior
            });
          },
          icon: Icon(Icons.arrow_back, color: Colors.purple),
        ),
      ],
    );
  }

  Widget _buildAvailableTimeStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Horário disponível para "$selectedCity"',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 28,
            height: 1.18,
            color: Color(0xFF2C3E50),
          ),
        ),
        // Implementar interface para seleção de horários aqui
        // Exemplo: grade de horários disponíveis
        SizedBox(height: 32),
        // Botão de navegação para a próxima etapa
        FloatingActionButton(
          onPressed: () {
            // Implementar ação para avançar para a próxima etapa ou finalizar
          },
          backgroundColor: Colors.purple,
          child: Icon(Icons.arrow_forward, color: Colors.white),
        ),
        // Botão para voltar para a etapa anterior
        IconButton(
          onPressed: () {
            setState(() {
              _currentStep = 2; // Volta para a etapa anterior
            });
          },
          icon: Icon(Icons.arrow_back, color: Colors.purple),
        ),
      ],
    );
  }

  Future<List<String>> getCities(String query) async {
    final response = await http.get(
      Uri.parse('https://servicodados.ibge.gov.br/api/v1/localidades/municipios'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<String> cities = [];
      data.forEach((city) {
        cities.add(city['nome'] + ', ' + city['microrregiao']['mesorregiao']['UF']['sigla']);
      });
      return cities.where((city) => city.toLowerCase().contains(query.toLowerCase())).toList();
    } else {
      throw Exception('Failed to load cities');
    }
  }
}
