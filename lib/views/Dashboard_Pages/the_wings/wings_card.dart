import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WingsCardPages extends StatefulWidget {
  final Map<String, dynamic> loginData;
  final Map<String, dynamic> getData;
  final String token;

  const WingsCardPages({
    Key? key,
    required this.loginData,
    required this.getData,
    required this.token,
  }) : super(key: key);

  @override
  _WingsCardPagesState createState() => _WingsCardPagesState();
}

class _WingsCardPagesState extends State<WingsCardPages> {
  late Map<String, dynamic> _loginData;
  late Map<String, dynamic> _getData;
  late String _token;

  bool showBalance = false;
  Map<String, dynamic>? approveUserData;

  // Service names that are available for display
  List<String> items = [];

  @override
  void initState() {
    super.initState();
    _loginData = _deepCopy(widget.loginData);
    _getData = _deepCopy(widget.getData);
    _token = widget.token;

    // Extract 'approveUserData' from the login data
    if (_loginData.containsKey('info')) {
      final info = _loginData['info'] as Map<String, dynamic>;
      approveUserData = info['approveUserData'] as Map<String, dynamic>?;

      // Filter the services that are marked as 'true'
      if (approveUserData != null && approveUserData!['The Wings'] != null) {
        final services = approveUserData!['The Wings'] as Map<String, dynamic>;

        // Add only the services with 'true' values
        services.forEach((service, value) {
          // Check if value is of type bool and true
          if (value is bool && value) {
            items.add(service);
          }
        });
      }
    }
  }

  @override
  void didUpdateWidget(WingsCardPages oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!mapEquals(widget.loginData, oldWidget.loginData)) {
      setState(() {
        _loginData = _deepCopy(widget.loginData);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Wings Overview',
            style: TextStyle(
              color: Color(0xFF1748F8),
              fontSize: 18,
              height: 1.2,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF1748F8),
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home, color: Color(0xFF1748F8)),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.lightbulb_outline, color: Color(0xFF1748F8)),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Only build service cards for the enabled services
              ...items.map((item) => buildServiceCard(context, item)).toList(),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Quick.png',
                    height: 20,
                    width: 20,
                    color: Colors.blueAccent,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Quick Links",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                  _buildGridOptionCard(
                    Icons.domain_verification_outlined,
                    'E-Platform',
                    Colors.blueAccent.shade100,
                  ),
                  _buildGridOptionCard(
                    Icons.place_rounded,
                    'E-Verification',
                    Colors.deepOrange.shade400,
                  ),
                  _buildGridOptionCard(
                    Icons.card_membership_sharp,
                    'Membership',
                    Colors.green,
                  ),
                  _buildGridOptionCard(
                    Icons.announcement_rounded,
                    'Annual Report',
                    Colors.blueAccent.shade400,
                  ),
                  _buildGridOptionCard(
                    Icons.business_center_outlined,
                    'Innovation Index',
                    Colors.purple,
                  ),
                  _buildGridOptionCard(
                    Icons.info,
                    'Research & Info',
                    Colors.orange,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildServiceCard(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
          onTap: () {
            // You can add navigation for each service here if needed
          },
        ),
      ),
    );
  }

  Widget _buildGridOptionCard(IconData icon, String title, Color iconBackgroundColor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green),
            ),
            child: Icon(icon, size: 20, color: Colors.orange),
          ),
          SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }



  Map<String, dynamic> _deepCopy(Map<String, dynamic> source) {
    return Map.from(source); // A simple deep copy, can be customized for nested structures
  }
}




