import 'package:flutter/material.dart';


class Country {
  final String name;
  final String imagePath;
  final String description;

  Country({
    required this.name,
    required this.imagePath,
    required this.description,
  });
}

final List<Country> countries = [
  Country(
    name: 'Brazil',
    imagePath: 'assets/images/Brazil.png', // Add your country image path
    description: 'NAVIGATING CROSS BORDER COMMERCE: AECCI-ABDO ADVOGADOS COLLABORATION\n\n'
        '♦Traders’ Support: A partnership for legal assistance to traders in Brazil and India.'
        '\n♦Empowering Trade: AECCI and Abdo Advogados collaborate to empower exporters and importers.'
        '\n♦Abdo Advogados: A top international law firm in Brazil.'
        '\n♦Legal Support: They offer expert guidance on legal matters in their respective countries.'
        '\n\nThis  International collaboration supports trade industry exporters and importers..',
  ),
  Country(
    name: 'Brazil',
    imagePath: 'assets/images/Brazil.png', // Add your country image path
    description: 'NAVIGATING CROSS BORDER COMMERCE: AECCI-ABDO ADVOGADOS COLLABORATION\n\n'
        '♦Traders’ Support: A partnership for legal assistance to traders in Brazil and India.'
        '\n♦Empowering Trade: AECCI and Abdo Advogados collaborate to empower exporters and importers.'
        '\n♦Abdo Advogados: A top international law firm in Brazil.'
        '\n♦Legal Support: They offer expert guidance on legal matters in their respective countries.'
        '\n\nThis  International collaboration supports trade industry exporters and importers..',
  ),
  // Add other countries...
];
