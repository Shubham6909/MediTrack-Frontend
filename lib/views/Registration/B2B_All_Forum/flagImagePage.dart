import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'allCountry.dart';

class CountryDetailsPage extends StatefulWidget {
  final String flagUrl;
  final String token;
  final Map<String, dynamic>? loginData;

  const CountryDetailsPage({
    Key? key,
    required this.token,
    required this.loginData,
    required this.flagUrl,
  }) : super(key: key);

  @override
  _CountryDetailsPageState createState() => _CountryDetailsPageState();
}

class _CountryDetailsPageState extends State<CountryDetailsPage> {
  Map<String, dynamic>? countryData;
  bool isLoading = true;
  bool showSlotMessage = false;
  String countryName = "";
  String description = "";

  @override
  void initState() {
    super.initState();
    fetchCountryDetails();
  }

  Future<void> fetchCountryDetails() async {
    const String apiUrl = 'https://e-platapi.aecci.org.in/api/v2/b2b/getParticipateCountriesDetails/';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer ${widget.token}',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey('data') && data['data'] is List && data['data'].isNotEmpty) {
          setState(() {
            countryData = data['data'][0];
            countryName = countryData?['country_name'] ?? 'Unknown Country';
            description = countryData?['description'] ?? 'No description available';
            isLoading = false;
          });
        } else {
          throw Exception('No country data available');
        }
      } else {
        throw Exception('Failed to load country details');
      }
    } catch (error) {
      print('Error fetching country details: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(
                  widget.flagUrl,
                  width: 60,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    countryName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Allcountry(
                          loginData: widget.loginData,
                          token: widget.token,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_back, color: Color(0xFF1748F8)),
                  label: const Text('Back to Countries', style: TextStyle(color: Color(0xFF1748F8))),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Go Exporting',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'About',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showSlotMessage = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1748F8),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text(
                  'Book Slot',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            if (showSlotMessage)
              Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: const Text(
                        'Slots will be available from March 1st, 2025',
                        style: TextStyle(fontSize: 12, color: Colors.black87),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.black54),
                      onPressed: () {
                        setState(() {
                          showSlotMessage = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Allcountry(
                        loginData: widget.loginData,
                        token: widget.token,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Book other countries',
                  style: TextStyle(color: Color(0xFF1748F8), fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
