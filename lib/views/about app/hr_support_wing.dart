import 'package:flutter/material.dart';

class HrSupportWing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About HR Support Wing',
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
              InfoCard(
                icon: Icons.people_alt_rounded,
                title: 'HR Support Wing',
                content: 'Ensuring Employee Well-Being and Driving Business Growth through Exceptional HR Support.',
                isExpandable: false,
              ),
              InfoCard(
                icon: Icons.support_agent,
                title: 'Why HR Support Matters?',
                content:
                'Do employees have questions you just can’t answer? '
                    'Are you looking for expert guidance? We’re here to provide you with all the HR support you need!',
                isExpandable: true,
              ),
              InfoCard(
                icon: Icons.verified,
                title: 'Membership Benefits',
                content:
                '* Confidential, free, and unlimited HR support.\n'
                    '* 24/7 access to expert HR support.\n'
                    '* Guidance on employment laws and regulations.\n'
                    '* Avoid costly mistakes & stay compliant.',
                isExpandable: false,
              ),
              InfoCard(
                icon: Icons.business_center,
                title: 'Outsourcing HR Tasks',
                content:
                'Our HR experts help you with recruitment, employee communication, and compliance. '
                    'By using our services, you can focus on growth while we handle your HR processes.',
                isExpandable: true,
              ),
              InfoCard(
                icon: Icons.phone,
                title: 'Contact Us',
                content: '📧 Email: support@aecci.org.in\n📞 Phone: +91-22-412 711 45',
                isExpandable: false,
              ),
            ],
          ),
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
                Icon(widget.icon, color: Colors.blue, size: 28),
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
                  '${widget.content.substring(0, 80)}...', // Show first 80 characters
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
