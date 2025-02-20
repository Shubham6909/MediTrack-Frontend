import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Wings extends StatelessWidget {
  Wings({super.key});

  final List<String> items = [
    'Export Wing',
    'Legal Wing',
    'HR Support Wings',
    'Business Advice Wing',
    'Professional Wing',
    'Event & Seminar Wing',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Wings Overview',
            style: TextStyle(
              color: Colors.indigo,
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
            color: Colors.indigo,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home, color: Colors.indigo),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.lightbulb_outline, color: Colors.indigo),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ...items.map((item) => buildServiceCard(context, item)).toList(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/quick.png',
                    height: 20,
                    width: 20,
                    color: Colors.blueAccent,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Quick Links",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1,
                children: [
                  _buildGridOptionCard(
                    Icons.domain_verification_outlined,
                    'E-Platform',
                    Colors.blueAccent.shade100,
                  ),
                  _buildGridOptionCard(
                    Icons.place_rounded,
                    'E-Verification',
                    Colors.deepOrange.shade400,
                  ),
                  _buildGridOptionCard(
                    Icons.card_membership_sharp,
                    'Membership',
                    Colors.green,
                  ),
                  _buildGridOptionCard(
                    Icons.announcement_rounded,
                    'Annual Report',
                    Colors.blueAccent.shade400,
                  ),
                  _buildGridOptionCard(
                    Icons.business_center_outlined,
                    'Innovation Index',
                    Colors.purple,
                  ),
                  _buildGridOptionCard(
                    Icons.info,
                    'Research & Info',
                    Colors.orange,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildServiceCard(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom:0.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          // contentPadding: const EdgeInsets.symmetric(
          //   horizontal: 14.0,
          //   vertical: 6.0,
          // ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),

        ),
      ),
    );
  }

  Widget _buildGridOptionCard(IconData icon, String title, Color iconBackgroundColor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green),
            ),
            child: Icon(icon, size: 20, color: Colors.orange),
          ),
          SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
