// import 'package:flutter/material.dart';
//
// class Country {
//   final String name;
//   final String imagePath;
//   final String description;
//
//   const Country({
//     required this.name,
//     required this.imagePath,
//     required this.description,
//   });
// }
//
// class InternationalCollaboration extends StatelessWidget {
//   InternationalCollaboration({super.key});
//
//   final List<String> allCountries = [
//     'Brazil', 'Cambodia', 'Denmark', 'Egypt', 'Mexico',
//     'Tanzania', 'Bahamas', 'Bosnia', 'Algeria', 'Nigeria',
//     'Oman', 'Vietnam', 'UK', 'China', 'Pakistan',
//     'South Sudan', 'Turkey', 'Greece', 'Thailand', 'Ethiopia',
//     'Lebanese', 'Sri Lanka', 'UAE', 'Uzbekistan', 'Jordan',
//     'Poland', 'Indonesia', 'Morocco', 'Germany', 'Portugal',
//     'Kenya', 'Netherlands'
//   ];
//
//   final List<Country> countries = [
//     const Country(
//       name: 'Brazil',
//       imagePath: 'assets/images/Brazil.png',
//       description: 'Navigating cross border commerce: AECCI-ABDO Advogados Collaboration\n\n'
//           '♦Traders Support: A partnership for legal assistance to traders in Brazil and India.'
//           '\n♦Empowering Trade: AECCI and Abdo Advogados collaborate to empower exporters and importers.'
//           '\n♦Abdo Advogados: A top international law firm in Brazil.'
//           '\n♦Legal Support: They offer expert guidance on legal matters in their respective countries.'
//           '\n\nThis International collaboration supports trade industry exporters and importers.',
//     ),
//     const Country(
//       name: 'Cambodia',
//       imagePath: 'assets/images/Cambodia.png',
//       description: 'Strategic Partnership with Cambodia Chamber of Commerce\n\n'
//           '♦Trade Development: Fostering bilateral trade relations between Cambodia and India.'
//           '\n♦Business Opportunities: Creating platforms for business networking and expansion.'
//           '\n♦Cultural Exchange: Promoting understanding of business practices in both countries.'
//           '\n♦Economic Growth: Supporting initiatives for mutual economic development.',
//     ),
//     const Country(
//       name: 'Denmark',
//       imagePath: 'assets/images/denmar.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//     const Country(
//       name: 'Egypt',
//       imagePath: 'assets/images/Egypt.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//
//     const Country(
//       name: 'Mexico',
//       imagePath: 'assets/images/mexico.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//     const Country(
//       name: 'Tanzania',
//       imagePath: 'assets/images/tanzinia.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//     const Country(
//       name: 'Bahamas',
//       imagePath: 'assets/country/bahamas.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//
//     const Country(
//       name: 'Bosnia',
//       imagePath: 'assets/country/bosnia.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//     const Country(
//       name: 'Algeria',
//       imagePath: 'assets/country/algeria.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//
//     const Country(
//       name: 'Nigeria',
//       imagePath: 'assets/country/nigeria.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//
//     const Country(
//       name: 'Oman',
//       imagePath: 'assets/country/oman.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//
//     const Country(
//       name: 'Vietnam',
//       imagePath: 'assets/country/vietnam.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//
//     const Country(
//       name: 'UK',
//       imagePath: 'assets/country/uk.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//
//     const Country(
//       name: 'China',
//       imagePath: 'assets/country/china.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//
//     const Country(
//       name: 'Pakistan',
//       imagePath: 'assets/country/pakistan.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//
//     const Country(
//       name: 'South Sudan',
//       imagePath: 'assets/country/sudan.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//     const Country(
//       name: 'Turkey',
//       imagePath: 'assets/country/turkey.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//     const Country(
//       name: 'Greece',
//       imagePath: 'assets/country/thesis.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//     const Country(
//       name: 'Thailand',
//       imagePath: 'assets/country/thailand.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//     const Country(
//       name: 'Ethiopia',
//       imagePath: 'assets/country/ethiopia.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//     const Country(
//       name: 'Lebanese',
//       imagePath: 'assets/country/lebnan.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//     const Country(
//       name: 'Sri Lanka',
//       imagePath: 'assets/country/srilanka.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//     const Country(
//       name: 'UAE',
//       imagePath: 'assets/country/uae.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//     const Country(
//       name: 'Uzbekistan',
//       imagePath: 'assets/country/uzkebistan.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//     const Country(
//       name: 'Jordan',
//       imagePath: 'assets/country/jordan.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//     const Country(
//       name: 'Poland',
//       imagePath: 'assets/country/poland.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//     const Country(
//       name: 'Indonesia',
//       imagePath: 'assets/country/indonesia.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//     const Country(
//       name: 'Morocco',
//       imagePath: 'assets/country/morocco.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//     const Country(
//       name: 'Germany',
//       imagePath: 'assets/country/germany.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//     const Country(
//       name: 'Portugal',
//       imagePath: 'assets/country/portugal.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//     const Country(
//       name: 'Kenya',
//       imagePath: 'assets/country/kenya.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//     const Country(
//       name: 'Netherlands',
//       imagePath: 'assets/country/netherlands.png',
//       description: 'Collaboration with Danish Business Association\n\n'
//           '♦Innovation Partnership: Focusing on sustainable business practices.'
//           '\n♦Technology Exchange: Promoting technological collaboration between nations.'
//           '\n♦Green Initiatives: Supporting environmental-friendly trade practices.'
//           '\n♦Market Access: Facilitating entry into European markets.',
//     ),
//   ];
//
//   Country _getCountryDetails(String name) {
//     return countries.firstWhere(
//           (c) => c.name == name,
//       orElse: () => Country(
//         name: name,
//         imagePath: 'assets/images/c1.png',
//         description: 'International Partnership with $name\n\n'
//             '♦Trade Relations: Strengthening bilateral trade connections.'
//             '\n♦Business Development: Creating opportunities for growth and expansion.'
//             '\n♦Cultural Exchange: Fostering understanding of business practices.'
//             '\n♦Economic Cooperation: Working together for mutual prosperity.',
//       ),
//     );
//   }
//
//   Widget _buildCountryGrid() {
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         childAspectRatio: 2.5,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 14,
//       ),
//       itemCount: allCountries.length,
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () {
//             _showCountryDetails(context, _getCountryDetails(allCountries[index]));
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border.all(color: Colors.grey.shade300),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Center(
//               child: Text(
//                 allCountries[index],
//                 style: const TextStyle(
//                   fontSize: 14,
//                   color: Colors.black,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   void _showCountryDetails(BuildContext context, Country country) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return Dialog(
//           backgroundColor: Colors.white,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//           child: ConstrainedBox(
//             constraints: BoxConstraints(
//               maxHeight: MediaQuery.of(context).size.height * 0.7,
//               maxWidth: MediaQuery.of(context).size.width,
//             ),
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     AspectRatio(
//                       aspectRatio: 16 / 9,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           color: Colors.grey[200],
//                         ),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(8),
//                           child: Image.asset(
//                             country.imagePath,
//                             width: double.infinity,
//                             fit: BoxFit.cover,
//                             errorBuilder: (context, error, stackTrace) {
//                               debugPrint('Error loading image: ${country.imagePath}');
//                               return Container(
//                                 color: Colors.grey[300],
//                                 child: const Center(
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
//                                       SizedBox(height: 8),
//                                       Text(
//                                         'Image not available',
//                                         style: TextStyle(color: Colors.grey),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Text(
//                       country.name,
//                       style: const TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.purple,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       country.description,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         color: Colors.black87,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: ElevatedButton(
//                         onPressed: () => Navigator.pop(context),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 20,
//                             vertical: 10,
//                           ),
//                         ),
//                         child: const Text(
//                           'Close',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'International Collaboration',
//           style: TextStyle(color: Colors.white, fontSize: 20),
//         ),
//         backgroundColor: Colors.purple, // Rich header color
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.purple, Colors.deepPurpleAccent],
//           ),
//         ),
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               InfoCard(
//                 icon: Icons.collections_bookmark_rounded,
//                 title: 'International Collaboration',
//                 content:
//                 'Discover our strategic alliances with leading companies and exhibitions, driving growth and innovation in international trade. At AECCI, we believe in fostering synergies and creating opportunities for growth in the world of trade & Commerce.',
//                 isExpandable: false,
//               ),
//               _buildExpansionTile(
//                 title: 'About',
//                 content:
//                 "Asian Exporters Chamber of Commerce and Industry (AECCI) stands as a trailblazing organization dedicated to fostering global"
//                     "trade and commerce. Our commitment to facilitating international partnerships is reflected in our collaboration initiatives.\n\n"
//                     "Through these partnerships, firms can engage in various events, leverage their expertise in support in Trade/commercial case of"
//                     "disputes, and assist with compliance for investors considering investments in specific countries.\n\nIn the realm of exhibitions,"
//                     "AECCI, as a recognized trade body by the Ministry of Commerce, Government of India, plays a crucial role. We circulate information"
//                     "about exhibitions to our extensive network, including Indian exporters and members. This dissemination proves highly beneficial"
//                     "for exhibition organizers, ensuring a broader reach and increased participation.\n\nInitiated by AECCI, these collaborations"
//                     "extend beyond exhibitions, encompassing various domains. We actively engage with international markets to support our exporters"
//                     "in their future endeavors. At AECCI, we believe in creating synergies that contribute to the growth and success of businesses on a global scale.",
//               ),
//               _buildExpansionTile(
//                 title: 'Partnerships',
//                 content:
//                 "AECCI's Export Wing offers services such as issuing Certificates of Origin,",
//                 additionalContent: _buildCountryGrid(),
//               ),
//               _buildExpansionTile(
//                 title: 'Exhibitions',
//                 content:
//                 "E-platform: – To provide our exporter members with a hassle-free document attestation experience, we have developed an e-platform that allows them to have online COO (Non-Preferential) issued and the documents attestation services from the comfort of their office.\n\nThrough our e-Platform exporters’ can take the facility of E-COO (NP), Semi E-COO and Non-Standard Documents.\n\nE-Wallet facility is also provided for the convenience of the exporter members so to save the time of making payments every time.\n\nYour membership issuance and renewal are also done online without following the renewal letters or reminders.\n\nThis online facility not only saves time but also reduces costs for our members.\n\nAnnual Publication- ‘Revolution of artificial Intelligence in Export’ Our annual magazine is our key initiave aimed at advancing international trade by providing valuable insights and practical advice on integrating AI into export processes. This will prove to be a comprehensive guide designed to help exporters leverage artificial intelligence to enhance their export strategies.",
//               ),
//               _buildExpansionTile(
//                 title: 'Contact Us',
//                 content:
//                 "Interested in Collaborating with AECCI?\nIf you’re keen on exploring "
//                     "collaboration opportunities with AECCI, we’d be delighted to hear from you. "
//                     "Our dedicated team is here to assist and guide you through the process. "
//                     "Feel free to reach out using the contact details provided below:\n\nContact Information:"
//                     "\n\nMs. Swarn Lata(Executive Director)\nBoard lines: +91-22-412 711 45|46"
//                     "\nMobile/ Whatsapp:  +91-8433720996\nemail ID:\ninfo@aecci.org.in\ned@aecci.org.in",
//               ),
//               InfoCard(
//                 icon: Icons.collections_bookmark_rounded,
//                 title: 'AECCI:',
//                 content:
//                 'Fostering Growth through Strategic Collaborations and Global Exhibitions\n\nAECCI collaborates with esteemed law firms and companies, fostering mutual growth. Join us as we actively engage in international exhibitions and partner with International Law firms, creating global opportunities for businesses. Our commitment is to empower Exporters, enabling them to harness the full potential of these platforms. Explore the benefits of partnering with AECCI for success in the world of commerce. Together, we pave the way for progress and prosperity..',
//                 isExpandable: false,
//               ),
//
//               const SizedBox(height: 16),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildExpansionTile({required String title, required String content, Widget? additionalContent}) {
//     return Card(
//       color: Colors.deepPurple,
//       margin: const EdgeInsets.symmetric(vertical: 6),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: ExpansionTile(
//         title: Text(
//           title,
//           style: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 Text(
//                   content,
//                   style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.white),
//                 ),
//                 if (additionalContent != null) ...[
//                   SizedBox(height: 16),
//                   additionalContent,
//                 ],
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
// }
//
// class InfoCard extends StatefulWidget {
//   final IconData icon;
//   final String title;
//   final String content;
//   final bool isExpandable;
//
//   const InfoCard({
//     Key? key,
//     required this.icon,
//     required this.title,
//     required this.content,
//     this.isExpandable = false,
//   }) : super(key: key);
//
//   @override
//   _InfoCardState createState() => _InfoCardState();
// }
//
// class _InfoCardState extends State<InfoCard> {
//   bool isExpanded = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(widget.icon, color: Colors.purple, size: 28),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     widget.title,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             if (widget.isExpandable)
//               AnimatedCrossFade(
//                 firstChild: Text(
//                   '${widget.content.substring(0, 200)}...', // Show first 200 characters
//                   style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
//                 ),
//                 secondChild: Text(
//                   widget.content,
//                   style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
//                 ),
//                 crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
//                 duration: const Duration(milliseconds: 300),
//               )
//             else
//               Text(
//                 widget.content,
//                 style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
//               ),
//             if (widget.isExpandable)
//               TextButton(
//                 onPressed: () {
//                   setState(() {
//                     isExpanded = !isExpanded;
//                   });
//                 },
//                 child: Text(isExpanded ? "Show Less" : "Show More"),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }