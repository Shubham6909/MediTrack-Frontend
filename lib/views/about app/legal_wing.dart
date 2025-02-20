// import 'package:flutter/material.dart';
//
// class LegalWing extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('About Legal Wing'),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         scrolledUnderElevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       backgroundColor: Colors.white,
//       body: Container(
//         color: Colors.white,
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Exports Wing',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 '“Your Leading Partner for Resolving International Disputes and Handling Every Aspect of Your Legal Needs.”',
//                 style: TextStyle(
//                   fontSize: 16,
//                   height: 1.5,
//                   color: Colors.black87,
//                 ),
//               ),
//               const SizedBox(height: 14),
//
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Image.asset(
//                     'assets/images/legal.jpeg',
//                     height: 90,
//                     width: 90,
//                     fit: BoxFit.cover,
//                   ),
//                   const SizedBox(width: 22),
//                   Expanded(
//                     child: Text(
//                       'The AECCI-Legal Wing is dedicated to providing comprehensive and specialized '
//                           'legal services tailored to the complexities of international trade and commercial business.',
//                       style: TextStyle(
//                         fontSize: 16,
//                         height: 1.5,
//                         color: Colors.black87,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//
//               const SizedBox(height: 8),
//               const Text(
//                 'Our team of seasoned professionals offers expert assistance in '
//                     'navigating the intricate landscape of export regulations, with a '
//                     'particular emphasis on resolving international trade disputes.',
//                 style: TextStyle(
//                   fontSize: 16,
//                   height: 1.5,
//                   color: Colors.black87,
//                 ),
//               ),
//               const SizedBox(height: 12),
//
//               // Why AECCI Expansion Tile
//               ExpansionTile(
//                 title: const Text(
//                   'Why AECCI',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           "At AECCI, we recognize that exporters and importers face issues "
//                               "due to lack of awareness about necessary legal documentation, "
//                               "trade procedures, and policies. Often, deals are made on trust "
//                               "without proper documentation, leading to disputes and business disagreements.",
//                           style: TextStyle(
//                             fontSize: 16,
//                             height: 1.5,
//                             color: Colors.black87,
//                           ),
//                         ),
//                         SizedBox(height: 14),
//                         Text(
//                           "The Legal wing goes hand-in-hand throughout your business journey, so that while "
//                               "taking care of making the initial procedures easier for you, complexity of expansion of business can also be taken care well in time.",
//                           style: TextStyle(
//                             fontSize: 16,
//                             height: 1.5,
//                             color: Colors.black87,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               // Our Services Expansion Tile (removed SizedBox spacing)
//               ExpansionTile(
//                 title: const Text(
//                   'Our Expertise',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           "Discover the services we offer related to business matters and beyond."
//                               "If you require guidance or assistance in any of these areas, don’t "
//                               "hesitate to reach out – we’re here to support you every step of the way.",
//                           style: TextStyle(
//                             fontSize: 16,
//                             height: 1.5,
//                             color: Colors.black87,
//                           ),
//                         ),
//
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               ExpansionTile(
//                 title: const Text(
//                   'What We Do',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           "Asian Exporters’ Chamber of Commerce and Industry is a non-profit "
//                               "organization that works to promote the trade and industry. Being authorised by "
//                               "Ministry of Commerce & Industry Government of India, we provide with the "
//                               "Certificate of Origin for the goods being produced in India and the attestation "
//                               "of necessary export documents. Additionally, we provide various services and "
//                               "resources to help businesses grow and succeed.",
//                           style: TextStyle(
//                             fontSize: 16,
//                             height: 1.5,
//                             color: Colors.black87,
//                           ),
//                         ),
//
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               ExpansionTile(
//                 title: const Text(
//                   'Our Initiatives',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           "BROAD INITIATIVES",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "1.Virtual Legal Clinics\n2.Mediation Services\n3.Contract Drafting and Review"
//                               "\n4.Specialized Workshops and Webinars\n5.Pro Bono Legal Services\nCompliance Training Programs"
//                               "\n6.Legal News and Updates working days.",
//                           style: TextStyle(
//                             fontSize: 16,
//                             height: 1.5,
//                             color: Colors.black87,
//                           ),
//                         ),
//
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               ExpansionTile(
//                 title: const Text(
//                   'Our Team',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           "Our multi-skilled team is here to do what’s right for you.",
//                           style: TextStyle(
//                             fontSize: 16,
//                             height: 1.5,
//                             color: Colors.black87,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Our Team blend expertise and teamwork seamlessly, ensuring that we can"
//                               " address your needs comprehensively. We offer a range of services, "
//                               "all rooted in our commitment to client-centered excellence. We are available 10am to 5:30pm on all working days.",
//                           style: TextStyle(
//                             fontSize: 16,
//                             height: 1.5,
//                             color: Colors.black87,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "ADV. ROHINI P.K\nReach Us:\nBoard lines: +91-22-412 711 45 | 46\nemail ID:\nlegal@aecci.org.in",
//                           style: TextStyle(
//                             fontSize: 16,
//                             height: 1.5,
//                             color: Colors.black87,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 18),
//                         Text(
//                           "ADV. AKSHATA MULIK\nReach Us:\nBoard lines: +91-22-412 711 45 | 46\nemail ID:\nlegal@aecci.org.in",
//                           style: TextStyle(
//                             fontSize: 16,
//                             height: 1.5,
//                             color: Colors.black87,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LegalWing extends StatefulWidget {
  @override
  _LegalWingState createState() => _LegalWingState();
}

class _LegalWingState extends State<LegalWing> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'AX-YCq7tKYo',
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
          'About Legal Wing',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.purple,
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
                icon: Icons.gavel,
                title: 'Legal Wing',
                content: 'Your Leading Partner for Resolving International Disputes and Handling Every Aspect of Your Legal Needs.',
                isExpandable: false,
              ),
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
                ),
              ),
              // Rest of the existing InfoCard widgets...
              InfoCard(
                icon: Icons.business,
                title: 'Why AECCI',
                content:
                'At AECCI, we recognize that exporters and importers face issues due to lack of awareness about necessary legal documentation, trade procedures, and policies.Often, deals are made on trust without proper documentation, leading to disputes and business disagreements.\n\nWith a team of experienced professionals well-versed in international trade regulations and dispute resolution mechanisms, AECCI-Legal Wing offers unparalleled expertise to safeguard your business interests.\n\nThe Legal wing goes hand-in-hand throughout your business journey, so that while taking care of making the initial procedures easier for you, complexity of expansion of business can also be taken care well in time.',
                isExpandable: true,
              ),
              InfoCard(
                icon: Icons.star_rate,
                title: 'Our Expertise',
                content:
                'Discover the services we offer related to business matters and beyond. We’re here to support you every step of the way.',
                isExpandable: false,
              ),
              InfoCard(
                icon: Icons.assignment,
                title: 'What We Do',
                content:
                'With a legacy spanning over a decade, AECCI has evolved to meet the changing needs of our Asian community, offering a breadth of services that encompass virtually every aspect of law. AECCI’s legal wing is a specialized division dedicated to provide with the robust legal support and advocacy to the members, ensuring a conducive environment for business growth and compliance.\n\nThe Legal Wing serves as the backbone of the Chamber’s commitment to fostering a fair and transparent business climate.\n\nThe Legal Wing’s primary objectives are:\n\n1.We through our legal wing offer expert legal advice and resources to help businesses to come-up smoothly with all the business compliances and complexes.\n2.Resolving the trade disputes through mediation and arbitration is what we are specialised in.\n3.Educating the business for right and safe business practices and important safety clauses is done through our expert legal professionals. They conduct seminars, workshops, and training sessions on critical legal issues affecting businesses.\n4.Advocate for the Business Interests and to make business voice heard in policy making process.',
                isExpandable: true,
              ),
              InfoCard(
                icon: Icons.lightbulb,
                title: 'Our Initiatives',
                content:
                '1. Virtual Legal Clinics\n2. Mediation Services\n3. Contract Drafting and Review\n4. Workshops and Webinars\n5. Pro Bono Legal Services\n6. Compliance Training Programs\n7.Legal News and Updates.',
                isExpandable: false,
              ),
              InfoCard(
                icon: Icons.group,
                title: 'Our Team',
                content:
                'Our multi-skilled team is here to do what’s right for you. We are available 10am to 5:30pm on all working days.\n\nADV. ROHINI P.K\n📞 +91-22-412 711 45 | 46\n✉ legal@aecci.org.in\n\nADV. AKSHATA MULIK\n📞 +91-22-412 711 45 | 46\n✉ legal@aecci.org.in',
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
                  '${widget.content.substring(0, 80)}...',
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