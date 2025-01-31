import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aecci/views/drawer/custom_drawer.dart';

class PersonalDetailsScreen extends StatefulWidget {
  @override
  _ProfileUpdateScreenState createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<PersonalDetailsScreen> {
  final _personalFormKey = GlobalKey<FormState>();
  final _addressFormKey = GlobalKey<FormState>();
  String? _selectedTitle;  // Selected title for dropdown

  final List<String> titleOptions = ['Mr', 'Mrs', 'Ms','Dr','Prof','Shri','Smt','Hon','Gov','Rep','Amb'];

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
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // First Card: Personal Details
              Card(
                elevation: 2, // Added elevation for better visibility
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0), // Reduced padding
                  child: Form(
                    key: _personalFormKey, // Changed to unique key
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Personal Details',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: _buildLabeledDropdownField('TITLE', 'title'),
                            ),
                            const SizedBox(width: 10), // Reduced spacing
                            Expanded(
                              child: _buildLabeledTextField2('FIRST NAME', 'firstName'),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        _buildLabeledTextField2('SURNAME', 'surname'),
                        SizedBox(height: 8),
                        _buildLabeledTextField2('JOB TITLE', 'jobTitle'),
                        SizedBox(height: 8),
                        _buildLabeledTextField2('MOBILE NO.', 'mobileNo'),
                        SizedBox(height: 8),
                        _buildLabeledTextField2('Email', 'email'),
                        SizedBox(height: 10),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Your update logic here
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

              SizedBox(height: 4),

              // Second Card: Personal Address
              Card(

                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0), // Reduced padding
                  child: Form(
                    key: _addressFormKey, // Changed to unique key
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Personal Address',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        _buildLabeledTextField2('ADDRESS 1', 'address1'),
                        SizedBox(height: 8),
                        _buildLabeledTextField2('ADDRESS 2', 'address2'),
                        SizedBox(height: 8),
                        _buildLabeledTextField2('CITY', 'city'),
                        SizedBox(height: 8),
                        _buildLabeledTextField2('COUNTRY', 'country'),
                        SizedBox(height: 8),
                        _buildLabeledTextField2('STATE', 'state'),
                        SizedBox(height: 8),
                        _buildLabeledTextField2('PIN CODE', 'pinCode'),
                        SizedBox(height: 8),
                        _buildLabeledTextField2('Email', 'email'),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Dropdown widget for the TITLE field
  Widget _buildLabeledDropdownField(String label, String fieldName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500), // Adjusted to match TextField
        ),
        const SizedBox(height: 4), // Reduced from 5 to match TextField spacing
        Container(
          height: 40, // Fixed height for consistency
          child: DropdownButtonFormField<String>(
            value: _selectedTitle,
            onChanged: (newValue) {
              setState(() {
                _selectedTitle = newValue;
              });
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200], // Light grey background
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 6.0, // Padding similar to TextField
                horizontal: 10.0, // Padding consistent with TextField
              ),
              isDense: true, // Makes the dropdown more compact
            ),
            style: const TextStyle(
              fontSize: 14, // Matching font size for the dropdown
              color: Colors.black, // Default text color for better visibility
            ),
            items: titleOptions.map((String title) {
              return DropdownMenuItem<String>(
                value: title,
                child: Text(
                  title,
                  style: TextStyle(color: Colors.black), // Consistent with TextField
                ),
              );
            }).toList(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '$label is required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }


  // Text Form Field for other fields
  Widget _buildLabeledTextField2(String label, String fieldName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500), // Increased from 12
        ),
        const SizedBox(height: 4), // Reduced from 5
        Container(
          height: 40, // Fixed height for the TextFormField
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
              isDense: true, // Makes the field more compact
            ),
            style: const TextStyle(fontSize: 14), // Increased from 12
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

