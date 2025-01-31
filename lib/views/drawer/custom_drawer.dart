import 'package:flutter/material.dart';
import 'package:aecci/views/drawer/company_details.dart';
import 'package:aecci/views/drawer/market_information.dart';
import 'package:aecci/views/drawer/change_password.dart';
import 'package:aecci/views/drawer/personal_details.dart';
import 'events/virtula_b2b_forum.dart';


class CustomDrawer extends StatelessWidget {
  final BuildContext context;

  CustomDrawer({required this.context});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 140,  // Double the radius to get diameter
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/AECCI Logo (1).png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          // Profile section
          _buildExpansionTile(
            context: context,
            title: 'Profile',
            children: [
              _buildListTile(
                title: 'Personal Details',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalDetailsScreen()),
                  );
                },
              ),
              _buildListTile(
                title: 'Company Details',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CompanyDetailsScreen()),
                  );
                },
              ),
              _buildListTile(
                title: 'Marketing Information',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MarketingInformationScreen()),
                  );
                },
              ),
              _buildListTile(
                title: 'Change Password',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
                  );
                  // Navigate to Change Password screen
                },
              ),
            ],
          ),

          // Services section
          _buildExpansionTile(
            context: context,
            title: 'Services',
            children: [
              _buildListTile(
                title: 'Certificate of Collaboration',
                onTap: () {
                  // Navigate to Certificate of Collaboration screen
                },
              ),
              _buildListTile(
                title: 'Collaboration Portal',
                onTap: () {
                  // Navigate to Certificate of Collaboration screen
                },
              ),
            ],
          ),

          // Arbitration Center section
          _buildExpansionTile(
            context: context,
            title: 'Arbitration Center',
            children: [
              _buildListTile(
                title: 'Rules, Forms & Fees',
                 onTap: () {
                // Navigate to Certificate of Collaboration screen
              },
    ),
              _buildListTile(
                title: 'Panel List',
    onTap: () {
    // Navigate to Certificate of Collaboration screen
    },
              ),
              _buildListTile(
                title: 'Raise your Dispute',
    onTap: () {
    // Navigate to Certificate of Collaboration screen
    },
              ),
              _buildListTile(
                title: 'List Of Agreement',
                onTap: () {
                  // Navigate to Certificate of Collaboration screen
                },
              ),
            ],
          ),

          // Events section
          _buildExpansionTile(
            context: context,
            title: 'Events',
            children: [
              _buildListTile(
                title: 'Chamber Event Bookings',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => VirtualB2BForumScreen()),
                  );
                },
              ),
              _buildListTile(
                title: 'Virtual B2B Forum',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => VirtualB2BForumScreen()),
                  );
                },
              ),
            ],
          ),

          // Publications section
          _buildExpansionTile(
            context: context,
            title: 'Publications',
            children: [
              _buildListTile(
                title: 'Digital Library',
                onTap: () {
                  // Navigate to Certificate of Collaboration screen
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to build an ExpansionTile widget
  Widget _buildExpansionTile({
    required BuildContext context,
    required String title,
    required List<Widget> children,
  }) {
    return ExpansionTile(
      title: Text(title, style: TextStyle(color: Colors.black, fontSize: 18)),
      children: children,
    );
  }

  // Helper method to build a ListTile widget
  Widget _buildListTile({required String title, required VoidCallback onTap}) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      title: Text(title, style: TextStyle(color: Colors.black, fontSize: 15)),
      onTap: onTap,
    );
  }
}
