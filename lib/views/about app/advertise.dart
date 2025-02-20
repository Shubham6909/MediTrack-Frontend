import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Advertise extends StatefulWidget {
  const Advertise({Key? key}) : super(key: key);

  @override
  _AdvertiseState createState() => _AdvertiseState();
}

class _AdvertiseState extends State<Advertise> {
  late YoutubePlayerController _controller;
  final List<String> imagePaths = [
    'assets/images/ad1.png',
    'assets/images/ad2.png',
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'q1C2AGyQ9Mo',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Advertise',
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
      body: SafeArea(
    child: Container(
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

              // // Carousel Slider at the top
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(15),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black26,
              //         blurRadius: 8,
              //         spreadRadius: 2,
              //         offset: Offset(0, 4),
              //       ),
              //     ],
              //   ),
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(10),
              //     child: CarouselSlider.builder(
              //       itemCount: imagePaths.length,
              //       options: CarouselOptions(
              //         autoPlay: true,
              //         autoPlayInterval: Duration(seconds: 3),
              //         enlargeCenterPage: true,
              //         viewportFraction: 1.0,
              //         height: 350, // Adjust height as needed
              //         enableInfiniteScroll: true,
              //       ),
              //       itemBuilder: (context, index, realIndex) {
              //         return Image.asset(
              //           imagePaths[index],
              //           width: double.infinity,
              //           fit: BoxFit.cover,
              //         );
              //       },
              //     ),
              //   ),
              // ),
              //
              // const SizedBox(height: 20), // Space between slider and text

              // Sponsorship Information Cards

              InfoCard(
                icon: Icons.support_agent_rounded,
                title: 'Advertise With Us',
                content:
                '“Maximize Your Online Presence and Connect with Your Target Audience Like Never Before – Advertise on Our Website Today!',
                isExpandable: false,
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.white,
                  bottomActions: [
                    CurrentPosition(),
                    ProgressBar(isExpanded: true),
                    RemainingDuration(),
                  ],
                  onReady: () {
                    // Optional: Add any initialization logic when video is ready
                    print('Video is ready');
                  },
                  onEnded: (metadata) {
                    // Optional: Handle video end event
                    _controller.pause();
                  },
                ),
              ),

              InfoCard(
                icon: Icons.group_work_rounded,
                title: 'business overseas',
                content:
                'Are you looking to expand your business overseas and reach a global audience? Our advertising campaigns are tailored to help you connect with the right importers and exporters, no matter where they are in the world.'
                    '\n\nAsian Exporters’ of Chamber of Commerce and Industry (AECCI) is offering online advertising space on website and also helping you connect with large audience '
                    'with AECCI Weekly and Annual Magazine. Knowing that advertising may be costly, we strive to '
                    'provide our clients the most value of their money.Working with you, our team of professionals '
                    'will design a unique advertising strategy that is tailored to your needs.',
                isExpandable: false,
              ),

            ],
          ),
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
