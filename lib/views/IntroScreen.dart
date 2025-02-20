// import 'package:flutter/material.dart';
// import 'package:aecci/views/Sign_Up/B2B.dart';
// import 'package:aecci/views/Sign_Up/Collaborator.dart';
// import 'package:aecci/views/login_view.dart';
//
// class IntroScreen extends StatefulWidget {
//   const IntroScreen({Key? key}) : super(key: key);
//
//   @override
//   _IntroScreenState createState() => _IntroScreenState();
// }
//
// class _IntroScreenState extends State<IntroScreen> {
//   bool isDropdownOpen = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(height: 100),
//               Image.asset(
//                 'assets/images/aecci3.png',
//                 height: 130,
//                 fit: BoxFit.cover,
//               ),
//               const Text(
//                 'Asian Exporters Chamber of Commerce and Industry',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontFamily: 'OutFit',
//                   fontWeight: FontWeight.bold,
//                   color: Colors.purple,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 40.0),
//                 child: const Text(
//                   'Embark on a new era of seamless business solutions! AECCI proudly unveils its upgraded e-Platform.',
//                   textAlign: TextAlign.left,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontFamily: 'Impact',
//                     fontWeight: FontWeight.bold,
//                     color: Colors.purple,
//                   ),
//                   softWrap: true,
//                   overflow: TextOverflow.visible,
//                 ),
//               ),
//               SizedBox(height: 45),
//
//               // Dropdown section
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30),
//                 child: Column(
//                   children: [
//                     // Sign Up Button
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           isDropdownOpen = !isDropdownOpen;  // Toggle dropdown
//                         });
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.purple,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 35), // Adjust horizontal padding
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min, // Shrinks to fit content
//                         children: [
//                           // Wrap the text in a Flexible widget to prevent overflow
//                           Flexible(
//                             child: const Text(
//                               'Select category',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontFamily: 'Impact',
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                                 letterSpacing: 3,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 15),
//                           CircleAvatar(
//                             backgroundColor: Colors.white,
//                             radius: 15,
//                             child: Icon(
//                               isDropdownOpen
//                                   ? Icons.keyboard_arrow_up
//                                   : Icons.keyboard_arrow_right_outlined,
//                               color: Colors.purple,
//                               size: 30,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//
//                     if (isDropdownOpen)
//                       Container(
//                         margin: const EdgeInsets.only(top: 8),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(8),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.2),
//                               spreadRadius: 2,
//                               blurRadius: 4,
//                               offset: const Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           children: [
//                             ListTile(
//                               title: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start, // Aligns the text and icon to the left
//                                 children: [
//                                   const Text(
//                                     'Sign up for B2B',
//                                     style: TextStyle(
//                                       color: Colors.purple,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                   SizedBox(width: 8),
//                                   Icon(
//                                     Icons.keyboard_arrow_right_outlined,
//                                     color: Colors.purple,
//                                     size: 30,
//                                   ),
//                                 ],
//                               ),
//                               onTap: () {
//                                 setState(() {
//                                   isDropdownOpen = false;
//                                 });
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(builder: (context) => B2BScreen1()),
//                                 );
//                               },
//                             ),
//
//
//                             const Divider(height: 1),
//                             ListTile(
//                               title: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start, // Aligns the text and icon to the left
//                                 children: [
//                                   const Text(
//                                     'Sign up for Collaborator',
//                                     style: TextStyle(
//                                       color: Colors.purple,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                   SizedBox(width: 8),
//                                   Icon(
//                                     Icons.keyboard_arrow_right_outlined, // You can change this to any other icon you like
//                                     color: Colors.purple,
//                                     size: 30,
//                                   ),
//                                 ],
//                               ),
//                               onTap: () {
//                                 setState(() {
//                                   isDropdownOpen = false;
//                                 });
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(builder: (context) => Collaborator()),
//                                 );
//                               },
//                             ),
//
//                             const Divider(height: 1),
//                             ListTile(
//                               title: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start, // Aligns the text and icon to the left
//                                 children: [
//                                   const Text(
//                                     'Sign up for E-Platform',
//                                     style: TextStyle(
//                                       color: Colors.purple,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                   Icon(
//                                     Icons.keyboard_arrow_right_outlined, // You can use any icon you prefer
//                                     color: Colors.purple,
//                                     size: 30,
//                                   ),
//                                 ],
//                               ),
//                               onTap: () {
//                                 setState(() {
//                                   isDropdownOpen = false;
//                                 });
//
//                               },
//                             ),
//
//                           ],
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//
//               SizedBox(height: 40),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 35.0),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: ElevatedButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => LoginScreen()),
//                               );
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.blue,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                               padding: const EdgeInsets.symmetric(vertical: 5.0),
//                             ),
//                             child: const Text(
//                               'Log In',
//                               style: TextStyle(fontSize: 14, color: Colors.white),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 30),
//                         Expanded(
//                           child: ElevatedButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => IntroScreen()),
//                               );
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.blue,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                               padding: const EdgeInsets.symmetric(vertical: 5.0),
//                             ),
//                             child: const Text(
//                               'Forgot Password',
//                               style: TextStyle(fontSize: 14, color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aecci/views/login_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aecci/views/banner.dart';
import 'package:aecci/views/footer.dart';
import 'package:aecci/views/drawer/events/virtula_b2b_forum.dart';
import 'package:aecci/views/Sign_Up/news.dart';
import 'package:aecci/views/about app/export_wing.dart';
import 'package:aecci/views/about app/professional_wing.dart';
import 'package:aecci/views/about app/legal_wing.dart';
import 'package:aecci/views/about app/hr_support_wing.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:aecci/views/about app/coming.dart';
import 'package:aecci/views/about app/business_advice_wing.dart';
import 'package:aecci/views/Sign_Up/collaborator.dart';
import 'package:aecci/views/footer1.dart';
import 'package:aecci/views/about app/coming.dart';
import 'package:aecci/views/Sign_Up/B2B.dart';
import 'package:aecci/views/Sign_Up/sponsor_section.dart';
import 'package:aecci/views/Sign_Up/networking.dart';
import 'package:aecci/views/Sign_Up/magzines.dart';
import 'package:aecci/views/services/wings.dart';
import 'package:aecci/views/services/services_.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  String currentNews = "";

  // Function to set current news (from the ScrollingNewsText widget)
  void setCurrentNews(String news) {
    setState(() {
      currentNews = news;
    });
  }
  int _currentIndex = 0;

  // static const List<NavigationItem> _navigationItems = [
  //   NavigationItem(icon: Icons.home, label: 'Home'),
  //   NavigationItem(icon: Icons.person_outline, label: 'Profile'),
  //   NavigationItem(icon: Icons.currency_rupee, label: 'Payments'),
  //   NavigationItem(icon: Icons.credit_card, label: 'Cards'),
  //   NavigationItem(icon: Icons.menu, label: 'Menu'),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Ensures full background is white
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Image.asset(
          'assets/images/logo786.png',
          height: 50,
          fit: BoxFit.contain,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => VirtualB2BForumScreen()),
              );
            },
            icon: Icon(Icons.search_rounded,color: Colors.red),
          ),

          // IconButton(
          //   icon: Icon(Icons.notifications, color: Colors.red),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => MessageScreen(newsMessage: currentNews), // Pass the selected news here
          //       ),
          //     );
          //   },
          //
          // ),

          IconButton(
            icon: Icon(Icons.account_circle_sharp, color: Colors.red),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white54,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BannerWidget(),
              const SizedBox(height: 8),
              ScrollingNewsText(),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Our",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Image.asset(
                    'assets/images/Wing.png',
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Wings",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              GridView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 8,
                ),
                children: [
                  serviceCard(
                      context,
                      'assets/images/logistics.png',
                      "Export",
                      Colors.blueAccent.shade100
                  ),
                  serviceCard(
                      context,
                      'assets/images/engineer.png',
                      "Professional",
                      Colors.blueAccent.shade100
                  ),
                  serviceCard(
                      context,
                      'assets/images/agreement.png',
                      "Legal",
                      Colors.blueAccent.shade100
                  ),
                  serviceCard(
                      context,
                      'assets/images/desk.png',
                      "HR Support",
                      Colors.blueAccent.shade100
                  ),
                  serviceCard(
                      context,
                      'assets/images/cooperation.png',
                      "Business Advice",
                      Colors.blueAccent.shade100
                  ),
                  serviceCard(
                      context,
                      'assets/images/people.png',
                      "Event & Seminar",
                      Colors.blueAccent.shade100
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/b2b1.jpg',
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 8),
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
                      builder: (context) => B2BScreen1(),
                    ),
                  );
                },
                child: Container(
                  height: 100,
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
                            "Virtual B2B Forum\nRegistration Here",
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
              const SizedBox(height: 13),
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
                  SizedBox(width: 8),
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
              GridView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 8,
                ),
                children: [
                  serviceCard1(
                      context, Icons.domain_verification_outlined, "e-Platform",
                      Colors.blueAccent.shade100,
                      'https://www.aecci.org.in/e-platform/'),
                  serviceCard1(
                      context, Icons.announcement_rounded, "Annual Report",
                      Colors.blueAccent.shade400,
                      'https://www.aecci.org.in/aecci-annual-report/'),
                  serviceCard1(
                      context, Icons.place_rounded, "e-CO Verification",
                      Colors.deepOrange.shade400,
                      'https://e-platform.aecci.org.in/e-co-verification'),
                  serviceCard1(context, Icons.business_center_outlined,
                      "Innovation Index", Colors.purple,
                      'https://www.aecci.org.in/india-innovation-index/'),
                  serviceCard1(
                      context, Icons.card_membership_sharp, "Membership",
                      Colors.green, 'https://www.aecci.org.in/membership/'),
                  serviceCard1(
                      context, Icons.info, "Research & Info", Colors.orange,
                      'https://www.aecci.org.in/aecci-research-and-information-2/'),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/coll.png',
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 8),
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
                      builder: (context) => Collaborator(),
                    ),
                  );
                },
                child: Container(
                  height: 100,
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
                          'assets/images/coll1.png',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Collaborator Registration Here",
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
              NetworkingSections(),
              SizedBox(height: 10),
              AdvertiseScreen(),
              SizedBox(height: 10),
              SponsorsSection(),


            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      //  items: _navigationItems, // Here we pass the navigation items
      ),
    );


   // );
  }
