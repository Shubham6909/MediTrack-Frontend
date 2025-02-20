import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ProfessionalWing extends StatefulWidget {
  @override
  _ExportWingState createState() => _ExportWingState();
}

class _ExportWingState extends State<ProfessionalWing> {

  late YoutubePlayerController _controller2;

  @override
  void initState() {
    super.initState();


    _controller2 = YoutubePlayerController(
      initialVideoId: 'rHgfJ0-ujTI', // Updated video ID
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {

    _controller2.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Professional Wing',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.purple, // Matching Seminar screen color
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
                icon: Icons.business_center,
                title: 'Professional Wing',
                content:
                '“Professional Wing supports Asian business community with consultation '
                    'and services to establish new ventures and to deal with day to day '
                    'issues in existing business, their expansion and diversification plans.”',
                isExpandable: false,
              ),

              // Second Video Player
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: YoutubePlayer(
                  controller: _controller2,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.white,
                  bottomActions: [
                    CurrentPosition(),
                    ProgressBar(isExpanded: true),
                    RemainingDuration(),
                  ],
                ),
              ),


              InfoCard(
                icon: Icons.account_balance,
                title: 'Our Services',
                content:
                'AECCI’s endeavor in establishing its Professional wing is to '
                    'provide consultation and services for all the corporate and '
                    'commercial fields in the most efficient manner. For every business, '
                    'various compliances need to be fulfilled, and professionals '
                    'like Chartered Accountants, Company Secretaries, Tax Consultants, and '
                    'Finance Professionals are the backbone of business. Our Professional '
                    'Wing is set up to provide a platform engaging with professionals, '
                    'where we have many expert Chartered Accountants and '
                    'Company Secretaries affiliated with us.\n\n'
                    'The wing supports the Asian business community with consultation and services to establish new ventures and to deal with the day to day issues in existing business, their expansion and diversification plans. Our wing experts help in understanding and explore the investment opportunities available with the Asian community.',
                isExpandable: true,
              ),
              InfoCard(
                icon: Icons.email,
                title: 'Contact Us',
                content: ' For more information please contact:\nProfessional Wing’s Division :\n📧 Email: professionalwing@aecci.org.in\n📞 Phone: +91-22-412 711 45 | 46\n*(Consultation available with prior appointment)',
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
                Icon(widget.icon, color: Colors.blueGrey, size: 28),
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
                  '${widget.content.substring(0, 100)}...',
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
