import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Sponsorship extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/Splash1.png',
    'assets/images/Splash2.png',
    'assets/images/Splash3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Sponsorship',
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
            children: [
              // Carousel Slider at the top
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CarouselSlider.builder(
                    itemCount: imagePaths.length,
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      enlargeCenterPage: true,
                      viewportFraction: 1.0,
                      height: 130, // Adjust height as needed
                      enableInfiniteScroll: true,
                    ),
                    itemBuilder: (context, index, realIndex) {
                      return Image.asset(
                        imagePaths[index],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20), // Space between slider and text

              // Sponsorship Information Cards
              InfoCard(
                icon: Icons.support_agent_rounded,
                title: 'Sponsorships',
                content:
                '“Sponsoring our iconic events offers you exposure to the Asian business community and helps you broaden your reach through our various marketing channels. Interested in being a sponsor or partner? Read on below.”',
                isExpandable: false, // No need for show more/less
              ),
              InfoCard(
                icon: Icons.group_work_rounded,
                title: 'Your Gateway to Business Growth!',
                content:
                'Looking to expand your business in the Asian market? Sponsor an event or program with AECCI and gain publicity, brand recognition, and valuable connections within the Asian business community. Our highly publicized events attract business partners and maximize your visibility. As an AECCI sponsor, your company will be featured in our publications, website, and collateral materials, giving you the exposure you need to compete in today’s competitive environment.',
                isExpandable: false,
              ),
              InfoCard(
                icon: Icons.model_training_rounded,
                title: 'Join hands with AECCI',
                content:
                'Sponsoring the Asian Exporters’ Chamber of Commerce and Industry is not only a smart investment in the growth and success of your business, but also a valuable opportunity to connect with other influential leaders in industries. By supporting our events and initiatives, you will gain unparalleled exposure to the Asian business community and expand your reach through our various marketing channels.\nJoin us in creating new opportunities for growth and collaboration, and position your brand as a leader in your field.',
                isExpandable: false, // No need for show more/less
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
