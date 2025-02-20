import 'dart:async';
import 'package:aecci/views/drawer/banner/CustomBottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'drawer/banner/BannerWidget.dart';
import 'drawer/banner/carddashbaord.dart';
import 'drawer/banner/sponsors_section.dart';
import 'drawer/custom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

import 'drawer/events/virtula_b2b_forum.dart';

class DashboardScreen extends StatefulWidget {
  final Map<String, dynamic>? loginData;
  final Map<String, dynamic>? getData;


  final String token;

  const DashboardScreen({
    Key? key,
    this.loginData,
    this.getData,
    required this.token,
  }) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool showBalance = false; // Add this line
  // Existing variables
  String? firstName;
  String? balance;
  String? validUpTo;
  String? email;
  String? companyName;
  String? ownersName;
  int? establishmentYear;
  String? companyAdd;
  int? mobileNo;
  String? companyProduct;
  String? companyActivity;
  String? selectMembership;
  String? reqType;

  int _selectedIndex = 0;  // Add this for bottom navigation
  int _currentIndex = 0;

  final List<String> images = [
    'assets/images/viewpoint.png',
    'assets/images/viewpoint1.png',
    'assets/images/viewpoint2.png',
    'assets/images/viewpoint2.png',
    'assets/images/viewpoint3.png',
    'assets/images/viewpoint5.png',
    'assets/images/viewpoint6.png',
    'assets/images/sir1.png',
    'assets/images/viewpoint.png',
    'assets/images/viewpoint.png'
  ];

  final ScrollController _scrollController = ScrollController();
  late Timer _timer;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    // Initialize data from loginData and getData
    if (widget.loginData != null && widget.loginData!.containsKey('info')) {
      final info = widget.loginData!['info'] as Map<String, dynamic>;
      firstName = info['firstName']?.toString();
      balance = info['balance']?.toString() ?? 'N/A';
      validUpTo = info['validUpTo']?.toString() ?? 'N/A';
      email = info['email']?.toString() ?? 'N/A';
      companyName = info['companyName']?.toString() ?? 'N/A';
      selectMembership = info['selectMembership']?.toString() ?? 'N/A';
      reqType = info['reqType']?.toString() ?? 'N/A';
    }

    if (widget.getData != null && widget.getData!.containsKey('data')) {
      final data = widget.getData!['data'] as Map<String, dynamic>;
      ownersName = data['ownersName']?.toString() ?? 'N/A';
      establishmentYear = data['establishmentYear'] ?? 0;
      companyAdd = data['companyAdd']?.toString() ?? 'N/A';
      mobileNo = data['mobileNo'] ?? 0;
      companyProduct = data['companyProduct']?.toString() ?? 'N/A';
      companyActivity = data['companyActivity']?.toString() ?? 'N/A';
    }

