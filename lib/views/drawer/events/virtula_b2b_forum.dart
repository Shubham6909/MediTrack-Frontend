import 'package:flutter/material.dart';

class VirtualB2BForumScreen extends StatefulWidget {
  @override
  _VirtualB2BForumScreenState createState() => _VirtualB2BForumScreenState();
}

class _VirtualB2BForumScreenState extends State<VirtualB2BForumScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                'assets/images/b2b.png',
                fit: BoxFit.contain,
                height: 100,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ExpansionTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AECCI B2B Forum is designed to strengthen business connections between foreign trade experts and Indian businesses, thus helping both sides to expand their reach globally.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                trailing: Icon(
                  _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: Colors.blue[700],
                ),
                onExpansionChanged: (bool expanded) {
                  setState(() {
                    _isExpanded = expanded;
                  });
                },
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'The forum will provide a platform for businesses to connect with potential partners, investors, and customers from around the world.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'This platform aims to help businesses grow globally by providing them with access to a network of professionals, investors, and potential customers. It is an opportunity to build meaningful business relationships and expand market presence.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 32),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildNavButton('Registration'),
                    _buildNavButton('Process', isActive: true),
                    _buildNavButton('Bookings'),
                    _buildNavButton('Meetings'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton(String label, {bool isActive = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? Colors.blue[700] : Colors.white,
          foregroundColor: isActive ? Colors.white : Colors.blue[700],
          elevation: isActive ? 2 : 0,
          side: BorderSide(color: Colors.blue[700]!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
        ),
        onPressed: () {},
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}