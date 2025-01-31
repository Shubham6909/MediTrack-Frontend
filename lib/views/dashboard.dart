// import 'package:flutter/material.dart';
// import 'package:aecci/component/eplatform.dart';
// import 'package:flutter_svg/svg.dart'; // Import your component
//
// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});
//
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(
//         backgroundColor: const Color(0xFF20533A), // Set the background color for the drawer
//         child: ListView(
//           padding: EdgeInsets.zero,
//
//           children: <Widget>[
//             SizedBox(height: 50),
//
//
//             // Profile section
//             ExpansionTile(
//               title: const Text(
//                 'Profile',
//                 style: TextStyle(color: Colors.white, fontSize: 18),
//               ),
//               children: [
//                 ListTile(
//                   title: const Text(
//                     'Personal Details',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onTap: () {
//                     // Navigate to Personal Details screen
//                   },
//                 ),
//                 ListTile(
//                   title: const Text(
//                     'Company Details',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onTap: () {
//                     // Navigate to Company Details screen
//                   },
//                 ),
//                 ListTile(
//                   title: const Text(
//                     'Marketing Information',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onTap: () {
//                     // Navigate to Marketing Information screen
//                   },
//                 ),
//                 ListTile(
//                   title: const Text(
//                     'Change Password',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onTap: () {
//                     // Navigate to Change Password screen
//                   },
//                 ),
//               ],
//             ),
//             const Divider(color: Colors.white), // Divider between sections
//
//             // Services section
//             ExpansionTile(
//               title: const Text(
//                 'Services',
//                 style: TextStyle(color: Colors.white, fontSize: 18),
//               ),
//               children: [
//                 ListTile(
//                   title: const Text(
//                     'Certificate of Collaboration',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onTap: () {
//                     // Navigate to Certificate of Collaboration screen
//                   },
//                 ),
//                 ListTile(
//                   title: const Text(
//                     'Collaboration Portal',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onTap: () {
//                     // Navigate to Collaboration Portal screen
//                   },
//                 ),
//               ],
//             ),
//             const Divider(color: Colors.white), // Divider between sections
//
//             // Arbitration Center section
//             ExpansionTile(
//               title: const Text(
//                 'Arbitration Center',
//                 style: TextStyle(color: Colors.white, fontSize: 18),
//               ),
//               children: [
//                 ListTile(
//                   title: const Text(
//                     'Rules, Forms & Fees',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onTap: () {
//                     // Navigate to Rules, Forms & Fees screen
//                   },
//                 ),
//                 ListTile(
//                   title: const Text(
//                     'Panel List',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onTap: () {
//                     // Navigate to Panel List screen
//                   },
//                 ),
//                 ListTile(
//                   title: const Text(
//                     'Raise your Dispute',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onTap: () {
//                     // Navigate to Raise your Dispute screen
//                   },
//                 ),
//                 ListTile(
//                   title: const Text(
//                     'List Of Agreement',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onTap: () {
//                     // Navigate to List of Agreement screen
//                   },
//                 ),
//               ],
//             ),
//             const Divider(color: Colors.white), // Divider between sections
//
//             // Events section
//             ExpansionTile(
//               title: const Text(
//                 'Events',
//                 style: TextStyle(color: Colors.white, fontSize: 18),
//               ),
//               children: [
//                 ListTile(
//                   title: const Text(
//                     'Chamber Event Bookings',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onTap: () {
//                     // Navigate to Chamber Event Bookings screen
//                   },
//                 ),
//                 ListTile(
//                   title: const Text(
//                     'Virtual B2B Forum',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onTap: () {
//                     // Navigate to Virtual B2B Forum screen
//                   },
//                 ),
//               ],
//             ),
//             const Divider(color: Colors.white), // Divider between sections
//
//             // Publications section
//             ExpansionTile(
//               title: const Text(
//                 'Publications',
//                 style: TextStyle(color: Colors.white, fontSize: 18),
//               ),
//               children: [
//                 ListTile(
//                   title: const Text(
//                     'Digital Library',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onTap: () {
//                     // Navigate to Digital Library screen
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       appBar: AppBar(
//         title: const Text(
//           'AECCI',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
//         ),
//         backgroundColor: const Color(0xFF20533A),
//         centerTitle: true,
//         // Leading now opens the drawer
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               icon: const Icon(
//                 Icons.menu, // Hamburger menu icon
//                 color: Colors.white,
//                 size: 30,
//               ),
//               onPressed: () {
//                 Scaffold.of(context).openDrawer(); // Open the drawer
//               },
//             );
//           },
//         ),
//       ),
//       // Add the Drawer widget here
//
//       body: Padding(
//         padding: const EdgeInsets.only(left: 0.0, right: 0.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Use the updated EPlatformSection1
//               EPlatformSection1(
//                 title: '',
//                 description: 'Welcome to the AECCI \ne-platform!' '\nStep into a realm of innovation shaped by the visionary ideas of our Hon’ble Chairman.',
//               ),
//               const SizedBox(height: 20),
//
//               // **Dashboard Title Section**
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start, // Align to the start (left)
//                   children: [
//                     // Dashboard Title
//                     const Text(
//                       'D A S H B O A R D',
//                       style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(width: 16),
//                     // Wallet Icon (using an icon instead of text)
//                     const Icon(
//                       Icons.account_balance_wallet,  // Wallet icon
//                       size: 30,
//                       color: Colors.green, // You can change the color if needed
//                     ),
//
//                     // ₹0 Text
//                     const Text(
//                       '₹0',
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
//                     ),
//
//                     // Login Icon (closely packed)
//                     IconButton(
//                       icon: const Icon(
//                         Icons.login_outlined,  // Login icon
//                         size: 30,
//                         color: Colors.red, // You can change the color as needed
//                       ),
//                       onPressed: () {
//                         // Action for login icon button (e.g., log out)
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//
//               // **AECCI TEST COLLABORATION Section**
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start, // Align the text to the left
//                   children: [
//                     // Row to display AECCI TEST COLLABORATION and Collaboration No. on the same line
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start, // Align to the left
//                       children: [
//                         // AECCI TEST COLLABORATION Text
//                         const Text(
//                           'AECCI TEST COLLABORATION',
//                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
//                         ),
//                         const SizedBox(width: 10), // Small space between the texts
//
//                         // Collaboration No. :- Text
//                       ],
//                     ),
//                     const SizedBox(height: 5), // Small space between the rows
//
//                     // AECCI/COLL/24-25/000 displayed below the second text
//                     const Text(
//                       'Collaboration No. :-',
//                       style: TextStyle(fontSize: 18, color: Colors.grey),
//                     ),
//                     const Text(
//                       'AECCI/COLL/24-25/000',
//                       style: TextStyle(fontSize: 18, color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 15),
//
//               // **WELCOME Section**
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start, // Align items to the left
//                   children: [
//                     // WELCOME Text
//                     const Text(
//                       'WELCOME,',
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(width: 30), // Optional: small space between texts (you can adjust this as needed)
//
//                     // Valid Upto Text with grey color for the date part
//                     const Text(
//                       'Valid Upto–',
//                       style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//                     ),
//                     const Text(
//                       '2026-03-31',
//                       style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: const Text(
//                   'testcollaboration@aecci.org.in',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
//                 ),
//               ),
//               // Add spacing if needed
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:aecci/component/eplatform.dart';
// import 'package:aecci/views/drawer/personal_details.dart';
// import 'package:flutter_svg/svg.dart'; // Import your component
//
// import 'package:aecci/views/drawer/company_details.dart';
// import 'package:aecci/views/drawer/market_information.dart';
// import 'package:aecci/views/drawer/change_password.dart';
// import 'package:aecci/views/drawer/custom_drawer.dart';
//
// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});
//
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: CustomDrawer(context: context),
//     //   Drawer(
//     //     backgroundColor: Colors.white,
//     //     child: ListView(
//     //       padding: EdgeInsets.zero,
//     //       children: <Widget>[
//     //         DrawerHeader(
//     //           child: SingleChildScrollView(
//     //             child: Column(
//     //               mainAxisSize: MainAxisSize.min,
//     //               mainAxisAlignment: MainAxisAlignment.center,
//     //               children: [
//     //                 Container(
//     //                   width: 140,  // Double the radius to get diameter
//     //                   height: 140,
//     //                   decoration: BoxDecoration(
//     //                     shape: BoxShape.rectangle,
//     //                     image: DecorationImage(
//     //                       image: AssetImage('assets/images/AECCI Logo (1).png'),
//     //                       fit: BoxFit.contain,
//     //                     ),
//     //                   ),
//     //                 ),
//     //                 SizedBox(height: 10),
//     //               ],
//     //             ),
//     //           ),
//     //         ),
//     //         // Profile section
//     //         ExpansionTile(
//     //           title: Text('Profile',
//     //             style: TextStyle(color: Colors.black, fontSize: 18)),
//     //         children: [
//     //            ListTile(
//     //          dense: true,
//     //           visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//     //           title: Text('Personal Details',
//     //            style: TextStyle(color: Colors.black,fontSize: 15)),
//     //         onTap: () {
//     //           Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalDetailsScreen()),
//     //            );
//     //           },
//     //         ),
//     //         ListTile(
//     //          dense: true,
//     //            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//     //             title: Text('Company Details',
//     //              style: TextStyle(color: Colors.black,fontSize: 15)),
//     //           onTap: () {
//     //           Navigator.push(context, MaterialPageRoute(builder: (context) => CompanyDetailsScreen()),
//     //            );
//     //           },
//     //         ),
//     //         ListTile(
//     //          dense: true,
//     //            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//     //             title: Text('Marketing Information',
//     //            style: TextStyle(color: Colors.black,fontSize: 15)),
//     //           onTap: () {
//     //           Navigator.push(context, MaterialPageRoute(builder: (context) => MarketingInformationScreen()),
//     //            );
//     //           },
//     //         ),
//     //         ListTile(
//     //         dense: true,
//     //         visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//     //         title: Text('Change Password',
//     //         style: TextStyle(color: Colors.black,fontSize: 15)),
//     //         onTap: () {
//     //           Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
//     //           );
//     //         // Navigate to Change Password screen
//     //         },
//     //         ),
//     //         ],
//     //         ),
//     //
//     //         ExpansionTile(
//     //         title: Text('Services',
//     //         style: TextStyle(color: Colors.black, fontSize: 18)),
//     //         children: [
//     //         ListTile(
//     //         dense: true,
//     //         visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//     //         title: Text('Certificate of Collaboration',
//     //         style: TextStyle(color: Colors.black,fontSize: 15)),
//     //         onTap: () {
//     //         // Navigate to Certificate of Collaboration screen
//     //         },
//     //         ),
//     //         ListTile(
//     //         dense: true,
//     //         visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//     //         title: Text('Collaboration Portal',
//     //         style: TextStyle(color: Colors.black,fontSize: 15)),
//     //         onTap: () {
//     //         // Navigate to Collaboration Portal screen
//     //         },
//     //         ),
//     //         ],
//     //         ),
//     //
//     //
//     //         ExpansionTile(
//     //         title: Text('Arbitration Center',
//     //         style: TextStyle(color: Colors.black, fontSize: 18)),
//     //         children: [
//     //         ListTile(
//     //         dense: true,
//     //         visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//     //         title: Text('Rules, Forms & Fees',
//     //         style: TextStyle(color: Colors.black,fontSize: 15)),
//     //         onTap: () {
//     //         // Navigate to Rules, Forms & Fees screen
//     //         },
//     //         ),
//     //         ListTile(
//     //         dense: true,
//     //         visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//     //         title: Text('Panel List',
//     //         style: TextStyle(color: Colors.black,fontSize: 15)),
//     //         onTap: () {
//     //         // Navigate to Panel List screen
//     //         },
//     //         ),
//     //         ListTile(
//     //         dense: true,
//     //         visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//     //         title: Text('Raise your Dispute',
//     //         style: TextStyle(color: Colors.black,fontSize: 15)),
//     //         onTap: () {
//     //         // Navigate to Raise your Dispute screen
//     //         },
//     //         ),
//     //         ListTile(
//     //         dense: true,
//     //         visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//     //         title: Text('List Of Agreement',
//     //         style: TextStyle(color: Colors.black,fontSize: 15)),
//     //         onTap: () {
//     //         // Navigate to List of Agreement screen
//     //         },
//     //         ),
//     //         ],
//     //         ),
//     //
//     //         ExpansionTile(
//     //         title: Text('Events',
//     //         style: TextStyle(color: Colors.black, fontSize: 18)),
//     //         children: [
//     //         ListTile(
//     //         dense: true,
//     //         visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//     //         title: Text('Chamber Event Bookings',
//     //         style: TextStyle(color: Colors.black,fontSize: 15)),
//     //         onTap: () {
//     //         // Navigate to Chamber Event Bookings screen
//     //         },
//     //         ),
//     //         ListTile(
//     //         dense: true,
//     //         visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//     //         title: Text('Virtual B2B Forum',
//     //         style: TextStyle(color: Colors.black,fontSize: 15)),
//     //         onTap: () {
//     //         // Navigate to Virtual B2B Forum screen
//     //         },
//     //         ),
//     //         ],
//     //         ),
//     //
//     //         ExpansionTile(
//     //         title: Text('Publications',
//     //         style: TextStyle(color: Colors.black, fontSize: 18)),
//     // children: [
//     // ListTile(
//     // dense: true,
//     // visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//     // title: Text('Digital Library',
//     // style: TextStyle(color: Colors.black,fontSize: 15)),
//     // onTap: () {
//     // // Navigate to Digital Library screen
//     // },
//     // ),
//     // ],
//     // ),
//     // ],
//     // ),
//     //   ),
//
//       appBar: AppBar(
//         title: Image.asset(
//           'assets/images/AECCI Logo (1).png', // Path to your image asset
//           height: 55, // Adjust the height of the image
//         ),
//         backgroundColor: const Color(0xFF20533A),
//         centerTitle: true,
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               icon: const Icon(
//                 Icons.menu,
//                 color: Colors.white,
//                 size: 30,
//               ),
//               onPressed: () {
//                 Scaffold.of(context).openDrawer(); // Open the drawer
//               },
//             );
//           },
//         ),
//       ),
//       // Add the Drawer widget here
//
//       body: Padding(
//         padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Small Card for Dashboard details
//               Center(  // This will center the card horizontally
//                 child: Container(
//
//                   width: 350,  // Set a specific width for the card
//                   child: Card(
//
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     // Optional: Add elevation for shadow effect
//                     child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Row to align Dashboard and Collaboration NO on the same line
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               // Dashboard Title
//                               Text(
//                                 'Dashboard',
//                                 style: TextStyle(
//                                   fontSize: 25,
//                                   fontWeight: FontWeight.bold,
//                                   // color: Color(0xFF007bff),
//                                   color: Colors.black
//                                 ),
//                               ),
//                               // Collaboration NO aligned to the right side
//                               Text(
//                                 'Collaboration NO',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black54,
//                                 ),
//                               ),
//                             ],
//                           ),
//
//
//                           // Collaboration Number below the Collaboration NO
//                           Align(
//                             alignment: Alignment.centerRight,  // Align to the right side
//                             child: Text(
//                               'AECCI/COLL/24-25/000',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.black54,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: double.infinity,  // Full width
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align content on both sides
//                                 children: [
//                                   // Wallet Balance Text
//                                   Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         'Wallet Balance:',
//                                         style: TextStyle(
//                                           fontSize: 14,
//                                           color: Colors.black,
//                                         ),
//                                       ),
//                                       Text(
//                                         '₹ 15,000.00',
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   // Use Flexible for "Valid Upto"
//                                   Flexible(
//                                     child: Align(
//                                       alignment: Alignment.centerRight,
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.end,
//                                         children: [
//                                           Text(
//                                             'Valid Upto:',
//                                             style: TextStyle(
//                                               fontSize: 14,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                           Text(
//                                             '2026-03-31',
//                                             style: TextStyle(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           // Welcome message
//                           Text(
//                             'Welcome!',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black87,
//                             ),
//                           ),
//
//
//                           // Display Email
//                           Text(
//                             'testcollaboration@aecci.org.in',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.black54,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//         SizedBox(height: 10),
//               Center(  // This will center the card horizontally
//                 child: Container(
//                   // color: Colors.green,
//                   width: 350,  // Set a specific width for the card
//                   child: Card(
//                  //   color: Colors.,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     // Optional: Add elevation for shadow effect
//                     child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Row to align Dashboard and Collaboration NO on the same line
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               // Dashboard Title
//                               Text(
//                                 'You are currently our''\n''Collaboration Partner',
//                                 style: TextStyle(
//                                   fontSize: 22,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black
//                                 ),
//                               ),
//                               // Collaboration NO aligned to the right side
//
//                             ],
//                           ),
//                           Divider(color: Colors.grey),
//                           Text(
//                             'Company Name',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF007bff),
//                             ),
//                           ),
//                           Divider(color: Colors.grey),
//                           Text(
//                             'Owners Name :',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           SizedBox(height: 6),
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.email,
//                                 color: Color(0xFF007bff), // You can choose any color you like
//                               ),
//                               SizedBox(width: 8),
//                               Text(
//                                 'Email :',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.black54,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//
//                               // Add some spacing between the text and the icon
//                               SizedBox(width: 8), // You can adjust the width as needed
//
//                               // The Email Icon (using Icons.email as an example)
//
//                             ],
//                           ),
//
//                           SizedBox(height: 5),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               // Year of Establishment
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.calendar_today, // Icon for Year of Establishment
//                                     color: Color(0xFF007bff), // You can change the color
//                                   ),
//                                   SizedBox(width: 8), // Space between icon and text
//                                   Text(
//                                     'Year of Establishment :',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.black54,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 5),
//
//                               // Company Address
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.location_on, // Icon for Address
//                                     color: Color(0xFF007bff),
//                                   ),
//                                   SizedBox(width: 8),
//                                   Text(
//                                     'Company Address :',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.black54,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 5),
//
//                               // Company Mobile No.
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.phone, // Icon for Mobile Number
//                                     color: Color(0xFF007bff),
//                                   ),
//                                   SizedBox(width: 8),
//                                   Text(
//                                     'Company Mobile No. :',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.black54,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 5),
//
//                               // Company Product
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.shopping_bag, // Icon for Product
//                                     color: Color(0xFF007bff),
//                                   ),
//                                   SizedBox(width: 8),
//                                   Text(
//                                     'Company Product :',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.black54,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 5),
//
//                               // Company Activity
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.business, // Icon for Activity
//                                     color: Color(0xFF007bff),
//                                   ),
//                                   SizedBox(width: 8),
//                                   Text(
//                                     'Company Activity :',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.black54,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 3),
//                             ],
//                           )
//
//
//
//
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//                 SizedBox(height: 10),
//
//               Center(  // This will center the card horizontally
//                 child: Container(
//                   // color: Colors.green,
//                   width: 350,  // Set a specific width for the card
//                   child: Card(
//                     //   color: Colors.,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     // Optional: Add elevation for shadow effect
//                     child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Row to align Dashboard and Collaboration NO on the same line
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               // Dashboard Title
//                               Text(
//                                 'Contact Our Team''\n''For More Information',
//                                 style: TextStyle(
//                                   fontSize: 22,
//                                   fontWeight: FontWeight.bold,
//                                     color: Colors.black
//                                 ),
//                               ),
//                               // Collaboration NO aligned to the right side
//
//                             ],
//                           ),
//                           Divider(color: Colors.grey),
//                           Container(
//
//                             padding: EdgeInsets.all(5),  // Padding around the container for spacing
//                             decoration: BoxDecoration(
//                               color: Color(0xFF007bff), // Background color
//                               borderRadius: BorderRadius.circular(8), // Rounded corners (optional)
//                                // Border color and thickness
//                             ),
//                             child: Column(
//                               children: [
//                                 // First line with "Chamber desk no: 022-"
//                                 Text(
//                                   'Chamber desk no: 022-',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//
//                                 // Second line with "41271145/46/47", centering '4127'
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,  // This will center the row content
//                                   children: [
//
//                                   ],
//                                 ),
//
//                                 // Display the remaining part "71145/46/47"
//                                 Text(
//                                   '412771145/46/47',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.normal,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                           Container(
//
//                             padding: EdgeInsets.all(5),  // Padding around the container for spacing
//                             decoration: BoxDecoration(
//                               color: Color(0xFF007bff), // Background color
//                               borderRadius: BorderRadius.circular(8), // Rounded corners (optional)
//                               // Border color and thickness
//                             ),
//                             child: Column(
//                               children: [
//                                 // First line with "Chamber desk no: 022-"
//                                 Text(
//                                   'Mobile & WhatsApp No:',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//
//                                 // Second line with "41271145/46/47", centering '4127'
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,  // This will center the row content
//                                   children: [
//
//                                   ],
//                                 ),
//
//                                 // Display the remaining part "71145/46/47"
//                                 Text(
//                                   '8433720996',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.normal,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                           Container(
//
//                             padding: EdgeInsets.all(5),  // Padding around the container for spacing
//                             decoration: BoxDecoration(
//                               color: Color(0xFF007bff), // Background color
//                               borderRadius: BorderRadius.circular(8), // Rounded corners (optional)
//                                // Border color and thickness
//                             ),
//                             child: Column(
//                               children: [
//                                 // First line with "Chamber desk no: 022-"
//                                 Text(
//                                   'E-mail id:',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//
//                                 // Second line with "41271145/46/47", centering '4127'
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,  // This will center the row content
//                                   children: [
//
//                                   ],
//                                 ),
//
//                                 // Display the remaining part "71145/46/47"
//                                 Text(
//                                   'info@aecci.org.in',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.normal,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: 10),
//
//
//               Center(  // This will center the card horizontally
//                 child: Container(
//                   // color: Colors.green,
//                   width: 350,  // Set a specific width for the card
//                   child: Card(
//                     //   color: Colors.,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     // Optional: Add elevation for shadow effect
//                     child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           // Row to align Dashboard and Collaboration NO on the same line
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               // Dashboard Title
//                               Text(
//                                 'Submission & Collection of''\n''Approved COOs:',
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.red,
//                                 ),
//                               ),
//                               // Collaboration NO aligned to the right side
//
//                             ],
//                           ),
//                           Divider(color: Colors.grey),
//
//                           buildCOOCard(
//                             title: 'For Electronic Certificate\nof Origin (eCO)',
//                             subtitle: '(Printed by User):',
//                             details: [
//                               '24X7*',
//                               '*For perishable/ Agricultural Goods Exporters Only!'
//                             ],
//                             bgColor: Colors.green,
//                             textColor: Colors.white,
//                           ),
//                           SizedBox(height: 16),
//                           buildCOOCard(
//                             title: 'For Semi Electronic Certificate\nof Origin (SeCO)',
//                             subtitle: '(Printed at Chamber desk):',
//                             details: [
//                               'If submitted between 5:30 PM - 9:30 AM, collect at 11:30 AM - 1:30 PM.',
//
//                               'If submitted between 9:30 AM - 2 PM, collect at 4:00 PM - 6:00 PM.'
//                             ],
//                             bgColor: Colors.blue,
//                             textColor: Colors.white,
//                           ),
//                           SizedBox(height: 16),
//                           buildCOOCard(
//                             title: 'For Non-Standard Documents',
//                             subtitle: '(Printed by User):',
//                             details: [
//                               '10 AM to 5:30 PM*',
//                               '*Approval time varies depending on the time of submission'
//                             ],
//                             bgColor: Colors.orange,
//                             textColor: Colors.white,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   Widget buildCOOCard({
//     required String title,
//     required String subtitle,
//     required List<String> details,
//     required Color bgColor,
//     required Color textColor,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: bgColor,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       padding: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: textColor,
//             ),
//           ),
//           SizedBox(height: 4),
//           Text(
//             subtitle,
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.normal,
//               color: textColor,
//             ),
//           ),
//           SizedBox(height: 8),
//           for (var detail in details)
//             Text(
//               detail,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.normal,
//                 color: textColor,
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
// }
//correct fetching
//30 jan 6 pm with
// import 'package:flutter/material.dart';
// import 'package:aecci/component/eplatform.dart';
// import 'package:aecci/views/drawer/personal_details.dart';
// import 'package:flutter_svg/svg.dart'; // Import your component
//
// import 'package:aecci/views/drawer/company_details.dart';
// import 'package:aecci/views/drawer/market_information.dart';
// import 'package:aecci/views/drawer/change_password.dart';
// import 'package:aecci/views/drawer/custom_drawer.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:intl/intl.dart';
//
//
// class DashboardScreen extends StatefulWidget {
//   final Map<String, dynamic>? loginData;
//
//   const DashboardScreen({super.key, this.loginData});
//
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   String? gstNo;
//   String? email;
//   String? companyName;
//   String? balance;
//   String? validUpTo;
//
//   //
//   Map<String, dynamic>? companyDirData;
//   bool isLoading = true;
//   String? error;
//
//
//   @override
//   void initState() {
//     super.initState();
//     print("Login Data: ${widget.loginData}"); // Debugging
//
//     // ✅ Ensure loginData exists and has the 'info' field
//     if (widget.loginData != null && widget.loginData!['info'] != null) {
//       final info = widget.loginData!['info'] as Map<String, dynamic>;
//       gstNo = info['gstNo']?.toString() ?? 'N/A';
//       balance = info['balance']?.toString() ?? 'N/A';
//       email = info['email']?.toString() ?? 'N/A';
//       validUpTo = info['validUpTo']?.toString() ?? 'N/A';
//       companyName = info['companyName']?.toString() ?? 'N/A';
//     } else {
//       print("Error: Login data or 'info' field is missing.");
//     }
//     // Fetch company directory details
//     fetchCompanyDirDetails();
//   }
//
//   String formatDate(String date) {
//     try {
//       final parsedDate = DateTime.parse(date);
//       return DateFormat('dd MMM yyyy').format(parsedDate);
//     } catch (e) {
//       return date; // Return the original date if parsing fails
//     }
//   }
//
//   Future<void> fetchCompanyDirDetails() async {
//     try {
//       print('Fetching company directory details...');
//
//       // Add any required headers here
//       final Map<String, String> headers = {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         // Add any authorization headers if needed
//         // 'Authorization': 'Bearer your_token_here',
//       };
//
//       final response = await http.get(
//         Uri.parse('https://e-platapi.aecci.org.in/getComDirDetails'),
//         headers: headers,
//       );
//
//       print('Response status code: ${response.statusCode}');
//       print('Response body: ${response.body}');
//
//       if (response.statusCode == 200) {
//         final decodedData = json.decode(response.body);
//         print('Decoded data: $decodedData');
//
//         setState(() {
//           companyDirData = decodedData;
//           isLoading = false;
//           error = null;
//         });
//       } else if (response.statusCode == 404) {
//         print('Resource not found: ${response.body}');
//         setState(() {
//           error = 'Resource not found (404)';
//           isLoading = false;
//         });
//       } else {
//         print('Error response body: ${response.body}');
//         setState(() {
//           error = 'Failed to load company details (Status: ${response.statusCode})';
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       print('Error fetching company details: $e');
//       setState(() {
//         error = 'Error: $e';
//         isLoading = false;
//       });
//     }
//   }
//
//
//   String getCompanyDataValue(String key) {
//     try {
//       final value = companyDirData?[key];
//       if (value == null) return 'N/A';
//       return value.toString();
//     } catch (e) {
//       print('Error getting value for $key: $e');
//       return 'N/A';
//     }
//   }
//
//   Widget buildCompanyDetailsCard() {
//     if (isLoading) {
//       return Container(
//         width: 350,
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Center(child: CircularProgressIndicator()),
//           ),
//         ),
//       );
//     }
//
//     if (error != null) {
//       return Container(
//         width: 350,
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 Text('Error loading company details:'),
//                 SizedBox(height: 8),
//                 Text(error!, style: TextStyle(color: Colors.red)),
//                 SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       isLoading = true;
//                       error = null;
//                     });
//                     fetchCompanyDirDetails();
//                   },
//                   child: Text('Retry'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//
//     return Center(
//       child: Container(
//         width: 350,
//         child: Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'You are currently our\nCollaboration Partner',
//                   style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black
//                   ),
//                 ),
//                 Divider(color: Colors.grey),
//                 Text(
//                   getCompanyDataValue('companyName'),
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF007bff),
//                   ),
//                 ),
//                 Divider(color: Colors.grey),
//                 Text(
//                   'Owners Name:',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 Text(
//                   getCompanyDataValue('ownersName'),
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.black54,
//                   ),
//                 ),
//                 SizedBox(height: 6),
//                 buildInfoRow(
//                   Icons.email,
//                   'Email:',
//                   getCompanyDataValue('email'),
//                 ),
//                 SizedBox(height: 5),
//                 buildInfoRow(
//                   Icons.calendar_today,
//                   'Year of Establishment:',
//                   getCompanyDataValue('establishmentYear'),
//                 ),
//                 SizedBox(height: 5),
//                 buildInfoRow(
//                   Icons.location_on,
//                   'Company Address:',
//                   getCompanyDataValue('companyAdd'),
//                 ),
//                 SizedBox(height: 5),
//                 buildInfoRow(
//                   Icons.phone,
//                   'Company Mobile No.:',
//                   getCompanyDataValue('mobileNo'),
//                 ),
//                 SizedBox(height: 5),
//                 buildInfoRow(
//                   Icons.shopping_bag,
//                   'Company Product:',
//                   getCompanyDataValue('companyProduct'),
//                 ),
//                 SizedBox(height: 5),
//                 buildInfoRow(
//                   Icons.business,
//                   'Company Activity:',
//                   getCompanyDataValue('companyActivity'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: CustomDrawer(context: context),
//       appBar: AppBar(
//         title: Image.asset(
//           'assets/images/AECCI Logo (1).png', // Path to your image asset
//           height: 55, // Adjust the height of the image
//         ),
//         backgroundColor: const Color(0xFF20533A),
//         centerTitle: true,
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               icon: const Icon(
//                 Icons.menu,
//                 color: Colors.white,
//                 size: 30,
//               ),
//               onPressed: () {
//                 Scaffold.of(context).openDrawer(); // Open the drawer
//               },
//             );
//           },
//         ),
//       ),
//       // Add the Drawer widget here
//
//       body: Padding(
//         padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Small Card for Dashboard details
//               Center(  // This will center the card horizontally
//                 child: Container(
//
//                   width: 350,  // Set a specific width for the card
//                   child: Card(
//
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     // Optional: Add elevation for shadow effect
//                     child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Row to align Dashboard and Collaboration NO on the same line
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               // Dashboard Title
//                               Text(
//                                 'Dashboard',
//                                 style: TextStyle(
//                                     fontSize: 25,
//                                     fontWeight: FontWeight.bold,
//                                     // color: Color(0xFF007bff),
//                                     color: Colors.black
//                                 ),
//                               ),
//                               // Collaboration NO aligned to the right side
//                               Text(
//                                 'Collaboration NO',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black54,
//                                 ),
//                               ),
//                             ],
//                           ),
//
//
//                           // Collaboration Number below the Collaboration NO
//                           Align(
//                             alignment: Alignment.centerRight,
//                             child: Text(
//                               "$gstNo", // Display GST number
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.black54,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: double.infinity,  // Full width
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align content on both sides
//                                 children: [
//                                   // Wallet Balance Text
//                                   Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         'Wallet Balance:',
//                                         style: TextStyle(
//                                           fontSize: 14,
//                                           color: Colors.black,
//                                         ),
//                                       ),
//                                       Text(
//                                         "₹ $balance",
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   // Use Flexible for "Valid Upto"
//                                   Flexible(
//                                     child: Align(
//                                       alignment: Alignment.centerRight,
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.end,
//                                         children: [
//                                           Text(
//                                           "Valid Upto",
//                                             style: TextStyle(
//                                               fontSize: 14,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                           Text(
//                                             formatDate(validUpTo ?? 'N/A'),
//                                             style: TextStyle(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           // Welcome message
//                           Text(
//                             'Welcome!',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           Text(
//                             "$email",  // Display email
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.black54,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: 10),
//               buildCompanyDetailsCard(),
//               // Center(  // This will center the card horizontally
//               //   child: Container(
//               //     // color: Colors.green,
//               //     width: 350,  // Set a specific width for the card
//               //     child: Card(
//               //       //   color: Colors.,
//               //       shape: RoundedRectangleBorder(
//               //         borderRadius: BorderRadius.circular(8.0),
//               //       ),
//               //       // Optional: Add elevation for shadow effect
//               //       child: Padding(
//               //         padding: const EdgeInsets.all(10.0),
//               //         child: Column(
//               //           crossAxisAlignment: CrossAxisAlignment.start,
//               //           children: [
//               //             // Row to align Dashboard and Collaboration NO on the same line
//               //             Row(
//               //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //               children: [
//               //                 // Dashboard Title
//               //                 Text(
//               //                   'You are currently our''\n''Collaboration Partner',
//               //                   style: TextStyle(
//               //                       fontSize: 22,
//               //                       fontWeight: FontWeight.bold,
//               //                       color: Colors.black
//               //                   ),
//               //                 ),
//               //                 // Collaboration NO aligned to the right side
//               //
//               //               ],
//               //             ),
//               //             Divider(color: Colors.grey),
//               //             Text(
//               //               "$companyName",
//               //               style: TextStyle(
//               //                 fontSize: 18,
//               //                 fontWeight: FontWeight.bold,
//               //                 color: Color(0xFF007bff),
//               //               ),
//               //             ),
//               //             Divider(color: Colors.grey),
//               //             Text(
//               //               'Owners Name :',
//               //               style: TextStyle(
//               //                 fontSize: 18,
//               //                 fontWeight: FontWeight.bold,
//               //                 color: Colors.black87,
//               //               ),
//               //             ),
//               //             SizedBox(height: 6),
//               //             Row(
//               //               children: [
//               //                 Icon(
//               //                   Icons.email,
//               //                   color: Color(0xFF007bff), // You can choose any color you like
//               //                 ),
//               //                 SizedBox(width: 8),
//               //                 Text(
//               //                   'Email :',
//               //                   style: TextStyle(
//               //                     fontSize: 14,
//               //                     color: Colors.black54,
//               //                     fontWeight: FontWeight.bold,
//               //                   ),
//               //                 ),
//               //                 SizedBox(width: 8), // You can adjust the width as needed
//               //               ],
//               //             ),
//               //
//               //             SizedBox(height: 5),
//               //             Column(
//               //               crossAxisAlignment: CrossAxisAlignment.start,
//               //               children: [
//               //                 // Year of Establishment
//               //                 Row(
//               //                   children: [
//               //                     Icon(
//               //                       Icons.calendar_today, // Icon for Year of Establishment
//               //                       color: Color(0xFF007bff), // You can change the color
//               //                     ),
//               //                     SizedBox(width: 8), // Space between icon and text
//               //                     Text(
//               //                       'Year of Establishment :',
//               //                       style: TextStyle(
//               //                         fontSize: 14,
//               //                         color: Colors.black54,
//               //                         fontWeight: FontWeight.bold,
//               //                       ),
//               //                     ),
//               //                   ],
//               //                 ),
//               //                 SizedBox(height: 5),
//               //
//               //                 // Company Address
//               //                 Row(
//               //                   children: [
//               //                     Icon(
//               //                       Icons.location_on, // Icon for Address
//               //                       color: Color(0xFF007bff),
//               //                     ),
//               //                     SizedBox(width: 8),
//               //                     Text(
//               //                       'Company Address :',
//               //                       style: TextStyle(
//               //                         fontSize: 14,
//               //                         color: Colors.black54,
//               //                         fontWeight: FontWeight.bold,
//               //                       ),
//               //                     ),
//               //                   ],
//               //                 ),
//               //                 SizedBox(height: 5),
//               //
//               //                 // Company Mobile No.
//               //                 Row(
//               //                   children: [
//               //                     Icon(
//               //                       Icons.phone, // Icon for Mobile Number
//               //                       color: Color(0xFF007bff),
//               //                     ),
//               //                     SizedBox(width: 8),
//               //                     Text(
//               //                       'Company Mobile No. :',
//               //                       style: TextStyle(
//               //                         fontSize: 14,
//               //                         color: Colors.black54,
//               //                         fontWeight: FontWeight.bold,
//               //                       ),
//               //                     ),
//               //                   ],
//               //                 ),
//               //                 SizedBox(height: 5),
//               //
//               //                 // Company Product
//               //                 Row(
//               //                   children: [
//               //                     Icon(
//               //                       Icons.shopping_bag, // Icon for Product
//               //                       color: Color(0xFF007bff),
//               //                     ),
//               //                     SizedBox(width: 8),
//               //                     Text(
//               //                       'Company Product :',
//               //                       style: TextStyle(
//               //                         fontSize: 14,
//               //                         color: Colors.black54,
//               //                         fontWeight: FontWeight.bold,
//               //                       ),
//               //                     ),
//               //                   ],
//               //                 ),
//               //                 SizedBox(height: 5),
//               //
//               //                 // Company Activity
//               //                 Row(
//               //                   children: [
//               //                     Icon(
//               //                       Icons.business, // Icon for Activity
//               //                       color: Color(0xFF007bff),
//               //                     ),
//               //                     SizedBox(width: 8),
//               //                     Text(
//               //                       'Company Activity :',
//               //                       style: TextStyle(
//               //                         fontSize: 14,
//               //                         color: Colors.black54,
//               //                         fontWeight: FontWeight.bold,
//               //                       ),
//               //                     ),
//               //                   ],
//               //                 ),
//               //                 SizedBox(height: 3),
//               //               ],
//               //             )
//               //
//               //
//               //
//               //
//               //           ],
//               //         ),
//               //       ),
//               //     ),
//               //   ),
//               // ),
//
//               SizedBox(height: 10),
//
//               Center(  // This will center the card horizontally
//                 child: Container(
//                   // color: Colors.green,
//                   width: 350,  // Set a specific width for the card
//                   child: Card(
//                     //   color: Colors.,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     // Optional: Add elevation for shadow effect
//                     child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Row to align Dashboard and Collaboration NO on the same line
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               // Dashboard Title
//                               Text(
//                                 'Contact Our Team''\n''For More Information',
//                                 style: TextStyle(
//                                     fontSize: 22,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black
//                                 ),
//                               ),
//                               // Collaboration NO aligned to the right side
//
//                             ],
//                           ),
//                           Divider(color: Colors.grey),
//                           Container(
//
//                             padding: EdgeInsets.all(5),  // Padding around the container for spacing
//                             decoration: BoxDecoration(
//                               color: Color(0xFF007bff), // Background color
//                               borderRadius: BorderRadius.circular(8), // Rounded corners (optional)
//                               // Border color and thickness
//                             ),
//                             child: Column(
//                               children: [
//                                 // First line with "Chamber desk no: 022-"
//                                 Text(
//                                   'Chamber desk no: 022-',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//
//                                 // Second line with "41271145/46/47", centering '4127'
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,  // This will center the row content
//                                   children: [
//
//                                   ],
//                                 ),
//
//                                 // Display the remaining part "71145/46/47"
//                                 Text(
//                                   '412771145/46/47',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.normal,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                           Container(
//
//                             padding: EdgeInsets.all(5),  // Padding around the container for spacing
//                             decoration: BoxDecoration(
//                               color: Color(0xFF007bff), // Background color
//                               borderRadius: BorderRadius.circular(8), // Rounded corners (optional)
//                               // Border color and thickness
//                             ),
//                             child: Column(
//                               children: [
//                                 // First line with "Chamber desk no: 022-"
//                                 Text(
//                                   'Mobile & WhatsApp No:',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//
//                                 // Second line with "41271145/46/47", centering '4127'
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,  // This will center the row content
//                                   children: [
//
//                                   ],
//                                 ),
//
//                                 // Display the remaining part "71145/46/47"
//                                 Text(
//                                   '8433720996',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.normal,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                           Container(
//
//                             padding: EdgeInsets.all(5),  // Padding around the container for spacing
//                             decoration: BoxDecoration(
//                               color: Color(0xFF007bff), // Background color
//                               borderRadius: BorderRadius.circular(8), // Rounded corners (optional)
//                               // Border color and thickness
//                             ),
//                             child: Column(
//                               children: [
//                                 // First line with "Chamber desk no: 022-"
//                                 Text(
//                                   'E-mail id:',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//
//                                 // Second line with "41271145/46/47", centering '4127'
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,  // This will center the row content
//                                   children: [
//
//                                   ],
//                                 ),
//
//                                 // Display the remaining part "71145/46/47"
//                                 Text(
//                                   'info@aecci.org.in',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.normal,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: 10),
//
//
//               Center(  // This will center the card horizontally
//                 child: Container(
//                   // color: Colors.green,
//                   width: 350,  // Set a specific width for the card
//                   child: Card(
//                     //   color: Colors.,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     // Optional: Add elevation for shadow effect
//                     child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           // Row to align Dashboard and Collaboration NO on the same line
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               // Dashboard Title
//                               Text(
//                                 'Submission & Collection of''\n''Approved COOs:',
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.red,
//                                 ),
//                               ),
//                               // Collaboration NO aligned to the right side
//
//                             ],
//                           ),
//                           Divider(color: Colors.grey),
//
//                           buildCOOCard(
//                             title: 'For Electronic Certificate\nof Origin (eCO)',
//                             subtitle: '(Printed by User):',
//                             details: [
//                               '24X7*',
//                               '*For perishable/ Agricultural Goods Exporters Only!'
//                             ],
//                             bgColor: Colors.green,
//                             textColor: Colors.white,
//                           ),
//                           SizedBox(height: 16),
//                           buildCOOCard(
//                             title: 'For Semi Electronic Certificate\nof Origin (SeCO)',
//                             subtitle: '(Printed at Chamber desk):',
//                             details: [
//                               'If submitted between 5:30 PM - 9:30 AM, collect at 11:30 AM - 1:30 PM.',
//
//                               'If submitted between 9:30 AM - 2 PM, collect at 4:00 PM - 6:00 PM.'
//                             ],
//                             bgColor: Colors.blue,
//                             textColor: Colors.white,
//                           ),
//                           SizedBox(height: 16),
//                           buildCOOCard(
//                             title: 'For Non-Standard Documents',
//                             subtitle: '(Printed by User):',
//                             details: [
//                               '10 AM to 5:30 PM*',
//                               '*Approval time varies depending on the time of submission'
//                             ],
//                             bgColor: Colors.orange,
//                             textColor: Colors.white,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildInfoRow(IconData icon, String label, String value) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Icon(
//               icon,
//               color: Color(0xFF007bff),
//             ),
//             SizedBox(width: 8),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.black54,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 32),
//           child: Text(
//             value,
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.black87,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildCOOCard({
//     required String title,
//     required String subtitle,
//     required List<String> details,
//     required Color bgColor,
//     required Color textColor,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: bgColor,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       padding: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: textColor,
//             ),
//           ),
//           SizedBox(height: 4),
//           Text(
//             subtitle,
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.normal,
//               color: textColor,
//             ),
//           ),
//           SizedBox(height: 8),
//           for (var detail in details)
//             Text(
//               detail,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.normal,
//                 color: textColor,
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
// }






import 'package:flutter/material.dart';
import 'package:aecci/component/eplatform.dart';
import 'package:aecci/views/drawer/personal_details.dart';
import 'package:flutter_svg/svg.dart'; // Import your component

import 'package:aecci/views/drawer/company_details.dart';
import 'package:aecci/views/drawer/market_information.dart';
import 'package:aecci/views/drawer/change_password.dart';
import 'package:aecci/views/drawer/custom_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';


class DashboardScreen extends StatefulWidget {
  final Map<String, dynamic>? loginData;

  const DashboardScreen({super.key, this.loginData});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String? gstNo;
  String? email;
  String? companyName;
  String? balance;
  String? validUpTo;

  //
  Map<String, dynamic>? companyDirData;
  bool isLoading = true;
  String? error;


  @override
  void initState() {
    super.initState();
    print("Login Data: ${widget.loginData}"); // Debugging

    // ✅ Ensure loginData exists and has the 'info' field
    if (widget.loginData != null && widget.loginData!['info'] != null) {
      final info = widget.loginData!['info'] as Map<String, dynamic>;
      gstNo = info['gstNo']?.toString() ?? 'N/A';
      balance = info['balance']?.toString() ?? 'N/A';
      email = info['email']?.toString() ?? 'N/A';
      validUpTo = info['validUpTo']?.toString() ?? 'N/A';
      companyName = info['companyName']?.toString() ?? 'N/A';
    } else {
      print("Error: Login data or 'info' field is missing.");
    }
    // Fetch company directory details
    //fetchCompanyDirDetails();
  }

  String formatDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat('dd MMM yyyy').format(parsedDate);
    } catch (e) {
      return date; // Return the original date if parsing fails
    }
  }

  // Future<void> fetchCompanyDirDetails() async {
  //   try {
  //     // Ensure loginData and token exist
  //     if (widget.loginData != null && widget.loginData!['info'] != null) {
  //       final String id = widget.loginData!['info']['_id']; // Retrieve _id from login data
  //       final String? token = widget.loginData!['token']; // Retrieve token from login data (nullable)
  //
  //       // Check if token is null or empty
  //       if (token == null || token.isEmpty) {
  //         print('Error: Token is missing.');
  //         setState(() {
  //           error = 'Token is missing';
  //           isLoading = false;
  //         });
  //         return;
  //       }
  //
  //       print('Fetching data for ID: $id');
  //
  //       // Update API URL to include the _id
  //       final String url = 'https://e-platapi.aecci.org.in/getComDirDetails/$id';
  //
  //       final Map<String, String> headers = {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer $token', // Include the token here
  //       };
  //
  //       final response = await http.get(
  //         Uri.parse(url),
  //         headers: headers,
  //       );
  //
  //       print('Response status code: ${response.statusCode}');
  //       print('Response body: ${response.body}');
  //
  //       if (response.statusCode == 200) {
  //         final decodedData = json.decode(response.body);
  //         print('Decoded data: $decodedData');
  //
  //         setState(() {
  //           companyDirData = decodedData;
  //           isLoading = false;
  //           error = null;
  //         });
  //       } else if (response.statusCode == 404) {
  //         print('Resource not found: ${response.body}');
  //         setState(() {
  //           error = 'Resource not found (404)';
  //           isLoading = false;
  //         });
  //       } else {
  //         print('Error response body: ${response.body}');
  //         setState(() {
  //           error = 'Failed to load company details (Status: ${response.statusCode})';
  //           isLoading = false;
  //         });
  //       }
  //     }
  //   } catch (e) {
  //     print('Error fetching company details: $e');
  //     setState(() {
  //       error = 'Error: $e';
  //       isLoading = false;
  //     });
  //   }
  // }
  //
  //
  // String getCompanyDataValue(String key) {
  //   try {
  //     final value = companyDirData?[key];
  //     if (value == null) return 'N/A';
  //     return value.toString();
  //   } catch (e) {
  //     print('Error getting value for $key: $e');
  //     return 'N/A';
  //   }
  // }
  //
  // Widget buildCompanyDetailsCard() {
  //   if (isLoading) {
  //     return Container(
  //       width: 350,
  //       child: Card(
  //         child: Padding(
  //           padding: const EdgeInsets.all(20.0),
  //           child: Center(child: CircularProgressIndicator()),
  //         ),
  //       ),
  //     );
  //   }
  //
  //   if (error != null) {
  //     return Container(
  //       width: 350,
  //       child: Card(
  //         child: Padding(
  //           padding: const EdgeInsets.all(20.0),
  //           child: Column(
  //             children: [
  //               Text('Error loading company details:'),
  //               SizedBox(height: 8),
  //               Text(error!, style: TextStyle(color: Colors.red)),
  //               SizedBox(height: 16),
  //               ElevatedButton(
  //                 onPressed: () {
  //                   setState(() {
  //                     isLoading = true;
  //                     error = null;
  //                   });
  //                   fetchCompanyDirDetails();
  //                 },
  //                 child: Text('Retry'),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  //
  //   return Center(
  //     child: Container(
  //       width: 350,
  //       child: Card(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(8.0),
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.all(10.0),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 'You are currently our\nCollaboration Partner',
  //                 style: TextStyle(
  //                     fontSize: 22,
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.black
  //                 ),
  //               ),
  //               Divider(color: Colors.grey),
  //               Text(
  //                 getCompanyDataValue('companyName'),
  //                 style: TextStyle(
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold,
  //                   color: Color(0xFF007bff),
  //                 ),
  //               ),
  //               Divider(color: Colors.grey),
  //               Text(
  //                 'Owners Name:',
  //                 style: TextStyle(
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.black87,
  //                 ),
  //               ),
  //               Text(
  //                 getCompanyDataValue('ownersName'),
  //                 style: TextStyle(
  //                   fontSize: 16,
  //                   color: Colors.black54,
  //                 ),
  //               ),
  //               SizedBox(height: 6),
  //               buildInfoRow(
  //                 Icons.email,
  //                 'Email:',
  //                 getCompanyDataValue('email'),
  //               ),
  //               SizedBox(height: 5),
  //               buildInfoRow(
  //                 Icons.calendar_today,
  //                 'Year of Establishment:',
  //                 getCompanyDataValue('establishmentYear'),
  //               ),
  //               SizedBox(height: 5),
  //               buildInfoRow(
  //                 Icons.location_on,
  //                 'Company Address:',
  //                 getCompanyDataValue('companyAdd'),
  //               ),
  //               SizedBox(height: 5),
  //               buildInfoRow(
  //                 Icons.phone,
  //                 'Company Mobile No.:',
  //                 getCompanyDataValue('mobileNo'),
  //               ),
  //               SizedBox(height: 5),
  //               buildInfoRow(
  //                 Icons.shopping_bag,
  //                 'Company Product:',
  //                 getCompanyDataValue('companyProduct'),
  //               ),
  //               SizedBox(height: 5),
  //               buildInfoRow(
  //                 Icons.business,
  //                 'Company Activity:',
  //                 getCompanyDataValue('companyActivity'),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(context: context),
      appBar: AppBar(
        title: Image.asset(
          'assets/images/AECCI Logo (1).png', // Path to your image asset
          height: 55, // Adjust the height of the image
        ),
        backgroundColor: const Color(0xFF20533A),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer
              },
            );
          },
        ),
      ),
      // Add the Drawer widget here

      body: Container(
        color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(  // This will center the card horizontally
                child: Container(


                  width: 350,  // Set a specific width for the card
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    // Optional: Add elevation for shadow effect
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Row to align Dashboard and Collaboration NO on the same line
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Dashboard Title
                              Text(
                                'Dashboard',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    // color: Color(0xFF007bff),
                                    color: Colors.black
                                ),
                              ),
                              // Collaboration NO aligned to the right side
                              Text(
                                'Collaboration NO',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),


                          // Collaboration Number below the Collaboration NO
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "$gstNo", // Display GST number
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,  // Full width
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align content on both sides
                                children: [
                                  // Wallet Balance Text
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Wallet Balance:',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "₹ $balance",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Use Flexible for "Valid Upto"
                                  Flexible(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Valid Upto",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            formatDate(validUpTo ?? 'N/A'),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Welcome message
                          Text(
                            'Welcome!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            "$email",  // Display email
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),
           //   buildCompanyDetailsCard(),
              Center(  // This will center the card horizontally
                child: Container(
                  // color: Colors.green,
                  width: 350,  // Set a specific width for the card
                  child: Card(
                       color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    // Optional: Add elevation for shadow effect
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Row to align Dashboard and Collaboration NO on the same line
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Dashboard Title
                              Text(
                                'You are currently our''\n''Collaboration Partner',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                ),
                              ),
                              // Collaboration NO aligned to the right side

                            ],
                          ),
                          Divider(color: Colors.grey),
                          Text(
                            "$companyName",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                                color: Colors.black,
                            ),
                          ),
                          Divider(color: Colors.grey),
                          Text(
                            'Owners Name :',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(
                                Icons.email,
                                color: Colors.black, // You can choose any color you like
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Email :',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8), // You can adjust the width as needed
                            ],
                          ),

                          SizedBox(height: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Year of Establishment
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today, // Icon for Year of Establishment
                                    // color: Color(0xFF007bff), // You can change the color
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 8), // Space between icon and text
                                  Text(
                                    'Year of Establishment :',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),

                              // Company Address
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on, // Icon for Address
                                    // color: Color(0xFF007bff),
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Company Address :',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),

                              // Company Mobile No.
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone, // Icon for Mobile Number
                                    // color: Color(0xFF007bff),
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Company Mobile No. :',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),

                              // Company Product
                              Row(
                                children: [
                                  Icon(
                                    Icons.shopping_bag, // Icon for Product
                                    // color: Color(0xFF007bff),
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Company Product :',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),

                              // Company Activity
                              Row(
                                children: [
                                  Icon(
                                    Icons.business, // Icon for Activity
                                    // color: Color(0xFF007bff),
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Company Activity :',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 3),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              Center(  // This will center the card horizontally
                child: Container(
                  // color: Colors.green,
                  width: 350,  // Set a specific width for the card
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    // Optional: Add elevation for shadow effect
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Row to align Dashboard and Collaboration NO on the same line
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Dashboard Title
                              Text(
                                'Contact Our Team''\n''For More Information',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                ),
                              ),
                              // Collaboration NO aligned to the right side

                            ],
                          ),
                          Divider(color: Colors.grey),
                          Container(

                            padding: EdgeInsets.all(5),  // Padding around the container for spacing
                            decoration: BoxDecoration(
                              // color: Color(0xFF007bff), // Background color
                              color: Colors.amberAccent.shade400,
                              borderRadius: BorderRadius.circular(8), // Rounded corners (optional)
                              // Border color and thickness
                            ),
                            child: Column(
                              children: [
                                // First line with "Chamber desk no: 022-"
                                Text(
                                  'Chamber desk no: 022-',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),

                                // Second line with "41271145/46/47", centering '4127'
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,  // This will center the row content
                                  children: [

                                  ],
                                ),

                                // Display the remaining part "71145/46/47"
                                Text(
                                  '412771145/46/47',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(

                            padding: EdgeInsets.all(5),  // Padding around the container for spacing
                            decoration: BoxDecoration(
                              color: Colors.amberAccent.shade400, // Background color
                              borderRadius: BorderRadius.circular(8), // Rounded corners (optional)
                              // Border color and thickness
                            ),
                            child: Column(
                              children: [
                                // First line with "Chamber desk no: 022-"
                                Text(
                                  'Mobile & WhatsApp No:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),

                                // Second line with "41271145/46/47", centering '4127'
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,  // This will center the row content
                                  children: [

                                  ],
                                ),

                                // Display the remaining part "71145/46/47"
                                Text(
                                  '8433720996',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(

                            padding: EdgeInsets.all(5),  // Padding around the container for spacing
                            decoration: BoxDecoration(
                              color: Colors.amberAccent.shade400,
                              borderRadius: BorderRadius.circular(8), // Rounded corners (optional)
                              // Border color and thickness
                            ),
                            child: Column(
                              children: [
                                // First line with "Chamber desk no: 022-"
                                Text(
                                  'E-mail id:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),

                                // Second line with "41271145/46/47", centering '4127'
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,  // This will center the row content
                                  children: [

                                  ],
                                ),

                                // Display the remaining part "71145/46/47"
                                Text(
                                  'info@aecci.org.in',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),


              Center(  // This will center the card horizontally
                child: Container(
                  // color: Colors.green,
                  width: 350,  // Set a specific width for the card
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    // Optional: Add elevation for shadow effect
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Row to align Dashboard and Collaboration NO on the same line
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Dashboard Title
                              Text(
                                'Submission & Collection of''\n''Approved COOs:',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              // Collaboration NO aligned to the right side

                            ],
                          ),
                          Divider(color: Colors.grey),

                          buildCOOCard(
                            title: 'For Electronic Certificate\nof Origin (eCO)',
                            subtitle: '(Printed by User):',
                            details: [
                              '24X7*',
                              '*For perishable/ Agricultural Goods Exporters Only!'
                            ],
                            bgColor: Colors.green,
                            textColor: Colors.white,
                          ),
                          SizedBox(height: 16),
                          buildCOOCard(
                            title: 'For Semi Electronic Certificate\nof Origin (SeCO)',
                            subtitle: '(Printed at Chamber desk):',
                            details: [
                              'If submitted between 5:30 PM - 9:30 AM, collect at 11:30 AM - 1:30 PM.',

                              'If submitted between 9:30 AM - 2 PM, collect at 4:00 PM - 6:00 PM.'
                            ],
                            bgColor: Colors.blue,
                            textColor: Colors.white,
                          ),
                          SizedBox(height: 16),
                          buildCOOCard(
                            title: 'For Non-Standard Documents',
                            subtitle: '(Printed by User):',
                            details: [
                              '10 AM to 5:30 PM*',
                              '*Approval time varies depending on the time of submission'
                            ],
                            bgColor: Colors.orange,
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    ),
    );
  }

  Widget buildInfoRow(IconData icon, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: Color(0xFF007bff),
            ),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCOOCard({
    required String title,
    required String subtitle,
    required List<String> details,
    required Color bgColor,
    required Color textColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: textColor,
            ),
          ),
          SizedBox(height: 8),
          for (var detail in details)
            Text(
              detail,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: textColor,
              ),
            ),
        ],
      ),
    );
  }
}
