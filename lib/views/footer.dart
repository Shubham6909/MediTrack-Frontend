import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aecci/views/about app/about_chamber_screen.dart';
import 'package:aecci/views/about app/history.dart';
import 'package:aecci/views/about app/message.dart';
import 'package:aecci/views/about app/chamber_policy.dart';
import 'package:aecci/views/about app/export_wing.dart';
import 'package:aecci/views/about app/legal_wing.dart';
import 'package:aecci/views/about app/hr_support_wing.dart';
import 'package:aecci/views/about app/professional_wing.dart';
import 'package:aecci/views/about app/business_advice_wing.dart';
import 'package:aecci/views/about app/women.dart';
import 'package:aecci/views/about app/seminar.dart';
import 'package:aecci/views/about app/patron_membership.dart';
import 'package:aecci/views/about app/benefits.dart';
import 'package:aecci/views/about app/offers.dart';
import 'package:aecci/views/about app/visa_recommendation.dart';
import 'package:aecci/views/about app/sample.dart';
import 'package:aecci/views/about app/schedule_fees.dart';
import 'package:aecci/views/about app/rules.dart';
import 'package:aecci/views/about app/model_clause.dart';
import 'package:aecci/views/about app/faqs.dart';
import 'package:aecci/views/about app/upcoming_events.dart';
import 'package:aecci/views/about app/sponsorship.dart';
import 'package:aecci/views/about app/advertise.dart';
import 'package:aecci/views/about app/information.dart';
import 'package:aecci/views/about app/eplatform.dart';
import 'package:aecci/views/about app/request.dart';
import 'package:aecci/views/login_view.dart';
import 'package:aecci/views/about app/head_office.dart';
import 'package:aecci/views/about app/international.dart';
import 'package:aecci/views/about app/international_collaboration.dart';
import 'package:aecci/views/IntroScreen.dart';
import 'package:aecci/views/drawer/events/virtula_b2b_forum.dart';
import 'package:aecci/views/about app/document.dart';


