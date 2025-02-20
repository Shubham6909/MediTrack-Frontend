import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('            Chairman Message \n        Welcome to AECCI APP!',style:
        TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.redAccent),),
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Image of the Chairman
                    Image.asset(
                      'assets/images/chairman.jpg', // Replace with your logo asset path
                      height: 200,
                    ),
                    const SizedBox(height: 12), // Space between image and text
                    // Chairman's name and title
                    const Text(
                      'Shri Jaheer Bukhari – Hon’ble Board Chairman',
                      textAlign: TextAlign.center, // Center align the text
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87, // Adjust color as needed
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '     "Together, lets nurture the growth of India\n        and Asia and other respective Regions."',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Through this platform, our goal is to share valuable insights'
                    ' into our mission, who we are, our objectives, and the reasons '
                    'that drive us. AECCI is dedicated to fostering knowledge, '
                    'skills, and the adoption of best practices in investment, '
                    'business, industry, trade, and sustainable policies. '
                    'We are committed to engaging in productive dialogues with government bodies.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                '“Furthermore, we offer our members access to valuable business '
                    'intelligence and a wealth of opportunities. We facilitate the '
                    'expansion of their networks, connecting them with Asian and international'
                    ' business partners through various channels and events. In essence, we empower '
                    'our members to forge connections and achieve their business goals. Our vision '
                    'instills in us a profound belief that our endeavors will contribute to India and Asia’s emergence '
                    'as key players in global trade, fostering long-term growth for our nation and the wider region.”',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'To the business community at large, if you have not yet become a member, '
                    'I strongly encourage you to take the leap. By joining us, you will '
                    'enhance your connectivity, stay informed about new prospects, and ensure that '
                    'your interests are well-represented in the corridors of policymaking. So, seize '
                    'the opportunity today, embark on the journey of expanding your business, '
                    'networks, and influence.We extend a warm invitation to Asian and regional companies '
                    'who wish to join us in this remarkable journey. Your feedback and inquiries about AECCI are always welcome.',
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
