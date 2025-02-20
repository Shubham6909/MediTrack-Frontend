import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aecci/views/drawer/custom_drawer.dart';




class ChangePasswordScreen extends StatefulWidget {
  final Map<String, dynamic> loginData;

  ChangePasswordScreen({required this.loginData});

  @override
  _ProfileUpdateScreenState createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ChangePasswordScreen> {

  final _companyFromkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: CustomDrawer(context: context),
      drawer: CustomDrawer(
        context: context,
        loginData: widget.loginData ?? {},
      ),
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
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0), // Reduced padding
                  child: Form(
                    key: _companyFromkey, // Changed to unique key
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Change Password',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        _buildLabeledTextField2('Enter Current Password', 'currentPassword'),
                        SizedBox(height: 8),
                        _buildLabeledTextField2('Enter New Password', 'newPassword'),
                        SizedBox(height: 8),
                        _buildLabeledTextField2('Confirm New Password', 'confirmNewPassword'),
                        SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Text(
                              'Update',
                              style: TextStyle(
                                fontSize: 16, // Reduced font size
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabeledTextField2(String label, String fieldName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500), // Increased from 12
        ),
        const SizedBox(height: 4),
        Container(
          height: 40,
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8.0, // Adjusted padding
                horizontal: 12.0, // Increased from 6.0
              ),
              isDense: true,
            ),
            style: const TextStyle(fontSize: 14),
            validator: (value) {
              if (fieldName == 'firstName' || fieldName == 'lastName') {
                if (value == null || value.isEmpty) {
                  return '$label is required';
                }
              } else if (fieldName == 'phone') {
                if (value == null || value.length != 10) {
                  return 'Phone number must be 10 digits';
                }
              } else if (fieldName == 'email') {
                if (value == null || !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$").hasMatch(value)) {
                  return 'Enter a valid email';
                }
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
