import 'package:flutter/material.dart';

class OurHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our History'),
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
                'Our History',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Founded in 2014 with a dream to do something '
                    'for the betterment of the business community and with '
                    'the pure objective of trade orientation.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                '“The Asian Exporters’ Chamber of Commerce and Industry ( AECCI ) was founded in 2014 by '
                    'its Honourable chairman Mr. Jaheer Bukhari, who is an expert in the EXIM sector with '
                    'long experience of 22 years in Global consultation. With his dream to do something '
                    'for the betterment of the business community, he got the idea to form a Chamber; a chamber with '
                    'the pure objective of trade orientation and that can be easily accessed by the business community. ”',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),

              const Text(
                'This idea with the dedication, hard work and persistence '
                    'of the core team made it possible and today AECCI is known'
                    ' as a chamber that works in the public domain. The Chamber has made '
                    'its reputation by organizing more than 30 business promotion events in '
                    'a single year and is proud to have a large member base of loyal and trustworthy '
                    'businessmen and professionals. AECCI, as a non-governmental but recognised '
                    'institution is promoting, representing and safeguarding the interests '
                    'of the Asian business community.',
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
