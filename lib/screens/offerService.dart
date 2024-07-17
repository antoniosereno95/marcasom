import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/barraNavegacao.dart';

class OfferService extends StatefulWidget {
  const OfferService({Key? key}) : super(key: key);

  @override
  _OfferServiceState createState() => _OfferServiceState();
}

class _OfferServiceState extends State<OfferService> {
  int _currentStep = 1; 
  String selectedCity = ''; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34.0),
        child: _buildCurrentStep(),
      ),
      bottomNavigationBar: BarraDeNavegacao(
        selectedIndex: 1,
        onTap: (index) => _navigateToOfferService(index),
      ),
    );
  }

  void _navigateToOfferService(int index) {
    if (index == 1 && _currentStep != 1) {
      setState(() {
        _currentStep = 1; 
      });
    }
  }

  Widget _buildCurrentStep() {
    if (_currentStep == 1) {
      return _buildCitySelectionStep();
    } else if (_currentStep == 2) {
      return _buildServiceDaysStep();
    } else if (_currentStep == 3) {
      return _buildAvailableTimeStep();
    } else {
      return Container();
    }
  }

  Widget _buildCitySelectionStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Row(
          children: [
            SizedBox(height: 10),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              }, 
              icon: Icon(Icons.close, color: Colors.purple),
            ),
          ],
        ),
        SizedBox(height: 20),
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
        SizedBox(height: 20),
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
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
              _currentStep = 2; 
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
        IconButton(
          onPressed: () {
            setState(() {
              _currentStep = 1; 
            });
          },
          icon: Icon(Icons.arrow_back, color: Colors.purple),
          
        ),
        SizedBox(height: 16),
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
        SizedBox(height: 32),
        Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                _currentStep = 3; 
              });
            },
            backgroundColor: Colors.purple,
            label: Icon(Icons.arrow_forward, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildAvailableTimeStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              _currentStep = 2; 
            });
          },
          icon: Icon(Icons.arrow_back, color: Colors.purple),
        ),
        SizedBox(height: 16),
        Text(
          'Horário disponível para tal dia',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 28,
            height: 1.18,
            color: Color(0xFF2C3E50),
          ),
        ),
        SizedBox(height: 32),
        Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton.extended(
            onPressed: () {
            },
            backgroundColor: Colors.purple,
            label: Icon(Icons.arrow_forward, color: Colors.white),
          ),
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
