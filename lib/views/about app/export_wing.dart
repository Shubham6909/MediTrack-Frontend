import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExportWing extends StatefulWidget {
  @override
  _ExportWingState createState() => _ExportWingState();
}

class _ExportWingState extends State<ExportWing> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'kIaMatSw6EM',
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
      backgroundColor: Colors.purple, // Full-screen background color
      appBar: AppBar(
        title: const Text(
          'About Export Wing',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple, // Matching header color
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Exports Wing',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Exports wing helps understand the foreign trade procedures and policies, offering essential documents such as Certificates of Origin (non-Preferential) and making overseas shipping easier.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 14),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/Wing.jpeg',
                    height: 110,
                    width: 90,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: const Text(
                    'Our expert team provides guidance in foreign trade policies and helps businesses resolve international trade disputes.',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
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

            _buildExpansionTile(
              title: 'Why AECCI',
              content:
              "Asian Exporters' Chamber of Commerce and Industry is a non-profit organization that promotes trade and industry. Authorized by the Ministry of Commerce & Industry, Govt. of India, AECCI provides Certificates of Origin, document attestation, export seminars, and mediation for trade disputes.\n\nAsian Exporters’ Chamber of Commerce and Industry is a non-profit organization that works to promote the trade and industry. Being authorised by Ministry of Commerce & Industry Government of India, we provide with the Certificate of Origin for the goods being produced in India and the attestation of necessary export documents. Additionally, we provide various services and resources to help businesses grow and succeed.Exporting can be a complex process, especially for the new and small businesses. Through our dedicated export wing, we assist the trade community in understanding and implementing the safe trade practices and help them in expanding their international reach. Being a sourcing agency, we do not just provide the documents assistance or export advise rather we create such opportunities for trade community to help in expansion of international business.\n\nWe ensure your business not only grows but flourishes in the global market.",
            ),
            _buildExpansionTile(
              title: 'Our Services',
              content:
              "AECCI's Export Wing offers services such as issuing Certificates of Origin,"
                  "attestation of export documents, VISA recommendation letters, trade promotion programs,"
                  "and dispute resolution through arbitration and mediation.Knowledge sharing through Daily Viewpoint, Weekly updates, Monthly and Quarterly Newsletters and Annual Publications.\n\nAECCI’s processes the document attestation & certification of many documents like:\n - Shipping Documentation: Certificate of Origin (Non-preferential), Invoice, Packing List, Bill of lading, EDI etc.\n - Legal Documents required for export: Power of Attorney, Agency Agreement, Distribution Agreements, Sales Contract & Contract Mfg. etc.\n - Pharmaceutical and Healthcare Documents: Certificates of Free Sale, Certificates of GMP, CIB Certificates, Analysis and Price Certificates",
            ),
            _buildExpansionTile(
              title: 'Our Initiatives',
              content:
              "E-platform: – To provide our exporter members with a hassle-free document attestation experience, we have developed an e-platform that allows them to have online COO (Non-Preferential) issued and the documents attestation services from the comfort of their office.\n\nThrough our e-Platform exporters’ can take the facility of E-COO (NP), Semi E-COO and Non-Standard Documents.\n\nE-Wallet facility is also provided for the convenience of the exporter members so to save the time of making payments every time.\n\nYour membership issuance and renewal are also done online without following the renewal letters or reminders.\n\nThis online facility not only saves time but also reduces costs for our members.\n\nAnnual Publication- ‘Revolution of artificial Intelligence in Export’ Our annual magazine is our key initiave aimed at advancing international trade by providing valuable insights and practical advice on integrating AI into export processes. This will prove to be a comprehensive guide designed to help exporters leverage artificial intelligence to enhance their export strategies.",
            ),
            _buildExpansionTile(
              title: 'Our Team',
              content:
              "Our dedicated professionals offer comprehensive support. Contact us at: Board lines: +91-22-412 711 45 | 46, Email: legal@aecci.org.in",
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildExpansionTile({required String title, required String content}) {
    return Card(
      color: Colors.deepPurple,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              content,
              style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
