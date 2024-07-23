import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import '../widgets/barraNavegacao.dart';

class OfferService extends StatefulWidget {
  const OfferService({Key? key}) : super(key: key);

  @override
  _OfferServiceState createState() => _OfferServiceState();
}

class _OfferServiceState extends State<OfferService> {
  final _formKey = GlobalKey<FormState>();
  String artistName = '';
  String selectedCity = '';
  String selectedState = '';
  String selectedCountry = '';
  String musicGenre = '';
  String availableDates = '';
  String performanceFee = '';

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();

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
    }
  }

  Future<List<String>> _getCities(String pattern) async {
    final response = await http.get(
      Uri.parse('https://servicodados.ibge.gov.br/api/v1/localidades/municipios'),
    );

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      List<String> cities = data.map((city) => city['nome'] as String).toList();
      return cities.where((city) => city.toLowerCase().contains(pattern.toLowerCase())).toList();
    } else {
      throw Exception('Erro ao carregar as cidades');
    }
  }

  Future<List<String>> _getCountries(String pattern) async {
    List<String> countries = [
      'Brasil',
      'Estados Unidos',
      'Argentina',
      'Canadá',
      'França',
      'Alemanha',
      'Japão'
    ];
    return countries.where((country) => country.toLowerCase().contains(pattern.toLowerCase())).toList();
  }

  Future<List<String>> _getStates(String pattern) async {
    List<String> states = [
      'Acre existe mesmo?',
      'Alagoas',
      'Amapá',
      'Amazonas',
      'Bahia',
      'Ceará',
      'Distrito Federal',
      'Espírito Santo',
      'Goiás',
      'Maranhão',
      'Mato Grosso',
      'Mato Grosso do Sul',
      'Minas Gerais',
      'Pará',
      'Paraíba',
      'Paraná',
      'Pernambuco',
      'Piauí',
      'Rio de Janeiro',
      'Rio Grande do Norte',
      'Rio Grande do Sul',
      'Rondônia',
      'Roraima',
      'Santa Catarina',
      'São Paulo',
      'Sergipe',
      'Tocantins'
    ];
    return states.where((state) => state.toLowerCase().contains(pattern.toLowerCase())).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oferecer Serviço'),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 20),
              Text(
                'Informações do Artista',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 28,
                  color: Color(0xFF2C3E50),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Nome do artista',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do artista';
                  }
                  return null;
                },
                onSaved: (value) {
                  artistName = value!;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Gênero musical',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o gênero musical';
                  }
                  return null;
                },
                onSaved: (value) {
                  musicGenre = value!;
                },
              ),
              SizedBox(height: 20),
              TypeAheadFormField(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: _countryController,
                  decoration: InputDecoration(
                    hintText: 'País',
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
                  return await _getCountries(pattern);
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  _countryController.text = suggestion;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o país';
                  }
                  return null;
                },
                onSaved: (value) {
                  selectedCountry = value!;
                },
              ),
              SizedBox(height: 20),
              TypeAheadFormField(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: _stateController,
                  decoration: InputDecoration(
                    hintText: 'Estado',
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
                  return await _getStates(pattern);
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  _stateController.text = suggestion;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o estado';
                  }
                  return null;
                },
                onSaved: (value) {
                  selectedState = value!;
                },
              ),
              SizedBox(height: 20),
              TypeAheadFormField(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: _cityController,
                  decoration: InputDecoration(
                    hintText: 'Cidade de origem',
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
                  return await _getCities(pattern);
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  _cityController.text = suggestion;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a cidade de origem';
                  }
                  return null;
                },
                onSaved: (value) {
                  selectedCity = value!;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _dateController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Datas',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                ),
                onTap: () {
                  _selectDate(context);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira as datas disponíveis';
                  }
                  return null;
                },
                onSaved: (value) {
                  availableDates = value!;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Valor da apresentação',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o valor da apresentação';
                  }
                  return null;
                },
                onSaved: (value) {
                  performanceFee = value!;
                },
              ),
              SizedBox(height: 32),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Process the form data
                    }
                  },
                  backgroundColor: Colors.purple,
                  label: Icon(Icons.check, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BarraDeNavegacao(
        selectedIndex: 1,
        onTap: (int index) {},
      ),
    );
  }
}
