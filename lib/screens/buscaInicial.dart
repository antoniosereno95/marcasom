import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/searchArtist.dart';

class BuscaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: Stack(
        children: [
          // Background Image
          Container(
  width: double.infinity,
  height: MediaQuery.of(context).size.height / 2,
  decoration: const BoxDecoration(
    image: DecorationImage(
      image: AssetImage('lib/assets/ImagemDaHome.svg'),
      fit: BoxFit.cover,
    ),
  ),
),

          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  // Top Text
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Artistas locais a poucos\ncliques de você',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 2 - 80), // Adjust height as needed
                  // Centered Search Artist
                  Align(
                    alignment: Alignment.center,
                    child: SearchArtist(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
