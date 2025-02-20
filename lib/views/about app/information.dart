import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About World Conference',
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
                icon: Icons.confirmation_number_rounded,
                title: 'WORLD CONFERENCE INFO',
                content:
                'The upcoming series of prestigious international conferences in the Asian region, '
                    'organized and promoted by various Institutes and Diplomat Bodies. These conferences '
                    'serve as platforms for global networking, knowledge sharing, and collaboration,'
                    'bringing together renowned experts, industry leaders, and researchers from diverse '
                    'fields.With a broad working scope, these conferences cover a wide range of topics,'
                    'including but not limited to technology and innovation, sustainable development, '
                    'artificial intelligence, robotics, healthcare advancements, renewable energy, finance,'
                    'and international trade. The carefully curated agenda comprises keynote speeches, panel discussions, interactive workshops, and academic presentations, ensuring a dynamic and engaging experience for all participants.By attending these conferences, It offers an unparalleled opportunity to establish meaningful connections with like-minded professionals, fostering collaborations that can lead to groundbreaking advancements and business opportunities.Our trade body takes immense pride in fostering a vibrant and inclusive ecosystem that promotes knowledge exchange, idea generation, and the development of innovative solutions to address global challenges. You can too be a part of these international conferences and events and contribute to shaping the future of your industry while expanding your professional network.Mark your calendars and secure your spot at these upcoming international conferences in the Asian region, where transformative ideas become reality and impactful collaborations thrive.',
                isExpandable: true,
              ),
              const SizedBox(height: 16),
              Card(
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
                          Icon(Icons.location_on, color: Colors.purple, size: 28),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'CONFERENCE LOCATIONS',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 3.0,
                        children: [
                          'Bahrain', 'India','Jordan', 'Mongolia', 'Saudi Arabia', 'Turkey',
                          'Bangladesh', 'Indonesia', 'North Korea', 'Nepal', 'Singapore', 'UAE',
                          'Bhutan', 'Iran', 'South Korea', 'Oman', 'Sri Lanka', 'Uzbekistan',
                          'Cambodia', 'Iraq', 'Kuwait', 'Pakistan', 'Syria', 'Vietnam',
                          'China', 'Israel', 'Malaysia', 'Philippines', 'Taiwan',
                          'Hong Kong', 'Japan', 'Maldives', 'Qatar', 'Thailand'
                        ].map((country) => Chip(
                          label: Text(country),
                          backgroundColor: Colors.purple[100],
                        )).toList(),
                      ),
                    ],
                  ),
                ),
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
                  '${widget.content.substring(0, 200)}...', // Show first 200 characters
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