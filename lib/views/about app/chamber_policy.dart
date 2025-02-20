import 'package:flutter/material.dart';

class ChamberPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Policy'),
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
                'Chambers Policy',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'A Non-Governmental, Non-profit organization, with a legal entity as recognized by the Ministry of Commerce And Industry, '
                    'Govt. of India as well as holding independent administrative and financial status.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),

              const Text(
                '“The Asian Exporters’ Chamber of Commerce and Industry (AECCI), is a '
                    'nongovernmental (Non-profit) organization, with a legal entity as recognized '
                    'by the Ministry of Commerce And Industry, Govt. of India as well as holding '
                    'independent administrative and financial status.”',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),

              const Text(
                ' - Section (25) company is registered under Section 25 of the Companies Act, 2013\n'
                    ' - Published in the Gazette of India Extraordinary Part I, Section I ( Govt. of India Ministry of Commerce and Industry, Department of Commerce) Director General Of Foreign Trade, New Delhi, Public Notice No. 55/2015-2020.\n'
                    ' - Dated:18th January 2018 Enlistment under Appendix 2E FTP 2015-20 of M/s Asian Exporters’ Chamber of Commerce and Industry (AECC&I) –Authorized to issue Certificate of Origin (Non-Preferential)',
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
