import 'package:flutter/material.dart';

class VisaRecommendation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Visa Recommendation',
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
                icon: Icons.flight_class_rounded,
                title: 'How to Get the Visa Recommendations Letter?',
                content:
                '“To help our exporters members in business promotion through overseas'
                    'tours and personal meets, we provide them with VISA recommendation'
                    'letters issued to embassies or consulates.”',
                isExpandable: false, // No need for show more/less
              ),
              InfoCard(
                icon: Icons.legend_toggle_rounded,
                title: 'Visa Recommendation Letter',
                content:
                'Asian Exporters’ Chamber of Commerce & Industry issues Visa Recommendations Letter addressing to foreign Consulates / Embassies / High Commissions in India, to support the Visa Applications of the members. Normally, it takes two days for processing the Visa Recommendations Letter application of members.',
                isExpandable: false,
              ),
              InfoCard(
                icon: Icons.file_copy_rounded,
                title: 'Documents required for the Visa Letter’s',
                content: '“Requesting letter * (On applicant’s letterhead)\n'
                    'Application for issuance of VISA recommendation letter should be stating: the Visiting Country’s name / Applicant name / Designation / Passport Number / Passport detail i.e. Date of issue / expiry date etc.',
                isExpandable: false,
              ),
              InfoCard(
                icon: Icons.info_outline_rounded,
                title: 'Fee for Visa Recommendations Letter’s',
                content: 'Once, the application for the issuance ofthe Visa Recommendations Letter is approved, the members are required to deposit the fee for'
                    ' Visa Recommendations Letter, as given below\n'
                    'Asian Countries Rs.1000/-\nSchengen countries Rs. 2,000/-\nAll other countries Rs. 2,000/-',
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