class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool _isAboutUsExpanded = false;
  bool _isOurWingsExpanded = false;
  bool _isMembershipExpanded = false;
  bool _isArbitrationExpanded = false;
  bool _isEventsExpanded = false;
  bool _isPlatformExpanded = false;
  bool _isContactExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   // SizedBox(height: 70),
                    // Text(
                    //   'More',
                    //   style: GoogleFonts.poppins(
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.w600,
                    //     color: Colors.black,
                    //   ),
                    // ),
                  ],
                ),
              ),
              // _buildSection(
              //   'About App',
              //   [
              //     _buildMenuItem(Icons.campaign_outlined, "What's new", () {}),
              //     _buildMenuItem(Icons.directions_walk, "WalkThrough", () {}),
              //     _buildMenuItem(Icons.info_outline, "Version Information", () {}),
              //   ],
              //   'assets/images/AECCI Logo (1).png',
              // ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start, // Aligns everything to the left
                  children: [
                    //Icon wrapped in InkWell to handle the tap
                     InkWell(
                      onTap: () {

                       Navigator.push(context, MaterialPageRoute(builder: (context) => IntroScreen()),
                       );
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 20, // Adjust the size as necessary
                      ),
                    ),
                    const SizedBox(width: 18), // Adds space between the icon and the text
                    // Text widget for "About AECCI Chamber"
                    Text(
                      'About AECCI Chamber',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                margin: const EdgeInsets.all(16),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _buildMenuItem(
                        Icons.business_outlined,
                        'About Us',
                            () {
                          setState(() {
                            _isAboutUsExpanded = !_isAboutUsExpanded;
                          });
                        },
                        isExpanded: _isAboutUsExpanded
                    ),
                    if (_isAboutUsExpanded) ...[
                      _buildSubMenuItem(Icons.business, 'About Chamber'),
                      _buildSubMenuItem(Icons.history, 'About History'),
                      _buildSubMenuItem(Icons.message, 'Chairman Message'),
                      _buildSubMenuItem(Icons.policy, 'Chamber Policy'),
                    ],
                    _buildMenuItem(
                        Icons.campaign_outlined,
                        "Our Wings",
                            () {
                          setState(() {
                            _isOurWingsExpanded = !_isOurWingsExpanded;
                          });
                        },
                        isExpanded: _isOurWingsExpanded
                    ),
                    // Show sub-menu items if Our Wings section is expanded
                    if (_isOurWingsExpanded) ...[
                      _buildSubMenuItem(Icons.airline_seat_individual_suite, 'Export Wing'),
                      _buildSubMenuItem(Icons.gavel, 'Legal Wing'),
                      _buildSubMenuItem(Icons.person, 'HR Support Wing'),
                      _buildSubMenuItem(Icons.work_outline, 'Professional Wing'),
                      _buildSubMenuItem(Icons.business_center, 'Business Advice Wing'),
                      _buildSubMenuItem(Icons.woman, 'Women Wing'),
                      _buildSubMenuItem(Icons.event, 'Event and Seminar Wing'),
                    ],
                    _buildMenuItem(
                        Icons.campaign_outlined,
                        "Membership",
                            () {
                          setState(() {
                            _isMembershipExpanded = !_isMembershipExpanded;
                          });
                        },
                        isExpanded: _isMembershipExpanded
                    ),
                    if (_isMembershipExpanded) ...[
                      _buildSubMenuItem(Icons.airline_seat_individual_suite, 'Patron Membership'),
                      _buildSubMenuItem(Icons.gavel, 'Membership & its benefits'),
                      _buildSubMenuItem(Icons.person, 'Fee Forms & Guidelines'),
                      _buildSubMenuItem(Icons.work_outline, 'Enrollment Offers'),
                      _buildSubMenuItem(Icons.business_center, 'Visa Recommendation'),
                    ],
                    _buildMenuItem(
                        Icons.campaign_outlined,
                        "Arbitration Center",
                            () {
                          setState(() {
                            _isArbitrationExpanded = !_isArbitrationExpanded;
                          });
                        },
                        isExpanded: _isArbitrationExpanded
                    ),
                    if (_isArbitrationExpanded) ...[
                      _buildSubMenuItem(Icons.airline_seat_individual_suite, 'Why AECCI-IAC?'),
                      _buildSubMenuItem(Icons.gavel, 'Schedule Fees'),
                      _buildSubMenuItem(Icons.person, 'Rules and Policies'),
                      _buildSubMenuItem(Icons.work_outline, 'AECCI-IAC MODEL CLAUSE'),
                      _buildSubMenuItem(Icons.business_center, 'Panel of Arbitrators'),
                    ],
                    _buildMenuItem(
                        Icons.campaign_outlined,
                        "Events",
                            () {
                          setState(() {
                            _isEventsExpanded = !_isEventsExpanded;
                          });
                        },
                        isExpanded: _isEventsExpanded
                    ),
                    if (_isEventsExpanded) ...[
                      _buildSubMenuItem(Icons.airline_seat_individual_suite, 'Upcoming Events'),
                      _buildSubMenuItem(Icons.gavel, 'Past Events'),
                      _buildSubMenuItem(Icons.person, 'Sponsorship'),
                      _buildSubMenuItem(Icons.work_outline, 'Advertise With Us'),
                      _buildSubMenuItem(Icons.business_center, 'International Collaboration'),
                      _buildSubMenuItem(Icons.business_center, 'World Conference Information'),
                    ],
                    _buildMenuItem(
                        Icons.campaign_outlined,
                        "E-Platform",
                            () {
                          setState(() {
                            _isPlatformExpanded = !_isPlatformExpanded;
                          });
                        },
                        isExpanded: _isPlatformExpanded
                    ),
                    if (_isPlatformExpanded) ...[
                      _buildSubMenuItem(Icons.airline_seat_individual_suite, 'e-Platform  Information'),
                      _buildSubMenuItem(Icons.gavel, 'Members Login'),
                      _buildSubMenuItem(Icons.verified_sharp, 'Documents Verification'),
                      // _buildSubMenuItem(Icons.work_outline, 'Formalities & Guidelines'),
                      // _buildSubMenuItem(Icons.business_center, 'Document Verification'),
                    ],
                  ],
                ),
              ),
              SizedBox(height: 5),
              _buildSection(
                'Reach out to us',
                [
                  _buildMenuItem(
                      Icons.campaign_outlined,
                      "Contact Us",
                          () {
                        setState(() {
                          _isContactExpanded = !_isContactExpanded;
                        });
                      },
                      isExpanded: _isContactExpanded
                  ),
                  if (_isContactExpanded) ...[
                    _buildSubMenuItem(Icons.airline_seat_individual_suite, 'AECCI Head Office'),
                    _buildSubMenuItem(Icons.gavel, 'AECCI International Hub'),
                  ],
                ],
                'assets/images/s1.jpeg',
              ),
            ],
          ),
        ),
      ),
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
      //       icon: SizedBox.shrink(),
      //       label: 'Menu',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.article_outlined,
      //         color: Colors.grey[600],
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
      //     if (index == 0) {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => IntroScreen()),
      //       );
      //     } else if (index == 1) {
      //       Navigator.push(context, MaterialPageRoute(builder: (context) => MenuScreen()),
      //       );
      //     }
      //     else if (index == 2) {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => VirtualB2BForumScreen()),
      //       );
      //     }
      //   },
      // ),
      //
      // floatingActionButton: Container(
      //   width: 40,
      //   height: 40,
      //   margin: const EdgeInsets.only(bottom: 1),
      //   decoration: const BoxDecoration(
      //     color: Color(0xFF1B3149),
      //     shape: BoxShape.circle,
      //   ),
      //   child: const Icon(
      //     Icons.add,
      //     color: Colors.white,
      //     size: 30,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }


  Widget _buildMenuItem1(IconData icon, String title, VoidCallback onTap, {bool isExpanded = false}) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Icon(
              icon,
              color: Colors.green.shade600,
            ),
          ),
          title: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Icon(
            // Change icon based on expansion state
              isExpanded ? Icons.keyboard_arrow_down : Icons.chevron_right,
              color: Colors.grey[900]
          ),
          onTap: onTap,
        ),
        const Divider(height: 1),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap, {bool isExpanded = false}) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Icon(
              icon,
              color: Colors.green.shade600,
            ),
          ),
          title: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Icon(
            // Change icon based on expansion state
              isExpanded ? Icons.keyboard_arrow_down : Icons.chevron_right,
              color: Colors.grey[900]
          ),
          onTap: onTap,
        ),
        const Divider(height: 1),
      ],
    );
  }

  Widget _buildSubMenuItem(IconData icon, String title) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.green.shade600),
          title: Text(
            title,
            style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          onTap: () {
            if (title == 'About Chamber') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  AboutChamberScreen(),
                ),
              );
            } else if (title == 'About History') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  OurHistoryScreen(),
                ),
              );
            } else if (title == 'Chairman Message') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MessageScreen()),
              );
            } else if (title == 'Chamber Policy') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChamberPolicy()),
              );
            } else if (title == 'Export Wing') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ExportWing()),
              );
            } else if (title == 'Legal Wing') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LegalWing()),
              );
            } else if (title == 'HR Support Wing') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HrSupportWing()),
              );
            } else if (title == 'Professional Wing') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfessionalWing()),
              );
            } else if (title == 'Business Advice Wing') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BusinessAdviceWing()),
              );
            } else if (title == 'Women Wing') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Women()),
              );
            } else if (title == 'Event and Seminar Wing') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Seminar()),
              );
            } else if (title == 'Patron Membership') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PatronMembership()),
              );
            } else if (title == 'Membership & its benefits') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Benefits()),
              );
            } else if (title == 'Enrollment Offers') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Offers()),
              );
            } else if (title == 'Visa Recommendation') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            } else if (title == 'Why AECCI-IAC?') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Sample()),
              );
            } else if (title == 'Schedule Fees') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ScheduleFees()),
              );
            } else if (title == 'Rules and Policies') {
              Navigator.push(context,MaterialPageRoute(builder: (context) => Rules()),
              );
            } else if (title == 'AECCI-IAC MODEL CLAUSE') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ModelClause()),
              );
            } else if (title == 'Panel of Arbitrators') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => faqs()),
              );
            } else if (title == 'Upcoming Events') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UpcomingEvents()),
              );
            } else if (title == 'Sponsorship') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Sponsorship()),
              );
            } else if (title == 'Advertise With Us') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Advertise()),
              );
            }  else if (title =='International Collaboration') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => InternationalCollaboration()),
              );
            }
            else if (title =='World Conference Information') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Information()),
              );
            } else if (title =='e-Platform  Information') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Eplatform()),
              );
            } else if (title =='Members Login') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            } else if (title =='Documents Verification') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Document()),
              );
            } else if (title =='AECCI Head Office') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HeadOffice()),
              );
            } else if (title =='AECCI International Hub') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => International()),
              );
            }
          },
        ),
        const Divider(height: 1),
      ],
    );
  }

  Widget _buildSection(String title, List<Widget> items, String? imagePath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              if (imagePath != null)
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade200,
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              const SizedBox(width: 14),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Card(
          color: Colors.white,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            children: List.generate(items.length * 2 - 1, (index) {
              if (index.isOdd) {
                return const Divider(height: 1);
              }
              return items[index ~/ 2];
            }),
          ),
        ),
      ],
    );
  }
}

