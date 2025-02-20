import 'package:flutter/material.dart';

class International extends StatelessWidget {
  const International({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AECCI International Hub',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.purple, // Rich header color
        elevation: 0,
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
              const InfoCard(
                icon: Icons.model_training_rounded,
                title: 'AECCI International Hub',
                content:
                'AECCI plans to reach new goal on an international scope, our motto is to expand International Representations hub in strategic locations in Asian countries.',
                isExpandable: false, // No need for show more/less
              ),
              const InfoCard(
                icon: Icons.model_training,
                title: 'International Office:',
                content:
                "AECCI plans to reach new goal on an international scope, our motto is "
                    "to expand the International Representations hub in strategic locations in Asian countries so that to position INDIA as a leading foreign investment destination. This move aims to shore up investment opportunities in India for regional and international players.\nAECCI’S International Representations Hub facilitation can be availed for your country Interested organizations can drop an email.\nFor more information please contact:\n\nInternational Representation Hub Division\nEmail info@aecci.org.in\nTelephone number:\nBoard lines: +91-22-412 711 45 | 46",
                isExpandable: true,
              ),
              _buildContactForm(),
            ],
          ),
        ),
      ),
    );
  }

  // Contact Form Widget
  Widget _buildContactForm() {
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
                const Icon(Icons.contact_mail, color: Colors.purple, size: 28),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Contact Us',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildTextField('Your name'),
            const SizedBox(height: 12),
            _buildTextField('Your email'),
            const SizedBox(height: 12),
            _buildTextField('Subject'),
            const SizedBox(height: 12),
            _buildMultilineTextField('Your message (optional)'),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement form submission logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create text fields
  Widget _buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.purple),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.purple),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.purple, width: 2),
        ),
      ),
    );
  }

  // Helper method to create multiline text field
  Widget _buildMultilineTextField(String hintText) {
    return TextField(
      maxLines: 4,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.purple),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.purple),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.purple, width: 2),
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
                  '${widget.content.substring(0, 100)}...', // Show first 100 characters
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