    startAutoScroll();
  }

  void startAutoScroll() {
    const double scrollSpeed = 60.0;
    const int frameDuration = 600;

    _timer = Timer.periodic(Duration(milliseconds: frameDuration), (timer) {
      if (_scrollController.hasClients) {
        final maxScrollExtent = _scrollController.position.maxScrollExtent;
        final currentScrollPosition = _scrollController.position.pixels;
        final newScrollPosition = currentScrollPosition + scrollSpeed;

        if (newScrollPosition >= maxScrollExtent) {
          _scrollController.jumpTo(0.0);
        } else {
          _scrollController.animateTo(
            newScrollPosition,
            duration: Duration(milliseconds: frameDuration),
            curve: Curves.linear,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  String formatDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat('dd MMM yyyy').format(parsedDate);
    } catch (e) {
      return date;
    }
  }

  // Helper Methods to Reuse Text Styling
  Widget _buildTextLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14, // Smaller text size
        fontWeight: FontWeight.bold,
        color: Colors.white70, // Slightly dimmed color for labels
      ),
    );
  }

  Widget _buildTextValue(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14, // Slightly larger than label
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }

  Widget _buildOptionCardImg(String imagePath, String label, BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerSize = screenWidth * 0.26; // Responsive container size
    double imageSize = screenWidth * 0.14; // Responsive image size
    double fontSize = screenWidth * 0.03; // Responsive font size

    return Container(
      width: containerSize.clamp(80.0, 140.0), // Ensure a reasonable size range
      height: containerSize.clamp(80.0, 140.0),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.white, width: 2.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: imageSize, fit: BoxFit.contain),
          SizedBox(height: 4.0),
          SizedBox(
            width: containerSize * 0.8, // Ensure proper centering
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize.clamp(10.0, 16.0), // Adjusted font size range
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }


// Helper method to get the membership label
  String _getMembershipLabel(String? selectMembership) {
    switch (selectMembership) {
      case 'Digital User':
        return 'AECCI Code No:-';
      case 'Collaboration':
        return 'Collaboration No:-';
      default:
        return 'Membership No:-';
    }
  }

  // Helper method to get the membership label
  String _getCurrentlyOur(String? selectMembership) {
    switch (selectMembership) {
      case 'Digital User':
        return 'Digital User';
      case 'Collaboration':
        return 'Collaboration\nPartner';
      case 'Corporate':
        return 'Corporate\nMember';
      case 'Corporate +':
        return 'Corporate Plus\nMember';
      case 'Overseas':
        return 'Overseas\nMember';
      case 'Non-Profit Organization':
        return 'Non-Profit\nOrganization';
      default:
        return 'Corporate\nMember';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        context: context,
        loginData: widget.loginData ?? {},
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false, // This will remove the default drawer icon
        title: Image.asset(
          'assets/images/logo786.png',
          height: 50,
          fit: BoxFit.contain,
        ),
        actions: [
          Wrap(
            spacing: -4, // Negative value to reduce space
            children: [
              IconButton(
                icon: Icon(Icons.lightbulb_outline, color: Color(0xFF1748F8)),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.access_time, color:Color(0xFF1748F8)),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.logout, color: Color(0xFF1748F8)),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 350,
                color: Colors.grey[100], // Set background color to grey[100]
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xffebebeff),
                          child: Icon(
                            Icons.person,
                            size: 40.0,
                            color: Color(0xFF1748F8),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome!",
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "$companyName",
                              style: GoogleFonts.roboto(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "$email",
                              style: GoogleFonts.roboto(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 350, // Adjusted for better resemblance
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0), // Slightly more rounded
                      ),
                      child: Card(
                        // color: Color(0xFF001F8E), // Matching deep blue shade
                        color: Color(0xFF1748F8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                       _getCurrentlyOur(selectMembership),
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  _getMembershipLabel(selectMembership),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4),
                                      _buildTextValue("${widget.loginData!['info']['memberShipNo']}"),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    showBalance ? "₹ ${balance ?? 'N/A'}" : "₹ *****",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        showBalance = !showBalance;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 250),
                                      curve: Curves.easeInOut,
                                      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: Colors.white.withOpacity(0.4), width: 1),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            blurRadius: 2,
                                            spreadRadius: 1,
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            showBalance ? 'Hide' : 'Show',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          SizedBox(width: 6),
                                          Icon(
                                            showBalance ? Icons.visibility_off : Icons.visibility,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // if (reqType == "collaborationReq" || reqType == "ePlatformReq") ...[
                    if (reqType == "ePlatformReq") ...[
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            double screenWidth = constraints.maxWidth;
                            double spacing = screenWidth * 0.02; // Responsive spacing
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildOptionCardImg('assets/images/eco.png', 'E-Platform', context),
                                _buildOptionCardImg('assets/images/doc1.png', 'E-Verification', context),
                                _buildOptionCardImg('assets/images/mem1.png', 'Membership', context),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                    SizedBox(height: 15),
                    BannerWidget(),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              child: Container(
                color: Colors.white, // Set background color
                padding: EdgeInsets.symmetric(vertical: 10), // Adjust spacing
                child: Column(
                  children: [
                    CardDashboard(
                      loginData: widget.loginData ?? {},
                      token: widget.token,
                      getData: widget.getData ?? {},
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Container(
                        width: 326,
                        child: Column(
                          children: [
                            if (reqType == "collaborationReq") ...[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 14),
                                  Text(
                                    "For a Collaborator",
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VirtualB2BForumScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 124,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.green.shade500, Colors.blue.shade400],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 6,
                                        offset: Offset(2, 4),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                        ),
                                        child: Image.asset(
                                          'assets/images/coll.png',
                                          width: 150,
                                          height: 150,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "Collaborator",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                            if (reqType != "collaborationReq") ...[
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 14),
                                  Text(
                                    " B2B Virtual Forum",
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VirtualB2BForumScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 124,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.green.shade500, Colors.blue.shade400],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 6,
                                        offset: Offset(2, 4),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                        ),
                                        child: Image.asset(
                                          'assets/images/b2b2.png',
                                          width: 150,
                                          height: 150,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "Virtual B2B Forum",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Container(
                        width: 350,
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'Query Notes & Wing Consultation',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10),
                                SizedBox(
                                  height: 120,
                                  child: SingleChildScrollView(
                                    controller: _scrollController,
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: images.map((image) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                          child: Image.asset(image, height: 120, fit: BoxFit.cover),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SponsorsSection(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white, // Set background color
        child: CustomBottomNavBar(
          currentIndex: _currentIndex,
          loginData: widget.loginData ?? {},
          getData: widget.getData ?? {},
          token: widget.token,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),

    );
  }
}