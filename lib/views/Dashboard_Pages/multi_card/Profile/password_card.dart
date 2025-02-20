import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aecci/views/drawer/custom_drawer.dart';

class PasswordCard extends StatefulWidget {
  final Map<String, dynamic> loginData;

  PasswordCard({required this.loginData});

  @override
  _PasswordCardState createState() => _PasswordCardState();
}

class _PasswordCardState extends State<PasswordCard> {

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
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Change Password',
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
                              backgroundColor: Color(0xFF1748F8),
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
