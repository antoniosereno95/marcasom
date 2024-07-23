import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import '../screens/listagemArtista.dart';

class SearchArtist extends StatefulWidget {
  @override
  _SearchArtistState createState() => _SearchArtistState();
}

class _SearchArtistState extends State<SearchArtist> {
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); //Implemetei a validação dos inputs tbm

  Future<List<String>> _getCities(String pattern) async {
    final response = await http.get(
      Uri.parse('https://servicodados.ibge.gov.br/api/v1/localidades/municipios'),
    );

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      List<String> cities = data.map((city) => city['nome'] as String).toList();
      return cities.where((city) => city.toLowerCase().contains(pattern.toLowerCase())).toList();
    } else {
      throw Exception('Failed to load cities');
    }
  } //Adicionei a API dos municipios brasileiros pra dar um Plus ^-^

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      locale: const Locale('pt', 'BR'),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('dd/MM/yyyy', 'pt_BR').format(picked);
      });
    } //Achei essa API para selecionar a data e consegui colocar em português
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 5),
            TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: _cityController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.location_on),
                  hintText: 'Cidade',
                  border: InputBorder.none,
                ),
              ),
              suggestionsCallback: (pattern) async {
                return await _getCities(pattern);
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              onSuggestionSelected: (suggestion) {
                setState(() {
                  _cityController.text = suggestion;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira a cidade.';
                }
                return null;
              },
            ),
            const SizedBox(height: 5),
            Container(
              width: double.infinity,
              height: 1.0,
              color: const Color(0xFFA0A0A0),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: _genreController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.music_note),
                hintText: 'Gênero Musical',
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o gênero musical.';
                }
                return null;
              },
            ),
            const SizedBox(height: 5),
            Container(
              width: double.infinity,
              height: 1.0,
              color: const Color(0xFFA0A0A0),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: _dateController,
              readOnly: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.calendar_today),
                hintText: 'Data',
                border: InputBorder.none,
              ),
              onTap: () {
                _selectDate(context);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, selecione uma data.';
                }
                return null;
              },
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListagemArtista()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9B59B6),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10.0),
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    'Procurar',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
