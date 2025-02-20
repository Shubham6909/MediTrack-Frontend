// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class ServicePages extends StatefulWidget {
//   final Map<String, dynamic> loginData;
//   final Map<String, dynamic> getData;
//   final String token;
//
//   const ServicePages({
//     Key? key,
//     required this.loginData,
//     required this.getData,
//     required this.token,
//   }) : super(key: key);
//
//   @override
//   _ServicePagesState createState() => _ServicePagesState();
// }
//
// class _ServicePagesState extends State<ServicePages> {
//   late Map<String, dynamic> _loginData;
//   late Map<String, dynamic> _getData;
//   late String _token;
//
//   bool showBalance = false;
//   Map<String, dynamic>? approveUserData;
//
//   // Service names that are available for display
//   List<String> items = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loginData = _deepCopy(widget.loginData);
//     _getData = _deepCopy(widget.getData);
//     _token = widget.token;
//
//     // Extract 'approveUserData' from the login data
//     if (_loginData.containsKey('info')) {
//       final info = _loginData['info'] as Map<String, dynamic>;
//       approveUserData = info['approveUserData'] as Map<String, dynamic>?;
//
//       // Filter the services that are marked as 'true'
//       if (approveUserData != null && approveUserData!['Services'] != null) {
//         final services = approveUserData!['Services'] as Map<String, dynamic>;
//
//         // Add only the services with 'true' values
//         services.forEach((service, value) {
//           // Check if value is of type bool and true
//           if (value is bool && value) {
//             items.add(service);
//           }
//         });
//       }
//     }
//   }
//
//   @override
//   void didUpdateWidget(ServicePages oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (!mapEquals(widget.loginData, oldWidget.loginData)) {
//       setState(() {
//         _loginData = _deepCopy(widget.loginData);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             'Services Overview',
//             style: TextStyle(
//               color: Colors.indigo,
//               fontSize: 18,
//               height: 1.2,
//             ),
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         scrolledUnderElevation: 0,
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.indigo,
//             size: 30,
//           ),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.home, color: Colors.indigo),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: Icon(Icons.lightbulb_outline, color: Colors.indigo),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       backgroundColor: Colors.grey.shade200,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               // Only build service cards for the enabled services
//               ...items.map((item) => buildServiceCard(context, item)).toList(),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/images/Quick.png',
//                     height: 20,
//                     width: 20,
//                     color: Colors.blueAccent,
//                     fit: BoxFit.cover,
//                   ),
//                   const SizedBox(width: 8),
//                   Text(
//                     "Quick Links",
//                     style: GoogleFonts.poppins(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               GridView.count(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 crossAxisCount: 3,
//                 mainAxisSpacing: 16,
//                 crossAxisSpacing: 16,
//                 childAspectRatio: 1,
//                 children: [
//                   _buildGridOptionCard(
//                     Icons.domain_verification_outlined,
//                     'E-Platform',
//                     Colors.blueAccent.shade100,
//                   ),
//                   _buildGridOptionCard(
//                     Icons.place_rounded,
//                     'E-Verification',
//                     Colors.deepOrange.shade400,
//                   ),
//                   _buildGridOptionCard(
//                     Icons.card_membership_sharp,
//                     'Membership',
//                     Colors.green,
//                   ),
//                   _buildGridOptionCard(
//                     Icons.announcement_rounded,
//                     'Annual Report',
//                     Colors.blueAccent.shade400,
//                   ),
//                   _buildGridOptionCard(
//                     Icons.business_center_outlined,
//                     'Innovation Index',
//                     Colors.purple,
//                   ),
//                   _buildGridOptionCard(
//                     Icons.info,
//                     'Research & Info',
//                     Colors.orange,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildServiceCard(BuildContext context, String title) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 0.0),
//       child: Card(
//         elevation: 3,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: ListTile(
//           title: Text(
//             title,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           trailing: const Icon(
//             Icons.arrow_forward_ios,
//             size: 20,
//           ),
//           onTap: () {
//             // You can add navigation for each service here if needed
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _buildGridOptionCard(IconData icon, String title, Color iconBackgroundColor) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 4,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             padding: EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(color: Colors.green),
//             ),
//             child: Icon(icon, size: 20, color: Colors.orange),
//           ),
//           SizedBox(height: 8),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.black87,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Map<String, dynamic> _deepCopy(Map<String, dynamic> source) {
//     return Map.from(source); // A simple deep copy, can be customized for nested structures
//   }
// }


import 'package:aecci/views/drawer/services/wallet_Scree.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

import '../../drawer/banner/country.dart';

