// import 'package:flutter/material.dart';
// import 'package:aecci/views/drawer/company_details.dart';
// import 'package:aecci/views/drawer/market_information.dart';
// import 'package:aecci/views/drawer/change_password.dart';
// import 'package:aecci/views/drawer/personal_details.dart';
// import 'events/virtula_b2b_forum.dart';
// import 'package:aecci/views/drawer/services/wallet_Scree.dart';
// import 'package:aecci/views/drawer/services/add_amount.dart';
// import 'package:flutter/foundation.dart';  // For debugPrint
//
// class CustomDrawer extends StatefulWidget {
//   final BuildContext context;
//   final Map<String, dynamic> loginData;
//
//   CustomDrawer({
//     required this.context,
//     required this.loginData,
//   });
//
//   @override
//   _CustomDrawerState createState() => _CustomDrawerState();
// }
//
// class _CustomDrawerState extends State<CustomDrawer> {
//   bool get isProfileApproved {
//     return widget.loginData['info']?['approveUserData']?['Profile'] ?? true;
//   }
//
//   Map<String, bool> get servicesApproval {
//     final data = widget.loginData['info']?['approveUserData']?['Services'];
//     return data is Map<String, dynamic> ? Map<String, bool>.from(data) : {};
//   }
//
//   Map<String, bool> get wingsApproval {
//     final data = widget.loginData['info']?['approveUserData']?['The Wings'];
//     return data is Map<String, dynamic> ? Map<String, bool>.from(data) : {};
//   }
//
//   bool get isArbitrationApproved {
//     return widget.loginData['info']?['approveUserData']?['Arbitration Center'] ?? true;
//   }
//
//   bool get isEventsApproved {
//     return widget.loginData['info']?['approveUserData']?['Events'] ?? true;
//   }
//
//   bool get isPublicationsApproved {
//     return widget.loginData['info']?['approveUserData']?['Publications'] ?? true;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: Colors.white,
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           _buildDrawerHeader(),
//           if (isProfileApproved) _buildProfileSection(),
//           if (servicesApproval.isNotEmpty && servicesApproval.containsValue(true)) _buildServicesSection(),
//           if (wingsApproval.isNotEmpty && wingsApproval.containsValue(true)) _buildWingsSection(),
//           if (isArbitrationApproved) _buildArbitrationSection(),
//           if (isEventsApproved) _buildEventsSection(),
//           if (isPublicationsApproved) _buildPublicationsSection(),
//           _buildLogoutTile(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDrawerHeader() {
//     return DrawerHeader(
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 140,
//               height: 140,
//               decoration: BoxDecoration(
//                 shape: BoxShape.rectangle,
//                 image: DecorationImage(
//                   image: AssetImage('assets/images/AECCI Logo (1).png'),
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildProfileSection() {
//     return _buildExpansionTile(
//       title: 'Profile',
//       children: [
//         _buildListTile(
//           title: 'Personal Details',
//           onTap: () => Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => PersonalDetailsScreen(token: widget.loginData['token'])),
//
//           ),
//         ),
//         _buildListTile(
//           title: 'Company Details',
//           onTap: () => Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => CompanyDetailsScreen()),
//           ),
//         ),
//         _buildListTile(
//           title: 'Marketing Information',
//           onTap: () => Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => MarketingInformationScreen()),
//           ),
//         ),
//         _buildListTile(
//           title: 'Change Password',
//           onTap: () => Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildServicesSection() {
//     List<Widget> approvedServices = [];
//
//     if (servicesApproval['e-CO'] == true) {
//       approvedServices.add(_buildListTile(
//         title: 'e-CO',
//         onTap: () {},
//       ));
//     }
//
//     if (servicesApproval['Membership Services'] == true) {
//       approvedServices.add(_buildListTile(
//         title: 'Certificate of Membership',
//         onTap: () {},
//       ));
//     }
//
//     if (servicesApproval['Recommendation Letters'] == true) {
//       approvedServices.add(_buildListTile(
//         title: 'Recommendation Letters',
//         onTap: () {},
//       ));
//     }
//
//     if (servicesApproval['Collaboration Portal'] == true) {
//       approvedServices.addAll([
//         _buildListTile(
//           title: 'Certificate of Collaboration',
//           onTap: () => Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => AddAmountScreen()),
//           ),
//         ),
//         _buildListTile(
//           title: 'Collaboration Portal',
//           onTap: () => Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => AddAmountScreen()),
//           ),
//         ),
//       ]);
//     }
//
//     if (servicesApproval['Commercial Directory'] == true) {
//       approvedServices.add(_buildListTile(
//         title: 'Commercial Directory',
//         onTap: () {},
//       ));
//     }
//
//     if (servicesApproval['Wallet'] == true) {
//       approvedServices.add(_buildListTile(
//         title: 'Wallet',
//         onTap: () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => WalletScreen()),
//         ),
//       ));
//     }
//
//     return _buildExpansionTile(
//       title: 'Services',
//       children: approvedServices,
//     );
//   }
//
//   Widget _buildWingsSection() {
//     List<Widget> approvedWings = [];
//
//     wingsApproval.forEach((wing, isApproved) {
//       if (isApproved) {
//         approvedWings.add(_buildListTile(
//           title: wing,
//           onTap: () {},
//         ));
//       }
//     });
//
//     return _buildExpansionTile(
//       title: 'Wings',
//       children: approvedWings,
//     );
//   }
//
//   Widget _buildArbitrationSection() {
//     return _buildExpansionTile(
//       title: 'Arbitration Center',
//       children: [
//         _buildListTile(
//           title: 'Rules, Forms & Fees',
//           onTap: () {},
//         ),
//         _buildListTile(
//           title: 'Panel List',
//           onTap: () {},
//         ),
//         _buildListTile(
//           title: 'Raise your Dispute',
//           onTap: () {},
//         ),
//         _buildListTile(
//           title: 'List Of Agreement',
//           onTap: () {},
//         ),
//       ],
//     );
//   }
//
//   Widget _buildEventsSection() {
//     return _buildExpansionTile(
//       title: 'Events',
//       children: [
//         _buildListTile(
//           title: 'Chamber Event Bookings',
//           onTap: () {},
//         ),
//         _buildListTile(
//           title: 'Virtual B2B Forum',
//           onTap: () => Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => VirtualB2BForumScreen()),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildPublicationsSection() {
//     return _buildExpansionTile(
//       title: 'Publications',
//       children: [
//         _buildListTile(
//           title: 'Digital Library',
//           onTap: () {},
//         ),
//       ],
//     );
//   }
//
//   Widget _buildLogoutTile() {
//     return ListTile(
//       dense: true,
//       visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//       title: Text('Logout', style: TextStyle(color: Colors.black, fontSize: 15)),
//       onTap: () {
//         // Add your logout logic here
//       },
//     );
//   }
//
//   Widget _buildExpansionTile({
//     required String title,
//     required List<Widget> children,
//   }) {
//     return ExpansionTile(
//       title: Text(title, style: TextStyle(color: Colors.black, fontSize: 18)),
//       children: children,
//     );
//   }
//
//   Widget _buildListTile({
//     required String title,
//     required VoidCallback onTap,
//   }) {
//     return ListTile(
//       dense: true,
//       visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//       title: Text(title, style: TextStyle(color: Colors.black, fontSize: 15)),
//       onTap: onTap,
//     );
//   }
// }

import 'package:aecci/views/drawer/services/Recommendation/application_letter.dart';
import 'package:aecci/views/drawer/services/collaboration.dart';
import 'package:aecci/views/drawer/services/commercial_directory.dart';
import 'package:flutter/material.dart';
import 'package:aecci/views/drawer/company_details.dart';
import 'package:aecci/views/drawer/market_information.dart';
import 'package:aecci/views/drawer/change_password.dart';
import 'package:aecci/views/drawer/personal_details.dart';
import 'events/virtula_b2b_forum.dart';
import 'package:aecci/views/drawer/services/wallet_Scree.dart';
import 'package:aecci/views/drawer/services/add_amount.dart';
import 'package:flutter/foundation.dart';

class CustomDrawer extends StatefulWidget {
  final BuildContext context;
  final Map<String, dynamic> loginData;


  CustomDrawer({
    required this.context,
    required this.loginData,
    Key? key,
  }) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late Map<String, dynamic> _loginData;
  late String _token;

  @override
  void initState() {
    super.initState();
    _loginData = _deepCopy(widget.loginData);
    _token = _loginData['token'] ?? ''; // Add this line
  }

  @override
  void didUpdateWidget(CustomDrawer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!mapEquals(widget.loginData, oldWidget.loginData)) {
      setState(() {
        _loginData = _deepCopy(widget.loginData);
      });
    }
  }

  Map<String, dynamic> _deepCopy(Map<String, dynamic> original) {
    Map<String, dynamic> copy = {};
    original.forEach((key, value) {
      if (value is Map) {
        copy[key] = _deepCopy(Map<String, dynamic>.from(value));
      } else if (value is List) {
        copy[key] = List.from(value);
      } else {
        copy[key] = value;
      }
    });
    return copy;
  }

  void _navigateToScreen(Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          drawer: CustomDrawer(
            context: context,
            loginData: _loginData,
          ),
          body: screen,
        ),
      ),
    );
  }

  bool get isProfileApproved {
    return _loginData['info']?['approveUserData']?['Profile'] ?? true;
  }

  Map<String, bool> get servicesApproval {
    final data = _loginData['info']?['approveUserData']?['Services'];
    return data is Map<String, dynamic> ? Map<String, bool>.from(data) : {};
  }

  Map<String, bool> get wingsApproval {
    final data = _loginData['info']?['approveUserData']?['The Wings'];
    return data is Map<String, dynamic> ? Map<String, bool>.from(data) : {};
  }

  bool get isArbitrationApproved {
    return _loginData['info']?['approveUserData']?['Arbitration Center'] ?? true;
  }

  bool get isEventsApproved {
    return _loginData['info']?['approveUserData']?['Events'] ?? true;
  }

  bool get isPublicationsApproved {
    return _loginData['info']?['approveUserData']?['Publications'] ?? true;
  }


  @override
  Widget build(BuildContext context) {
    final hasServices = servicesApproval.isNotEmpty && servicesApproval.containsValue(true);
    final hasWings = wingsApproval.isNotEmpty && wingsApproval.containsValue(true);

    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _buildDrawerHeader(),
          if (isProfileApproved) _buildProfileSection(),
          if (hasServices) _buildServicesSection(),
          if (hasWings) _buildWingsSection(),
          if (isArbitrationApproved) _buildArbitrationSection(),
          if (isEventsApproved) _buildEventsSection(),
          if (isPublicationsApproved) _buildPublicationsSection(),
          _buildLogoutTile(),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return DrawerHeader(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 240,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return _buildExpansionTile(
      title: 'Profile',
      children: [

        _buildListTile(
          title: 'Personal Details',
          onTap: () => _navigateToScreen(PersonalDetailsScreen(
            loginData: _loginData,
            token: _token, // Add this line
            getData: null, // Optional: Add if needed
          )),
        ),
        _buildListTile(
          title: 'Company Details',
          onTap: () => _navigateToScreen(CompanyDetailsScreen(
            loginData: _loginData,
          )),
        ),

        _buildListTile(
          title: 'Marketing Information',
          onTap: () => _navigateToScreen(MarketingInformationScreen(loginData: _loginData)),
        ),
        _buildListTile(
          title: 'Change Password',
          onTap: () => _navigateToScreen(ChangePasswordScreen(loginData: _loginData)),
        ),
      ],
    );
  }

  Widget _buildServicesSection() {
    List<Widget> approvedServices = [];

    if (servicesApproval['e-CO'] == true) {
      approvedServices.add(_buildListTile(
        title: 'e-CO',
        onTap: () => _navigateToScreen(Container()),
      ));
    }

    if (servicesApproval['Membership Services'] == true) {
      approvedServices.add(_buildListTile(
        title: 'Certificate of Membership',
        onTap: () => _navigateToScreen(Container()),
      ));
    }

    if (servicesApproval['Recommendation Letters'] == true) {
      approvedServices.add(_buildListTile(
        title: 'Recommendation Letters',
        onTap: () => _navigateToScreen(ApplicationLetterForm(
          loginData: _loginData,
          token: _token, // Add this line
        )),
      ));
    }

    if (servicesApproval['Collaboration Portal'] == true) {
      approvedServices.addAll([
        _buildListTile(
          title: 'Certificate of Collaboration',
          onTap: () => _navigateToScreen(AddAmountScreen()),
        ),
        _buildListTile(
          title: 'Collaboration Portal',
          onTap: () => _navigateToScreen(CollaborationPortal()),
        ),
      ]);
    }

    if (servicesApproval['Commercial Directory'] == true) {
      approvedServices.add(_buildListTile(
        title: 'Commercial Directory',
        onTap: () => _navigateToScreen(CommercialDirectoryScreen(
          loginData: _loginData,
          // token: _token, // Add this line
          // getData: null, // Optional: Add if needed
        )),
      ));
    }

    // if (servicesApproval['Wallet'] == true) {
    //   approvedServices.add(_buildListTile(
    //     title: 'Wallet',
    //     onTap: () => _navigateToScreen(WalletScreen(
    //       loginData: _loginData,
    //       getData: _getData,  // Ensure this variable is correctly defined
    //       token: _token,      // Ensure this variable is correctly defined
    //     )),
    //
    //   ));
    // }

    return _buildExpansionTile(
      title: 'Services',
      maintainState: true,
      children: approvedServices,
    );
  }

  Widget _buildWingsSection() {
    List<Widget> approvedWings = [];

    wingsApproval.forEach((wing, isApproved) {
      if (isApproved) {
        approvedWings.add(_buildListTile(
          title: wing,
          onTap: () => _navigateToScreen(Container()),
        ));
      }
    });

    return _buildExpansionTile(
      title: 'Wings',
      maintainState: true,
      children: approvedWings,
    );
  }

  Widget _buildArbitrationSection() {
    return _buildExpansionTile(
      title: 'Arbitration Center',
      children: [
        _buildListTile(
          title: 'Rules, Forms & Fees',
          onTap: () => _navigateToScreen(Container()),
        ),
        _buildListTile(
          title: 'Panel List',
          onTap: () => _navigateToScreen(Container()),
        ),
        _buildListTile(
          title: 'Raise your Dispute',
          onTap: () => _navigateToScreen(Container()),
        ),
        _buildListTile(
          title: 'List Of Agreement',
          onTap: () => _navigateToScreen(Container()),
        ),
      ],
    );
  }

  Widget _buildEventsSection() {
    return _buildExpansionTile(
      title: 'Events',
      children: [
        _buildListTile(
          title: 'Chamber Event Bookings',
          onTap: () => _navigateToScreen(Container()),
        ),
        _buildListTile(
          title: 'Virtual B2B Forum',
          onTap: () => _navigateToScreen(VirtualB2BForumScreen()),
        ),
      ],
    );
  }

  Widget _buildPublicationsSection() {
    return _buildExpansionTile(
      title: 'Publications',
      children: [
        _buildListTile(
          title: 'Digital Library',
          onTap: () => _navigateToScreen(Container()),
        ),
      ],
    );
  }

  Widget _buildLogoutTile() {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      title: Text('Logout', style: TextStyle(color: Colors.black, fontSize: 15)),
      onTap: () {
        // Add your logout logic here
      },
    );
  }

  Widget _buildExpansionTile({
    required String title,
    required List<Widget> children,
    bool maintainState = true,
  }) {
    return ExpansionTile(
      title: Text(title, style: TextStyle(color: Colors.black, fontSize: 18)),
      children: children,
      maintainState: maintainState,
    );
  }

  Widget _buildListTile({
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      title: Text(title, style: TextStyle(color: Colors.black, fontSize: 15)),
      onTap: onTap,
    );
  }
}