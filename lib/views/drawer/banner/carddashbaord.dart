
// Widget _buildOptionCardMulti5(
//     BuildContext context, String header, String imagePath, {VoidCallback? onTap}) {
//   return Stack(
//     clipBehavior: Clip.none,
//     children: [
//       Container(
//         width: MediaQuery.of(context).size.width * 0.42,
//         height: 110,
//         margin: const EdgeInsets.symmetric(horizontal: 4.0),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(15),
//           border: Border.all(color: Colors.grey[100]!, width: 2),
//         ),
//         child: Center(
//           child: InkWell(
//             onTap: onTap,
//             borderRadius: BorderRadius.circular(15),
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Image.asset(
//                 imagePath,
//                 height: 70,
//                 width: 85,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//         ),
//       ),
//       Positioned(
//         top: -12,
//         left: 12,
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(5),
//           ),
//           child: Text(
//             header,
//             style: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
// }


// const SizedBox(height: 10),
// Padding(
//   padding: const EdgeInsets.symmetric(vertical: 8.0),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//       _buildOptionCardMulti5(context, "B2B Forum", "assets/images/b2b.jpg", onTap: () => print("Services Clicked!")),
//       _buildOptionCardMulti5(context, "Collaborator", "assets/images/coll.png", onTap: () => print("Wings Clicked!")),
//     ],
//   ),
// ),


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart'; // Import for mapEquals

import '../../Dashboard_Pages/multi_card/Profile/compnay_card.dart';
import '../../Dashboard_Pages/multi_card/Profile/marketing_card.dart';
import '../../Dashboard_Pages/multi_card/Profile/password_card.dart';
import '../../Dashboard_Pages/multi_card/Profile/personal_card.dart';
import '../../Dashboard_Pages/services_card/services.dart';
import '../../Dashboard_Pages/the_wings/wings_card.dart';
import '../../Registration/B2B_All_Forum/allCountry.dart';
import '../../Registration/B2B_All_Forum/meetings.dart';

class CardDashboard extends StatefulWidget {
  final Map<String, dynamic> loginData;
  final Map<String, dynamic> getData;
  final String token;

  const CardDashboard({
    Key? key,
    required this.loginData,
    required this.getData,
    required this.token,
  }) : super(key: key);

  @override
  _CardDashboardState createState() => _CardDashboardState();
}

class _CardDashboardState extends State<CardDashboard> {
  late Map<String, dynamic> _loginData;
  late Map<String, dynamic> _getData;
  late String _token;

  bool showBalance = false; // Add this line
  // Existing variables
  String? selectMembership;
  String? reqType;
  Map<String, dynamic>? approveUserData;

  @override
  void initState() {
    super.initState();
    _loginData = _deepCopy(widget.loginData);
    _getData = _deepCopy(widget.getData);
    _token = widget.token;
    // Initialize data from loginData and getData
    if (_loginData.containsKey('info')) {
      final info = _loginData['info'] as Map<String, dynamic>;
      selectMembership = info['selectMembership']?.toString() ?? 'N/A';
      reqType = info['reqType']?.toString() ?? 'N/A';
      approveUserData = info['approveUserData'] as Map<String, dynamic>?;
    }
  }


  @override
  void didUpdateWidget(CardDashboard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!mapEquals(widget.loginData, oldWidget.loginData)) {
      setState(() {
        _loginData = _deepCopy(widget.loginData);
      });
    }
  }

  Map<String, dynamic> _deepCopy(Map<String, dynamic> original) {
    return Map<String, dynamic>.from(original);
  }

  Widget _buildOptionCardMulti4(
      BuildContext context,
      IconData icon1, IconData icon2, IconData icon3, IconData icon4,
      String label1, String label2, String label3, String label4, String header,
      {VoidCallback? onPersonalTap, VoidCallback? onCompanyTap, VoidCallback? onMarketingTap, VoidCallback? onPasswordTap}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 130,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey[100]!, width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconLabel(icon1, label1, Colors.black, onTap: onPersonalTap),
                  _buildIconLabel(icon2, label2, Colors.blue, onTap: onCompanyTap),
                  _buildIconLabel(icon3, label3, Colors.green, onTap: onMarketingTap),
                  _buildIconLabel(icon4, label4, Colors.orange, onTap: onPasswordTap),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: -14,
          left: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              header,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOptionCardMulti3(
      BuildContext context,
      IconData icon1, IconData icon2, IconData icon3, IconData icon4,
      String label1, String label2, String label3, String label4, String header,
      {VoidCallback? onPersonalTap, VoidCallback? onCompanyTap, VoidCallback? onMarketingTap, VoidCallback? onPasswordTap}) {
    return _buildOptionCardMulti4(
      context,
      icon1, icon2, icon3, icon4, label1, label2, label3, label4, header,
      onPersonalTap: onPersonalTap,
      onCompanyTap: onCompanyTap,
      onMarketingTap: onMarketingTap,
      onPasswordTap: onPasswordTap,
    );
  }

  Widget _buildOptionCardMulti2(
      BuildContext context, String header, String imagePath, {VoidCallback? onTap}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.42,
          height: 110,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey[100]!, width: 2),
          ),
          child: Center(
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(15),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  imagePath,
                  height: 70,
                  width: 85,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: -12,
          left: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              header,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIconLabel(IconData icon, String label, Color color, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 34, color: color),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),

          // Profile Section
          if (approveUserData?['Profile'] == true)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOptionCardMulti3(
                    context,
                    Icons.person, Icons.apartment, Icons.campaign, Icons.lock,
                    'Personal\nDetails', 'Company\nDetails', 'Marketing\nInformation', 'Change\nPassword',
                    "Profile",
                    onPersonalTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PersonalCard(
                            loginData: _loginData,
                            token: {'token': _token}, // Wrap the token in a Map
                            getData: _getData, // Ensure getData is a Map<String, dynamic>
                          ),
                        ),
                      );
                    },
                    onCompanyTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CompnayCard(
                            loginData: _loginData,
                            token: {'token': _token}, // Wrap the token in a Map
                            getData: _getData, // Ensure getData is a Map<String, dynamic>
                          ),
                        ),
                      );
                    },
                    onMarketingTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MarketingCard(loginData: _loginData),
                        ),
                      );
                    },
                    onPasswordTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PasswordCard(loginData: _loginData),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

          // Services & Wings Section
          if ((approveUserData?['Services']?.values.any((value) => value == true) ?? false) ||
              (approveUserData?['The Wings']?.values.any((value) => value == true) ?? false))
            Column(
              children: [
                const SizedBox(height: 10), // Adds spacing if any of the conditions are met
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (approveUserData?['Services']?.values.any((value) => value == true) ?? false)
                        _buildOptionCardMulti2(
                          context,
                          "Services",
                          "assets/images/Service1.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ServicePages(
                                  loginData: _loginData,
                                  getData: _getData,
                                  token: _token,
                                ),
                              ),
                            );
                          },
                        ),
                      if (approveUserData?['The Wings']?.values.any((value) => value == true) ?? false)
                        _buildOptionCardMulti2(
                          context,
                          "Wings",
                          "assets/images/Wing.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WingsCardPages(
                                  loginData: _loginData,
                                  getData: _getData,
                                  token: _token,
                                ),
                              ),
                            );
                          },
                        ),
                      // Show "B2B Forum" only if "Wings" is not displayed
                      if (!(approveUserData?['The Wings']?.values.any((value) => value == true) ?? false))
                        _buildOptionCardMulti2(
                          context,
                          "B2B Forum",
                          "assets/images/b2b2.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Allcountry(
                                  loginData: _loginData,
                                  // getData: _getData,
                                  token: _token,
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),

          // Arbitration Center Section
          if (approveUserData?['Arbitration Center'] == true) ...[
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOptionCardMulti4(
                    context,
                    Icons.description, Icons.people, Icons.gavel, Icons.assignment,
                    'Rules & Forms\nFees', 'Panel List', 'Raise Your\nDispute', 'List Of\nAgreement',
                    "Arbitration Center",
                  ),
                ],
              ),
            ),
          ],

          // Events & Publications Section
          if (approveUserData?['Events'] == true || approveUserData?['Publications'] == true) ...[
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (approveUserData?['Events'] == true)
                    _buildOptionCardMulti2(
                      context,
                      "Events",
                      "assets/images/event.png",
                      // Uncomment and add navigation if needed
                      onTap: () {
                        Navigator.push(
                          context,
                          // MaterialPageRoute(builder: (context) => Meetings()), // Replace with your actual EventsPage
                          MaterialPageRoute(
                            builder: (context) => Meetings(
                              loginData: _loginData,
                              token: _token,
                            ),
                          ),
                        );
                      },
                    ),
                  if (approveUserData?['Publications'] == true)
                    _buildOptionCardMulti2(
                      context,
                      "Publications",
                      "assets/images/publications.png",
                      // Uncomment and add navigation if needed
                      // onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => PublicationsPage()), // Replace with your actual PublicationsPage
                      //   );
                      // },
                    ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}