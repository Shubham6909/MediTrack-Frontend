import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aecci/views/drawer/custom_drawer.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';  // for encoding data to JSON
import 'package:aecci/services/api_service.dart';
import 'package:aecci/views/login_view.dart';
import 'package:aecci/views/Sign_Up/r1.dart';



class Collaborator extends StatefulWidget {
  @override
  _ProfileUpdateScreenState createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<Collaborator> {
  final _personalFormKey = GlobalKey<FormState>();
  final _addressFormKey = GlobalKey<FormState>();
  String? _selectedTitle;
  String? _selectedCategory;
  String? _selectedRole;


  Map<String, dynamic> _formData = {};
  List<String> countriesList = [
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Antigua and Barbuda",
    "Argentina",
    "Armenia",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bhutan",
    "Bolivia",
    "Bosnia and Herzegovina",
    "Botswana",
    "Brazil",
    "Brunei",
    "Bulgaria",
    "Burkina Faso",
    "Burundi",
    "Cabo Verde",
    "Cambodia",
    "Cameroon",
    "Canada",
    "Central African Republic",
    "Chad",
    "Chile",
    "China",
    "Colombia",
    "Comoros",
    "Congo, Democratic Republic of the",
    "Congo, Republic of the",
    "Costa Rica",
    "Cote d'Ivoire",
    "Croatia",
    "Cuba",
    "Cyprus",
    "Czech Republic",
    "Denmark",
    "Djibouti",
    "Dominica",
    "Dominican Republic",
    "East Timor (Timor-Leste)",
    "Ecuador",
    "Egypt",
    "El Salvador",
    "Equatorial Guinea",
    "Eritrea",
    "Estonia",
    "Eswatini",
    "Ethiopia",
    "Fiji",
    "Finland",
    "France",
    "Gabon",
    "Gambia",
    "Georgia",
    "Germany",
    "Ghana",
    "Greece",
    "Grenada",
    "Guatemala",
    "Guinea",
    "Guinea-Bissau",
    "Guyana",
    "Haiti",
    "Honduras",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Ireland",
    "Israel",
    "Italy",
    "Jamaica",
    "Japan",
    "Jordan",
    "Kazakhstan",
    "Kenya",
    "Kiribati",
    "Korea, North",
    "Korea, South",
    "Kosovo",
    "Kuwait",
    "Kyrgyzstan",
    "Laos",
    "Latvia",
    "Lebanon",
    "Lesotho",
    "Liberia",
    "Libya",
    "Liechtenstein",
    "Lithuania",
    "Luxembourg",
    "Madagascar",
    "Malawi",
    "Malaysia",
    "Maldives",
    "Mali",
    "Malta",
    "Marshall Islands",
    "Mauritania",
    "Mauritius",
    "Mexico",
    "Micronesia",
    "Moldova",
    "Monaco",
    "Mongolia",
    "Montenegro",
    "Morocco",
    "Mozambique",
    "Myanmar (Burma)",
    "Namibia",
    "Nauru",
    "Nepal",
    "Netherlands",
    "New Zealand",
    "Nicaragua",
    "Niger",
    "Nigeria",
    "North Macedonia",
    "Norway",
    "Oman",
    "Pakistan",
    "Palau",
    "Palestine",
    "Panama",
    "Papua New Guinea",
    "Paraguay",
    "Peru",
    "Philippines",
    "Poland",
    "Portugal",
    "Qatar",
    "Romania",
    "Russia",
    "Rwanda",
    "Saint Kitts and Nevis",
    "Saint Lucia",
    "Saint Vincent and the Grenadines",
    "Samoa",
    "San Marino",
    "Sao Tome and Principe",
    "Saudi Arabia",
    "Senegal",
    "Serbia",
    "Seychelles",
    "Sierra Leone",
    "Singapore",
    "Slovakia",
    "Slovenia",
    "Solomon Islands",
    "Somalia",
    "South Africa",
    "South Sudan",
    "Spain",
    "Sri Lanka",
    "Sudan",
    "Suriname",
    "Sweden",
    "Switzerland",
    "Syria",
    "Taiwan",
    "Tajikistan",
    "Tanzania",
    "Thailand",
    "Togo",
    "Tonga",
    "Trinidad and Tobago",
    "Tunisia",
    "Turkey",
    "Turkmenistan",
    "Tuvalu",
    "Uganda",
    "Ukraine",
    "United Arab Emirates",
    "United Kingdom",
    "United States",
    "Uruguay",
    "Uzbekistan",
    "Vanuatu",
    "Vatican City",
    "Venezuela",
    "Vietnam",
    "Yemen",
    "Zambia",
    "Zimbabwe",
  ];
  final List<String> titleOptions = [
    'Mr',
    'Mrs',
    'Ms',
    'Dr',
    'Prof',
    'Shri',
    'Smt',
    'Hon',
    'Gov',
    'Rep',
    'Amb'
  ];
  final List<String> category = [
    'Mentor',
    'Lawyer',
    'Accountant',
    'Arbitrator Center',
    'New Market Consultant',
    'Financial Advisor',
    'ADR Professional',
    'Chartered Accountant',
    'Company Secretory',
    'Export Adviser',
    'Commercial Adviser',
    'Innovation Adviser',
    'Digital Service Specialist',
    'Marketing Specialist',
    'Other'
  ];
  final List<String> role = [
    'Administrations/Finance Department',
    'Arbitrator',
    'Practicing Lawyer',
    'Senior Advocate',
    'justice',
    'judge',
    'Board of Directors',
    'Exports/Import Department',
    'General Management',
    'HR Department',
    'IT Department',
    'R&D Department',
    'Sales Department',
    'Export Manager'
  ];

  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  final Map<String, TextEditingController> controllers = {
    'usernameEmail': TextEditingController(),
    'password': TextEditingController(),
    'confirmPassword': TextEditingController(),
    'compnayOrgName': TextEditingController(),
    'firstName': TextEditingController(),
    'lastName': TextEditingController(),
    'address': TextEditingController(),
    'address2': TextEditingController(),
    'country': TextEditingController(),
    'city': TextEditingController(),
    'state': TextEditingController(),
    'pincode': TextEditingController(),
    'phone': TextEditingController(),
    'telephone': TextEditingController(),
    'registrationNo': TextEditingController(),
    'aecciCollaborationNo': TextEditingController(),
  };

  String? selectedProfessionalCategory;
  String? selectedRole;

  void _resetForm() {
    controllers.forEach((_, controller) => controller.clear());
    setState(() {
      selectedProfessionalCategory = null;
      selectedRole = null;
    });
  }

  String? apiErrorMessage;

  Future<void> _handleRegistration() async {
    if (_personalFormKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        // Ensure phone number is clean and converted to integer
        String phoneNumber = controllers['phone']?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? '';
        if (phoneNumber.isEmpty || phoneNumber == '0') {
          throw Exception('Please enter a valid phone number');
        }

        final payload = {
          'email': controllers['usernameEmail']?.text.trim() ?? '',
          'password': controllers['password']?.text ?? '',
          'companyName': controllers['compnayOrgName']?.text.trim() ?? '',
          'firstName': controllers['firstName']?.text.trim() ?? '',
          'surName': controllers['lastName']?.text.trim() ?? '',
          'address1': controllers['address']?.text.trim() ?? '',
          'address2': controllers['address2']?.text.trim() ?? '',
          'country': _formData['country'] ?? '',
          'city': controllers['city']?.text.trim() ?? '',
          'state': controllers['state']?.text.trim() ?? '',
          'pinCode': int.tryParse(controllers['pincode']?.text.trim() ?? '0') ?? 0,
          'phoneNo': int.parse(phoneNumber),
          'telephoneNo': controllers['telephone']?.text.trim() ?? '',
          'businessCategory': _selectedCategory ?? '',
          'role': _selectedRole ?? '',
          'isExisting': true,
          'isTrial': false,
          'reqType': "collaborationReq",
          'selectMembership': "Collaboration",
          'inputNumber': controllers['registrationNo']?.text.trim() ?? '',
          'gstNo': "27XGFTH9012N7Z2",
        };

        print('Sending payload: ${json.encode(payload)}');

        final response = await _apiService.createClient(payload);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration successful!')),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );

        _resetForm();
      } catch (e) {
        print('Registration Error: $e'); // Detailed error logging

        String errorMessage = 'Registration failed';
        if (e.toString().contains('phoneNo is required')) {
          errorMessage = 'Please enter a valid phone number';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

// Add reset functionality for dropdowns


  @override
  void dispose() {
    controllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

    //  drawer: CustomDrawer(context: context),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        title: Image.asset(
          'assets/images/aecci6.png',
          height: 50,
          fit: BoxFit.contain,
        ),

      ),
      body: SafeArea(
    child: Padding(
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
                    key: _addressFormKey, // Changed to unique key
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Text(
                          'Welcome to AECCI',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'To ensure a seamless experience and keep you well-informed about the various activities being undertaken by AECCI, we kindly request that you sign up through our e-platform.',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,
                         ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'By signing up, you will gain access to the e-Platform, '
                              'wherein your profile is visible. Also, '
                              'here you can see the Copy of "Co-operation Agreement" and the "Certificate of Collaboration" active in your profile. '
                              'All this will be kept secured in your digital account on the platform.',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Signing-up will enable you to have the updates about:',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        // Bullet points with proper spacing
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '•',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "Gain visibility by creating your profile.",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,

                                ),
                              ),
                            ),
                          ],
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '•',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'View the signed cooperation agreements and download Certificate of Collaboration.',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,

                                ),
                              ),
                            ),
                          ],
                        ),


                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '•',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Connect one-to-one with our business participants in our exclusive virtual B2B and explore new international clientele.',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,

                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'By Signing-up the B2B Platform, You’ll Get Access To:',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '• Scheduling your meetings :',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Easily set your availability for meetings and receive appointment requests from Indian business participants based on your time slots.',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '• Business Profiles:',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'You can view the list and profile of the businesses interested in trade opportunities in your country.',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '• Probable Points of Discussion:',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'You can also see the probable points of discussion that participants may ask during the meetings.',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'If you need any further assistance, feel free to contact our B2B team at:',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'B2B Sales & Marketing Head',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'Executive Director - Mrs. Swarn Dhiman',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                       const SizedBox(height: 8),

                        // Ms. Rohini P. K.
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Image.asset('assets/images/whatsapp.jpeg',fit: BoxFit.cover,height: 25,),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'WhatsApp: +91-8433720996',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        // Ms. Akshata Mulik
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.phone, size: 24, color: Colors.black),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Board lines: +91-22-41271145|46|47',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),


                         const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.email, size: 20, color: Colors.black),
                            SizedBox(width: 10),
                            Text(
                              'Email: ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'ed@aecci.org.in',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),
                        // Handphone
                        Text(
                              'Monday – Friday: 9.30 am – 6.30 pm*',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        Text(
                          'Saturday – 9.30 am – 3.30 pm* (IST)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // QR Code Image
                            Image.asset('assets/images/qr.png', fit: BoxFit.fill, height: 90),
                            const SizedBox(width: 16),

                            // Column for Work Timings & FAQ Button
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // Work Timings
                                  Text(
                                    'Monday – Friday: \n9.30 am – 6.30 pm*',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Saturday – \n9.30 am – 3.30 pm* (IST)',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                  ),

                                  const SizedBox(height: 8),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF1748F8)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 6, horizontal:4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Read FAQ\'s',
                                style: TextStyle(fontSize: 14, color: Colors.black),
                              ),
                              const SizedBox(width: 5),
                              Icon(Icons.help_outline, size: 20, color: Colors.black),
                            ],
                          ),
                        ),


                        SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => R1()),
                            );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF1748F8),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Text(
                              'Click to Register',
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
      ),
    );
  }


  Widget _buildLabeledDropdownField1(String label, String fieldName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Colors.white), // Adjusted to match TextField
        ),
        const SizedBox(height: 4), // Reduced from 5 to match TextField spacing
        Container(
          height: 40, // Fixed height for consistency
          child: DropdownButtonFormField<String>(
            value: _selectedCategory,
            onChanged: (newValue) {
              setState(() {
                _selectedCategory= newValue;
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
            items: category.map((String title) {
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

  Widget _buildLabeledDropdownField2(String label, String fieldName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Colors.white), // Adjusted to match TextField
        ),
        const SizedBox(height: 4), // Reduced from 5 to match TextField spacing
        Container(
          height: 40, // Fixed height for consistency
          child: DropdownButtonFormField<String>(
            value: _selectedRole,
            onChanged: (newValue) {
              setState(() {
                _selectedRole= newValue;
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
            items: role.map((String title) {
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

  Widget _buildLabeledTextField3(String label, String field) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label for the field
        Text(
          label,
          style: TextStyle(
            fontSize: 14, // Adjusted font size to match TextFormField
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4), // Adjusted space to match the TextFormField style
        Container(
          height: 40, // Fixed height for consistency
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonFormField<String>(
            value: _formData[field], // Add this to your form data
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
            isExpanded: true,  // Ensures the dropdown takes up full width
            items: countriesList.map((String country) {
              return DropdownMenuItem<String>(
                value: country,
                child: Text(
                  country,
                  style: TextStyle(fontSize: 14), // Adjust text size for the dropdown
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _formData[field] = newValue;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a country';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }


  Widget _buildLabeledTextField2(String label, String fieldName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Colors.white),
        ),
        const SizedBox(height: 4),
        Container(
          height: 40,
          child: TextFormField(
            controller: controllers[fieldName], // Changed from field to fieldName
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12.0,
              ),
              isDense: true,
            ),
            style: const TextStyle(fontSize: 14),
            keyboardType: _getKeyboardType(fieldName),
            inputFormatters: _getInputFormatters(fieldName),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return '$label is required';
              }

              switch (fieldName) {
                case 'usernameEmail':
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  break;

                case 'phone':
                  String cleanedNumber = value.replaceAll(RegExp(r'[^0-9]'), '');
                  if (cleanedNumber.length != 10) {
                    return 'Phone number must be exactly 10 digits';
                  }
                  if (!cleanedNumber.startsWith(RegExp(r'[6-9]'))) {
                    return 'Phone number must start with 6, 7, 8, or 9';
                  }
                  break;

                case 'telephone':
                  if (!RegExp(r'^[0-9]{10}$').hasMatch(value.replaceAll(RegExp(r'[^0-9]'), ''))) {
                    return 'Telephone number must be 10 digits';
                  }
                  break;

                case 'pincode':
                  if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
                    return 'Pin Code must be exactly 6 digits';
                  }
                  break;

                case 'password':
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  break;

                case 'confirmPassword':
                  if (value != controllers['password']?.text) {
                    return 'Passwords do not match';
                  }
                  break;
              }

              return null;
            },
          ),
        ),
      ],
    );
  }

// Helper method to determine keyboard type
  TextInputType _getKeyboardType(String fieldName) {
    switch (fieldName) {
      case 'pincode':
      case 'phone':
      case 'telephone':
        return TextInputType.number;
      case 'usernameEmail':
        return TextInputType.emailAddress;
      default:
        return TextInputType.text;
    }
  }

// Helper method to get input formatters
  List<TextInputFormatter> _getInputFormatters(String fieldName) {
    switch (fieldName) {
      case 'pincode':
        return [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(6),
        ];
      case 'phone':
      case 'telephone':
        return [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10),
        ];
      default:
        return [];
    }
  }
}