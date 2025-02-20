import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aecci/views/drawer/custom_drawer.dart';

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Commercial extends StatefulWidget {
  @override
  _ProfileUpdateScreenState createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<Commercial> {
  final _personalFormKey = GlobalKey<FormState>();

  // Variable to store the picked file for Company Logo
  PlatformFile? _companyLogo;

  // Method to pick company logo file from the device
  Future<void> _pickCompanyLogo() async {
    print("File picker triggered"); // Debug print
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      print("File picked: ${result.files.first.name}"); // Debug print
      setState(() {
        _companyLogo = result.files.first;
      });
    } else {
      print("User canceled the picker"); // Debug print
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: CustomDrawer(context: context),
      drawer: CustomDrawer(context: context, loginData: {}),
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
              // First Card: Commercial Details
              Card(
                elevation: 2, // Added elevation for better visibility
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0), // Reduced padding
                  child: Form(
                    key: _personalFormKey, // Unique form key
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Commercial Directory',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        // Use the file picker widget for Company Logo
                        _buildCompanyLogoPicker('Company Logo', 'companyLogo'),
                        SizedBox(height: 8),
                        _buildLabeledTextField2('Company Name', 'companyName'),
                        SizedBox(height: 8),
                        _buildLabeledTextField2('Owners Name', 'ownersName'),
                        SizedBox(height: 8),
                        _buildLabeledTextField2('Year of establishment', 'mobileNo'),
                        SizedBox(height: 8),
                        _buildLabeledTextField2('Email ID', 'email'),
                        SizedBox(height: 10),
                        _buildLabeledTextField2('Company Address', 'companyAddress'),
                        SizedBox(height: 10),
                        _buildLabeledTextField2('Mobile No', 'mobileNO'),
                        SizedBox(height: 10),
                        _buildLabeledTextField2('Company Products', 'companyProducts'),
                        SizedBox(height: 10),
                        _buildLabeledTextField2('Company Activity', 'companyActivity'),
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
            ],
          ),
        ),
      ),
    );
  }

  /// Widget for building a text field for other fields.
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
                if (value == null ||
                    !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                        .hasMatch(value)) {
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

  /// Widget for picking a company logo file from the device.
  Widget _buildCompanyLogoPicker(String label, String fieldName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: _pickCompanyLogo,
          child: Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey.shade400),
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              _companyLogo == null ? 'Choose file' : _companyLogo!.name,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}