class ServicePages extends StatefulWidget {
  final Map<String, dynamic> loginData;
  final Map<String, dynamic> getData;
  final String token;

  const ServicePages({
    Key? key,
    required this.loginData,
    required this.getData,
    required this.token,
  }) : super(key: key);

  @override
  _ServicePagesState createState() => _ServicePagesState();
}

class _ServicePagesState extends State<ServicePages> {
  late Map<String, dynamic> _loginData;
  late Map<String, dynamic> _getData;
  late Map<String, dynamic> _token;

  List<String> items = [];

  @override
  void initState() {
    super.initState();
    _loginData = _deepCopy(widget.loginData);
    _getData = _deepCopy(widget.getData);
    _token = _parseToken(widget.token);
    _extractServices();
  }

  @override
  void didUpdateWidget(ServicePages oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.loginData != oldWidget.loginData) {
      setState(() => _loginData = _deepCopy(widget.loginData));
    }
  }

  void _extractServices() {
    final info = _loginData['info'] as Map<String, dynamic>?;
    final approveUserData = info?['approveUserData'] as Map<String, dynamic>?;
    final services = approveUserData?['Services'] as Map<String, dynamic>?;
    if (services != null) {
      items = services.keys.where((key) => services[key] == true).toList();
    }
  }

  Map<String, dynamic> _parseToken(String token) {
    try {
      return json.decode(token) as Map<String, dynamic>;
    } catch (_) {
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services Overview', style: GoogleFonts.poppins(color: Color(0xFF1748F8), fontSize: 18)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1748F8), size: 30),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(icon: Icon(Icons.home, color: Color(0xFF1748F8)), onPressed: () {}),
          IconButton(icon: Icon(Icons.lightbulb_outline, color: Color(0xFF1748F8)), onPressed: () {}),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ...items.map((item) => _buildServiceCard(context, item)),
            const SizedBox(height: 16),
            _buildQuickLinks(),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, String title) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 20),
        onTap: () {
          print("Login Data: $_loginData");
          print("Token Data: $_token");

          // Ensure the userId and token are extracted correctly
          final String userId = _loginData['info']?['_id']?.toString() ?? '';
          final String token = widget.token; // Directly use the passed token

          print("Extracted User ID: $userId");
          print("Extracted Token: $token");

          // Check if both userId and token are available
          if (userId.isEmpty || token.isEmpty) {
            print("Error: User ID or Token not found");
            // Optionally show an alert or message to the user
            return;
          }

          // Navigate based on the title
          if (title == "Wallet") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WalletScreen(
                  userId: userId,
                  token: token,
                  getData: _getData,
                  loginData: _loginData,
                ),
              ),
            );
          } else if (title == "Collaboration Portal") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InternationalCollaboration(
                ),
              ),
            );
          } else if (title == "Membership Services") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WalletScreen(
                  userId: userId,
                  token: token,
                  getData: _getData,
                  loginData: _loginData,
                ),
              ),
            );
          }
        },
      ),
    );
  }



  Widget _buildQuickLinks() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Quick.png', height: 20, width: 20, color: Colors.blueAccent, fit: BoxFit.cover),
            const SizedBox(width: 8),
            Text("Quick Links", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 8),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1,
          children: [
            _buildGridOptionCard(Icons.domain_verification_outlined, 'E-Platform', Colors.blueAccent.shade100),
            _buildGridOptionCard(Icons.place_rounded, 'E-Verification', Colors.deepOrange.shade400),
            _buildGridOptionCard(Icons.card_membership_sharp, 'Membership', Colors.green),
            _buildGridOptionCard(Icons.announcement_rounded, 'Annual Report', Colors.blueAccent.shade400),
            _buildGridOptionCard(Icons.business_center_outlined, 'Innovation Index', Colors.purple),
            _buildGridOptionCard(Icons.info, 'Research & Info', Colors.orange),
          ],
        ),
      ],
    );
  }

  Widget _buildGridOptionCard(IconData icon, String title, Color iconBackgroundColor) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), boxShadow: [
        BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 4, offset: Offset(0, 2)),
      ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.green)),
            child: Icon(icon, size: 20, color: Colors.orange),
          ),
          SizedBox(height: 8),
          Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.black87, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Map<String, dynamic> _deepCopy(Map<String, dynamic> source) {
    return json.decode(json.encode(source));
  }
}






// onTap: () {
//   if (title == "Wallet") {
//     Navigator.push(
//       context,
//       // MaterialPageRoute(builder: (context) => WalletScreen(loginData: _loginData, getData: _getData, token: _token)),
//       MaterialPageRoute(builder: (context) => WalletScreen( userId: '', token: _token,)),
//     );
//   }
// },