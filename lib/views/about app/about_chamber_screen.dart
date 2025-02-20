import 'package:flutter/material.dart';

class AboutChamberScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Chamber'),
        backgroundColor: Colors.white,

        elevation: 0, // Removes default shadow
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white, // Set background color to white
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/aecci6.png', // Replace with your logo asset path
                  height: 80,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'About The Chamber',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'The Asian Exporters’ Chamber of Commerce and Industry (AECCI), recognized by '
                    'the Ministry of Commerce and Industry, Govt of India, is one of the most'
                    ' dynamic and well-established non-profit organizations devoted to the '
                    'cause of promoting the private sector contribution to the economy. '
                    'The Chamber is registered with the largest chambers network globally '
                    '“World Chambers Network” i.e. the Official Global Chambers directory.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'CHAMBER’S CORE-VALUE',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '“We want to create something worth creating that will endure the test of time. i'
                    'ndependency and neutrality, honesty in managing arbitrations, preserving the '
                    'rights of the client, secrecy and confidentiality, prompt & responsible affiliation, '
                    'distinction in performance and working with the spirit of one team. We do '
                    'this by relentlessly focusing on our customer’s success, building '
                    'high-quality systems and planning for a long-term scale. We’re grounded '
                    'by humility and driven by ambition.”',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Mission',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'The Chamber’s mission is to lead the overall development, to ensure future '
                    'prosperity via a pro-business climate, to represent the unified voice '
                    'of the trade community and to reduce the business frictions through well-functioning networks.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
