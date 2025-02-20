import 'package:flutter/material.dart';

class Country {
  final String name;
  final String imagePath;
  final String description;

  const Country({
    required this.name,
    required this.imagePath,
    required this.description,
  });
}

class InternationalCollaboration extends StatelessWidget {
  InternationalCollaboration({super.key});

  final List<String> allCountries = [
    'Brazil', 'Cambodia', 'Denmark', 'Egypt', 'Mexico',
    'Tanzania', 'Bahamas', 'Bosnia', 'Algeria', 'Nigeria',
    'Oman', 'Vietnam', 'UK', 'China', 'Pakistan',
    'South Sudan', 'Turkey', 'Greece', 'Thailand', 'Ethiopia',
    'Lebanese', 'Sri Lanka', 'UAE', 'Uzbekistan', 'Jordan',
    'Poland', 'Indonesia', 'Morocco', 'Germany', 'Portugal',
    'Kenya', 'Netherlands'
  ];

  final List<Country> countries = [
    const Country(
      name: 'Brazil',
      imagePath: 'assets/images/Brazil.png',
      description: 'Navigating cross border commerce: AECCI-ABDO Advogados Collaboration\n\n'
          '♦Traders Support: A partnership for legal assistance to traders in Brazil and India.'
          '\n♦Empowering Trade: AECCI and Abdo Advogados collaborate to empower exporters and importers.'
          '\n♦Abdo Advogados: A top international law firm in Brazil.'
          '\n♦Legal Support: They offer expert guidance on legal matters in their respective countries.'
          '\n\nThis International collaboration supports trade industry exporters and importers.',
    ),
    const Country(
      name: 'Cambodia',
      imagePath: 'assets/images/Cambodia.png',
      description: 'Strategic Partnership with Cambodia Chamber of Commerce\n\n'
          '♦Trade Development: Fostering bilateral trade relations between Cambodia and India.'
          '\n♦Business Opportunities: Creating platforms for business networking and expansion.'
          '\n♦Cultural Exchange: Promoting understanding of business practices in both countries.'
          '\n♦Economic Growth: Supporting initiatives for mutual economic development.',
    ),
    const Country(
      name: 'Denmark',
      imagePath: 'assets/images/denmar.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),
    const Country(
      name: 'Egypt',
      imagePath: 'assets/images/Egypt.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),

    const Country(
      name: 'Mexico',
      imagePath: 'assets/images/mexico.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),
    const Country(
      name: 'Tanzania',
      imagePath: 'assets/images/tanzinia.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),
    const Country(
      name: 'Bahamas',
      imagePath: 'assets/country/bahamas.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),

    const Country(
      name: 'Bosnia',
      imagePath: 'assets/country/bosnia.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),
    const Country(
      name: 'Algeria',
      imagePath: 'assets/country/algeria.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),

    const Country(
      name: 'Nigeria',
      imagePath: 'assets/country/nigeria.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),

    const Country(
      name: 'Oman',
      imagePath: 'assets/country/oman.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),

    const Country(
      name: 'Vietnam',
      imagePath: 'assets/country/vietnam.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),

    const Country(
      name: 'UK',
      imagePath: 'assets/country/uk.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),

    const Country(
      name: 'China',
      imagePath: 'assets/country/china.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),

    const Country(
      name: 'Pakistan',
      imagePath: 'assets/country/pakistan.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),

    const Country(
      name: 'South Sudan',
      imagePath: 'assets/country/sudan.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),
    const Country(
      name: 'Turkey',
      imagePath: 'assets/country/turkey.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),
    const Country(
      name: 'Greece',
      imagePath: 'assets/country/thesis.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),
    const Country(
      name: 'Thailand',
      imagePath: 'assets/country/thailand.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),
    const Country(
      name: 'Ethiopia',
      imagePath: 'assets/country/ethiopia.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),
    const Country(
      name: 'Lebanese',
      imagePath: 'assets/country/lebnan.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),
    const Country(
      name: 'Sri Lanka',
      imagePath: 'assets/country/srilanka.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),
    const Country(
      name: 'UAE',
      imagePath: 'assets/country/uae.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),
    const Country(
      name: 'Uzbekistan',
      imagePath: 'assets/country/uzkebistan.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),
    const Country(
      name: 'Jordan',
      imagePath: 'assets/country/jordan.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),
    const Country(
      name: 'Poland',
      imagePath: 'assets/country/poland.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),
    const Country(
      name: 'Indonesia',
      imagePath: 'assets/country/indonesia.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),
    const Country(
      name: 'Morocco',
      imagePath: 'assets/country/morocco.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),
    const Country(
      name: 'Germany',
      imagePath: 'assets/country/germany.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),
    const Country(
      name: 'Portugal',
      imagePath: 'assets/country/portugal.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),
    const Country(
      name: 'Kenya',
      imagePath: 'assets/country/kenya.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),
    const Country(
      name: 'Netherlands',
      imagePath: 'assets/country/netherlands.png',
      description: 'Collaboration with Danish Business Association\n\n'
          '♦Innovation Partnership: Focusing on sustainable business practices.'
          '\n♦Technology Exchange: Promoting technological collaboration between nations.'
          '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
          '\n♦Market Access: Facilitating entry into European markets.',
    ),
  ];

  Country _getCountryDetails(String name) {
    return countries.firstWhere(
          (c) => c.name == name,
      orElse: () => Country(
        name: name,
        imagePath: 'assets/images/c1.png',
        description: 'International Partnership with $name\n\n'
            '♦Trade Relations: Strengthening bilateral trade connections.'
            '\n♦Business Development: Creating opportunities for growth and expansion.'
            '\n♦Cultural Exchange: Fostering understanding of business practices.'
            '\n♦Economic Cooperation: Working together for mutual prosperity.',
      ),
    );
  }

  Widget _buildCountryGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 14,
      ),
      itemCount: allCountries.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _showCountryDetails(context, _getCountryDetails(allCountries[index]));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                allCountries[index],
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }

  void _showCountryDetails(BuildContext context, Country country) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.7,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            country.imagePath,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              debugPrint('Error loading image: ${country.imagePath}');
                              return Container(
                                color: Colors.grey[300],
                                child: const Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                                      SizedBox(height: 8),
                                      Text(
                                        'Image not available',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      country.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      country.description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                        ),
                        child: const Text(
                          'Close',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'International Collaboration',
            style: TextStyle(
              color: Color(0xFF1748F8),
              fontSize: 18,
              height: 1.2,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF1748F8),
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home, color: Color(0xFF1748F8)),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.lightbulb_outline, color: Color(0xFF1748F8)),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPartnershipsSection(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPartnershipsSection() {
    return Card(
      color: Colors.deepPurple,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Partnerships',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "AECCI's Export Wing offers services such as issuing Certificates of Origin,",
              style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.white),
            ),
            SizedBox(height: 16),
            _buildCountryGrid(),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String content;
  final bool isExpandable;

  const InfoCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.content,
    this.isExpandable = false,
  }) : super(key: key);

  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(widget.icon, color: Colors.purple, size: 28),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (widget.isExpandable)
              AnimatedCrossFade(
                firstChild: Text(
                  '${widget.content.substring(0, 200)}...', // Show first 200 characters
                  style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
                ),
                secondChild: Text(
                  widget.content,
                  style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
                ),
                crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              )
            else
              Text(
                widget.content,
                style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
              ),
            if (widget.isExpandable)
              TextButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(isExpanded ? "Show Less" : "Show More"),
              ),
          ],
        ),
      ),
    );
  }
}