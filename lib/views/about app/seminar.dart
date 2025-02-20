import 'package:flutter/material.dart';

class Seminar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Event & Seminar Wing',
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
                icon: Icons.event_available_rounded,
                title: 'Events and Seminars Wing',
                content:
                '“We create great opportunities for businesses through mega events to '
                    'gain valuable insights while making new business contacts and strengthening existing relationships.”',
                isExpandable: false, // No need for show more/less
              ),
              InfoCard(
                icon: Icons.school,
                title: 'Our Expertise',
                content:
                'For many of our members, our comprehensive events programme is a major reason for joining AECCI. '
                    'Always in high-quality venues, and with industry’s leading speakers, our events are great opportunities '
                    'to gain valuable insights while making new business contacts and strengthening existing relationships. '
                    'With us, you’ll meet like-minded people across all sectors and sizes, and open your business up to the '
                    'capital’s largest business network. We design the programme to appeal to all our members throughout '
                    'Asian Business Community, covering many sectors and encouraging all types of business networking.',
                isExpandable: true,
              ),
              InfoCard(
                icon: Icons.celebration,
                title: 'B2B Expo',
                content:
                'Our proactive approach to reach diplomatic missions, authorities, trade bodies, and other important private '
                    'organizations helps us to arrange member meetings to discuss key business subjects. B2B expos, trade fairs, '
                    'and other business meets can always be seen on our event calendar, giving our members the opportunity '
                    'to network with relevant sectors.',
                isExpandable: true,
              ),
              InfoCard(
                icon: Icons.email,
                title: 'Contact Us',
                content: '📧 Email: customercare@aecci.org.in\n📞 Board lines: +91-22-412 711 45 | 46',
                isExpandable: false, // Contact info should always be fully visible
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
