import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../widgets/MarcasomAppBar.dart';
import '../widgets/barraNavegacao.dart';

class OfferService extends StatelessWidget {
  const OfferService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MarcasomAppBar(title: 'Oferecer Serviço'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 84),
            Text(
              'Em qual cidade deseja oferecer serviço?',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 28,
                height: 1.18, // line height as a multiplier of the font size
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
                // Ação quando uma sugestão é selecionada
                print('Cidade selecionada: $suggestion');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BarraDeNavegacao(selectedIndex: 1),
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
