import 'package:flutter/material.dart';

class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Why AECCI-IAC?',
          style: TextStyle(color: Colors.white, fontSize: 18),
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
                icon: Icons.upcoming_rounded,
                title: 'Welcome to AECCI-IAC',
                content:
                '“Our specialists give members of the organization alternative dispute resolution services.'
                    'Facilitating discussions, and writing agreements in a manner that helps maintain the good business relationship among members.”',
                isExpandable: false, // No need for show more/less
              ),
              InfoCard(
                icon: Icons.legend_toggle_rounded,
                title: 'AECCI assisted clients',
                content:
                'At AECCI-IAC, we recognize the diverse needs of businesses engaged in '
                    'cross-border trade and investment. Our specialized expertise covers a '
                    'wide range of industries, including manufacturing, exports, imports, '
                    'services, and more. By providing a flexible and adaptable arbitration framework, we are able to address the unique challenges faced by businesses in today’s globalized economy.',
                isExpandable: false,
              ),
              InfoCard(
                icon: Icons.commit_rounded,
                title: 'Our commitment',
                content: 'Our commitment to excellence extends beyond dispute resolution. AECCI-IAC also serves as a knowledge hub, offering training programs, seminars, and workshops to enhance participants’ understanding of international arbitration and trade-related matters. Through collaboration with renowned experts and institutions, we aim to promote best practices, legal compliance, and professional development within the business community.\nWhether you are a multinational corporation, small and medium-sized enterprise, or an individual entrepreneur, AECCI-IAC stands ready to assist you in navigating the complexities of international trade and resolving disputes in a fair and efficient manner. Join us and experience the benefits of our esteemed arbitration services, tailored to meet your specific needs.',
                isExpandable: true,
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