//}


      // floatingActionButton: Container(
      //   width: 40,
      //   height: 40,
      //   margin: const EdgeInsets.only(bottom: 1), // Adjust spacing from bottom
      //   decoration: const BoxDecoration(
      //     color: Color(0xFF1B3149),
      //     shape: BoxShape.circle,
      //     boxShadow: [
      //
      //     ],
      //   ),
      //   child: const Icon(
      //     Icons.add,
      //     color: Colors.white,
      //     size: 30,
      //   ),
      // ),
      //
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.home_outlined,
      //         color: Colors.red,
      //         size: 28,
      //       ),
      //       label: 'Home',
      //     ),
      //     const BottomNavigationBarItem(
      //       icon: SizedBox.shrink(), // Hidden center item
      //       label: 'Menu',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.article_outlined,
      //         color: Colors.green,
      //         size: 28,
      //       ),
      //       label: 'B2B Forum',
      //     ),
      //   ],
      //   selectedItemColor: Colors.red,
      //   unselectedItemColor: Colors.grey[600],
      //   backgroundColor: Colors.white,
      //   elevation: 8,
      //   type: BottomNavigationBarType.fixed,
      //   showSelectedLabels: true,
      //   showUnselectedLabels: true,
      //   onTap: (index) {
      //     if (index == 0) { // Menu item tapped
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => IntroScreen()),
      //       );
      //     } else if (index == 1) {
      //       Navigator.push(context, MaterialPageRoute(builder: (context) => MenuScreen()),
      //       );
      //     }
      //     else if (index == 2) { // Login item tapped
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) =>  VirtualB2BForumScreen()),
      //       );
      //     }
      //   },
      // ),

  //   );
  // }

  // Widget serviceCard(IconData icon, String title, Color iconBackgroundColor) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(6),  // Reduced from 8
  //       border: Border.all(color: Colors.grey.shade300),
  //     ),
  //     padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8), // Reduced padding
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Container(
  //           decoration: BoxDecoration(
  //             color: iconBackgroundColor,  // Use the passed background color
  //             shape: BoxShape.circle,  // Makes the background circular
  //           ),
  //           padding: const EdgeInsets.all(8), // Adjust padding to control size of the circle
  //           child: Icon(icon, size: 16, color: Colors.white), // Icon inside the circle
  //         ),
  //         const SizedBox(width: 6),  // Reduced from 8
  //         Expanded(
  //           child: Text(
  //             title,
  //             textAlign: TextAlign.left,
  //             style: GoogleFonts.poppins(
  //               fontSize: 12,
  //               fontWeight: FontWeight.w500,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget serviceCard(BuildContext context, String imagePath, String title, Color iconBackgroundColor) {
    return GestureDetector(
      onTap: () {
        if (title == "Export") {
          showExportWingPopup(context);
        } else if (title == "Professional") {
          showExportWingPopup1(context);
        } else if (title == "Legal") {
          showExportWingPopup2(context);
        } else if (title == "HR Support") {
          showExportWingPopup3(context);
        } else if (title == "Business Advice") {
          showExportWingPopup4(context);
        } else if (title == "Event & Seminar") {
          showExportWingPopup5(context);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.grey.shade300),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                imagePath, // Path to the image
                width: 24, // Set the size of the image
                height: 24, // Set the size of the image
                fit: BoxFit.cover, // Optionally adjust the fit
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget serviceCard1(BuildContext context, IconData icon, String title, Color iconBackgroundColor, String url) {
    return GestureDetector(
      onTap: () async {
        try {
          final Uri uri = Uri.parse(url);
          if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
            throw 'Could not launch $url';
          }
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Could not open the link. Please check your internet connection.'),
                duration: Duration(seconds: 2),
              ),
            );
          }
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.grey.shade300),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8),
              child: Icon(icon, size: 16, color: Colors.white),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void showExportWingPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // Allows closing the dialog by tapping outside
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white, // Set background color to white
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          insetPadding: EdgeInsets.zero, // Removes default padding for fullscreen effect
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.90,  // Full width
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView( // Wrap content in a scrollable view
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left side: Image
                        Row(
                          children: [
                            SizedBox(width: 60),
                            Image.asset(
                              'assets/images/logistics.png', // Replace with your image path
                              width: 24, // Adjust the width as needed
                              height: 24, // Adjust the height as needed
                              fit: BoxFit.cover, // Optionally adjust the fit
                            ),
                            const SizedBox(width: 8), // Adds some space between the image and text
                            Text(
                              "Export Wing",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),

                        // Right side: Close button
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.close, color: Colors.red),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
                    Text(
                      "Exports wing helps understand the foreign trade procedures and policies to all the members and offers "
                          "essential documents handy such "
                          "as Certificates of Origin (non-Preferential) and makes good shipping abroad easy.",
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Why AECCI",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Asian Exporters’ Chamber of Commerce and Industry is a non-profit organization that works to "
                          "promote the trade and industry. Being authorised by Ministry of Commerce & Industry "
                          "Government of India, we provide with the Certificate of Origin for the goods being produced "
                          "in India and the attestation of necessary export documents. "
                          "Additionally, we provide various services and resources to help businesses grow and succeed.",
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "* We ensure your business not only grows but flourishes in the global market.",
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                    ),
                    const SizedBox(height: 8),
                    // GestureDetector(
                    //   onTap: () {
                    //     // Navigate to the ExportWing screen when the "Read More" text is tapped
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => ExportWing()), // Replace ExportWing() with your actual screen widget
                    //     );
                    //   },
                    //   child: Text(
                    //     "Read More",
                    //     style: GoogleFonts.poppins(
                    //       fontSize: 14,
                    //       color: Colors.blue,
                    //     ),
                    //   ),
                    // ),

                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12), // Added padding
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ExportWing()),
                              );
                            },
                            child: Text(
                              "More Info",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12), // Added padding
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ComingSoonScreen()),
                              );
                            },
                            child: Text(
                              "Submit our Query", // Removed extra space
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              maxLines: 1, // Force single line
                              overflow: TextOverflow.ellipsis, // Handle overflow gracefully
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
        );
      },
    );
  }
  void showExportWingPopup1(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // Allows closing the dialog by tapping outside
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white, // Set background color to white
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          insetPadding: EdgeInsets.zero, // Removes default padding for fullscreen effect
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.90,  // Full width
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView( // Wrap content in a scrollable view
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left side: Image
                        Row(
                          children: [
                            SizedBox(width: 60),
                            Image.asset(
                              'assets/images/engineer.png', // Replace with your image path
                              width: 24, // Adjust the width as needed
                              height: 24, // Adjust the height as needed
                              fit: BoxFit.cover, // Optionally adjust the fit
                            ),
                            const SizedBox(width: 8), // Adds some space between the image and text
                            Text(
                              "Professional Wing",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.close, color: Colors.red),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Professional Wing supports Asian business community with consultation and services to establish "
                          "new ventures and to deal with day to day issues in existing business, "
                          "their expansion and diversification plans.",
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      "AECCI’s endeavor in establishing its Professional wing is to "
                          "provide consultation and services for all the corporate and commercial fields "
                          "in the most efficient manner. For every business various "
                          "compliance are needed to be fulfilled, and the professionals like C"
                          "hartered Accountant, Company Secretaries, Tax Consultant and Finance "
                          "Professionals are the backbone of business.",
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "* We ensure your business not only grows but flourishes in the global market.",
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey.shade600),
                    ),

                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12), // Added padding
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfessionalWing()),
                              );
                            },
                            child: Text(
                              "More Info",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12), // Added padding
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ComingSoonScreen()),
                              );
                            },
                            child: Text(
                              "Submit our Query", // Removed extra space
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              maxLines: 1, // Force single line
                              overflow: TextOverflow.ellipsis, // Handle overflow gracefully
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
        );
      },
    );
  }
  void showExportWingPopup2(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // Allows closing the dialog by tapping outside
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white, // Set background color to white
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          insetPadding: EdgeInsets.zero, // Removes default padding for fullscreen effect
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.90,
            height: MediaQuery.of(context).size.height * 0.70,
            // Full width
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView( // Wrap content in a scrollable view
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left side: Image
                        Row(
                          children: [
                            SizedBox(width: 60),
                            Image.asset(
                              'assets/images/agreement.png', // Replace with your image path
                              width: 24, // Adjust the width as needed
                              height: 24, // Adjust the height as needed
                              fit: BoxFit.cover, // Optionally adjust the fit
                            ),
                            const SizedBox(width: 8), // Adds some space between the image and text
                            Text(
                              "Legal Wing",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.close, color: Colors.red),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "“Your Leading Partner for Resolving International Disputes and Handling Every Aspect of Your Legal Needs.”",
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.indigo),
                    ),
                    const SizedBox(height: 12),

                    Text(
                      "The AECCI-Legal Wing is dedicated to providing comprehensive and specialized "
                          "legal services tailored to the complexities of international trade and commercial business.",
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Our team of seasoned legal professionals offers expert assistance in navigating the intricate "
                          "landscape of business law, with a particular emphasis on resolving international trade disputes.",
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Why AECCI",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "At AECCI, we recognize that exporters and importers face "
                          "issues due to lack of awareness about necessary legal "
                          "documentation, trade procedures, and policies. Often, "
                          "deals are made on trust without proper documentation, leading to "
                          "disputes and business disagreements.",
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey.shade600),
                    ),

                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12), // Added padding
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LegalWing()),
                              );
                            },
                            child: Text(
                              "More Info",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12), // Added padding
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ComingSoonScreen()),
                              );
                            },
                            child: Text(
                              "Submit our Query", // Removed extra space
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              maxLines: 1, // Force single line
                              overflow: TextOverflow.ellipsis, // Handle overflow gracefully
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
        );
      },
    );
  }
  void showExportWingPopup3(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          insetPadding: EdgeInsets.zero,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.90,
            height: MediaQuery.of(context).size.height * 0.70,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left side: Image
                              Row(
                                children: [
                                  SizedBox(width: 60),
                                  Image.asset(
                                    'assets/images/desk.png', // Replace with your image path
                                    width: 24, // Adjust the width as needed
                                    height: 24, // Adjust the height as needed
                                    fit: BoxFit.cover, // Optionally adjust the fit
                                  ),
                                  const SizedBox(width: 8), // Adds some space between the image and text
                                  Text(
                                    "HR Support Wing",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Icon(Icons.close, color: Colors.red),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Ensuring Employee Well-Being and Driving Business Growth through Exceptional HR Support",
                            style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey.shade600),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Do Employees have Question You Just Can't Answer?",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "In any case, does your business seek out the guidance "
                                "of reliable experts who can point the way forward?",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "What HR Solution does AECCI Provide?",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "• Employment Law\n"
                                "• Staff Grievances and Disputes\n"
                                "• Disciplinary Issues\n"
                                "• Contracts of Employment\n"
                                "• Managing Apprentices\n"
                                "• Calculating Settlement Agreements",
                            style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey.shade600),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "“AECCIs HR Support in Standardizing Hiring, Onboarding, and Offboarding“",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "For more information please contact :",
                            style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey.shade600),
                          ),
                          Text(
                            "HR Support Wing :",
                            style: GoogleFonts.poppins(fontSize: 14, color: Colors.black,),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "•Email info@aecci.org.in,\nhr@aecci.org.in"
                                "• Board lines : +91-22-412 711 45 | 46\n"
                                "• *(Consultation available with prior appointment)",
                            style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey.shade600),
                          ),
                          const SizedBox(height: 8),

                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12), // Added padding
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HrSupportWing()),
                            );
                          },
                          child: Text(
                            "More Info",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12), // Added padding
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ComingSoonScreen()),
                            );
                          },
                          child: Text(
                            "Submit our Query", // Removed extra space
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            maxLines: 1, // Force single line
                            overflow: TextOverflow.ellipsis, // Handle overflow gracefully
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  void showExportWingPopup4(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // Allows closing the dialog by tapping outside
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white, // Set background color to white
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          insetPadding: EdgeInsets.zero, // Removes default padding for fullscreen effect
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.90,
            height: MediaQuery.of(context).size.height * 0.70,
            // Full width
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView( // Wrap content in a scrollable view
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left side: Image
                        Row(
                          children: [
                            SizedBox(width: 60),
                            Image.asset(
                              'assets/images/agreement.png', // Replace with your image path
                              width: 24, // Adjust the width as needed
                              height: 24, // Adjust the height as needed
                              fit: BoxFit.cover, // Optionally adjust the fit
                            ),
                            const SizedBox(width: 8), // Adds some space between the image and text
                            Text(
                              "Business Wing",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.close, color: Colors.red),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "“Business Advice wing is specialized in understanding the needs and importance of delivering the strategic business advice for every business.”",
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.indigo),
                    ),
                    const SizedBox(height: 12),

                    Text(
                      "AECCI understands that getting the right information is vital to the success of any business; therefore we are here to provide the right information at the right time for your businesses. We probably have the answer for all your queries and otherwise we have the access to all the correct sources to acquire the same."
                          "\n\nBusiness Advice wing was established considering the need and importance of strategic business advice. The wing is headed by the Honourable Chairman of AECCI, Mr. Jaheer Bukhari. With his vast experience of 22 years in export-consultation, he is guiding the members through Individual counseling sessions.\nThe wing provides advisory services for all your business related issues that can help you to save significant amount on legal fees and the valuable time seeking advice from other sources.",
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 8),


                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12), // Added padding
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => BusinessAdviceWing()),
                              );
                            },
                            child: Text(
                              "More Info",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12), // Added padding
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ComingSoonScreen()),
                              );
                            },
                            child: Text(
                              "Submit our Query", // Removed extra space
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              maxLines: 1, // Force single line
                              overflow: TextOverflow.ellipsis, // Handle overflow gracefully
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
        );
      },
    );
  }

  void showExportWingPopup5(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // Allows closing the dialog by tapping outside
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white, // Set background color to white
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          insetPadding: EdgeInsets.zero, // Removes default padding for fullscreen effect
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.90,
            height: MediaQuery.of(context).size.height * 0.70,
            // Full width
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView( // Wrap content in a scrollable view
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left side: Image
                        Row(
                          children: [
                            SizedBox(width: 60),
                            Image.asset(
                              'assets/images/agreement.png', // Replace with your image path
                              width: 24, // Adjust the width as needed
                              height: 24, // Adjust the height as needed
                              fit: BoxFit.cover, // Optionally adjust the fit
                            ),
                            const SizedBox(width: 8), // Adds some space between the image and text
                            Text(
                              "Event Wing",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.close, color: Colors.red),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "“We creates great opportunities for businesses through mega events to gain valuable insights while making new business contacts and strengthening existing relationships.”",
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.indigo),
                    ),
                    const SizedBox(height: 12),

                    Text(
                      "The AECCI Events & Seminars Wing is committed to fostering business growth and professional development through a variety of specialized events and conferences.",
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Our team organizes insightful seminars, interactive workshops, and impactful networking events tailored to the needs of businesses and professionals. We aim to provide valuable opportunities for knowledge sharing, industry collaboration, and strategic growth, helping participants navigate the evolving landscape of their respective industries.",
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12), // Added padding
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LegalWing()),
                              );
                            },
                            child: Text(
                              "More Info",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12), // Added padding
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ComingSoonScreen()),
                              );
                            },
                            child: Text(
                              "Submit our Query", // Removed extra space
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              maxLines: 1, // Force single line
                              overflow: TextOverflow.ellipsis, // Handle overflow gracefully
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
        );
      },
    );
  }
}

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, -1),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: BottomAppBar(
              height: 70,
              notchMargin: 8,
              shape: const CircularNotchedRectangle(),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const IntroScreen()),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.home_outlined,
                          size: 28,
                          color: const Color(0xFF1B3149),
                        ),
                        const Text(
                          'Accounts',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF1B3149),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.sync,
                          size: 28,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(height: 18),
                      ],
                    ),
                  ),
                  const SizedBox(width: 60),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 3;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.help_outline,
                          size: 28,
                          color: Colors.grey[600],
                        ),
                        const Text(
                          'Cards',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  VirtualB2BForumScreen()),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.menu,
                          size: 28,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(height: 18),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}