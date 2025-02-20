import 'package:flutter/material.dart';

class Women extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Women Wing', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple, // A rich, vibrant color for the header
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.deepPurpleAccent],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Center(
              //   child: Container(
              //     padding: const EdgeInsets.all(12),
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(12),
              //       // boxShadow: [
              //       //   BoxShadow(
              //       //     color: Colors.black26,
              //       //     blurRadius: 8,
              //       //     spreadRadius: 2,
              //       //   ),
              //       // ],
              //     ),
              //     // child: Column(
              //     //   children: [
              //     //     const Icon(Icons.woman, color: Colors.purple, size: 50),
              //     //     const SizedBox(height: 8),
              //     //     const Text(
              //     //       'Women Wing',
              //     //       style: TextStyle(
              //     //         fontSize: 22,
              //     //         fontWeight: FontWeight.bold,
              //     //         color: Colors.purple,
              //     //       ),
              //     //     ),
              //     //   ],
              //     // ),
              //   ),
              // ),
             // const SizedBox(height: 16),

              _buildInfoCard(
                icon: Icons.people,
                title: 'Empowering Women',
                content:
                '“Women Wing is geared up to empower women to succeed. Successful '
                    'women in our wing encourage other women members to become economically empowered and contribute to the development of the nation.”',
              ),

              _buildInfoCard(
                icon: Icons.school,
                title: 'Education & Networking',
                content:
                'Women Wing is dedicated to facilitating the advancement of women by fostering meaningful business relationships among members, '
                    'delivering unique educational programs, and hosting creative member events.',
              ),

              _buildInfoCard(
                icon: Icons.celebration,
                title: 'Celebrating Success',
                content:
                'Nowadays, women are leading in business, private, and government sectors. '
                    'We celebrate their accomplishments, expand their networks, and help them grow further and faster.',
              ),

              _buildInfoCard(
                icon: Icons.email,
                title: 'Contact Us',
                content: '📧 Email: ed@aecci.org.in\n📞 Board lines: +91-22-412 71145|46ed',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({required IconData icon, required String title, required String content}) {
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
                Icon(icon, color: Colors.purple, size: 28),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
