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
