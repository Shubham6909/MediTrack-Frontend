// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:aecci/views/drawer/custom_drawer.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';  // for encoding data to JSON
// import 'package:aecci/services/api_service.dart';
// import 'package:aecci/views/login_view.dart';
//
//
// class R1 extends StatefulWidget {
//   @override
//   _ProfileUpdateScreenState createState() => _ProfileUpdateScreenState();
// }
//
// class _ProfileUpdateScreenState extends State<R1> {
//   final _personalFormKey = GlobalKey<FormState>();
//   final _addressFormKey = GlobalKey<FormState>();
//   String? _selectedTitle;
//   String? _selectedCategory;
//   String? _selectedRole;
//
//
//   Map<String, dynamic> _formData = {};
//   List<String> countriesList = [
//     "Afghanistan",
//     "Albania",
//     "Algeria",
//     "Andorra",
//     "Angola",
//     "Antigua and Barbuda",
//     "Argentina",
//     "Armenia",
//     "Australia",
//     "Austria",
//     "Azerbaijan",
//     "Bahamas",
//     "Bahrain",
//     "Bangladesh",
//     "Barbados",
//     "Belarus",
//     "Belgium",
//     "Belize",
//     "Benin",
//     "Bhutan",
//     "Bolivia",
//     "Bosnia and Herzegovina",
//     "Botswana",
//     "Brazil",
//     "Brunei",
//     "Bulgaria",
//     "Burkina Faso",
//     "Burundi",
//     "Cabo Verde",
//     "Cambodia",
//     "Cameroon",
//     "Canada",
//     "Central African Republic",
//     "Chad",
//     "Chile",
//     "China",
//     "Colombia",
//     "Comoros",
//     "Congo, Democratic Republic of the",
//     "Congo, Republic of the",
//     "Costa Rica",
//     "Cote d'Ivoire",
//     "Croatia",
//     "Cuba",
//     "Cyprus",
//     "Czech Republic",
//     "Denmark",
//     "Djibouti",
//     "Dominica",
//     "Dominican Republic",
//     "East Timor (Timor-Leste)",
//     "Ecuador",
//     "Egypt",
//     "El Salvador",
//     "Equatorial Guinea",
//     "Eritrea",
//     "Estonia",
//     "Eswatini",
//     "Ethiopia",
//     "Fiji",
//     "Finland",
//     "France",
//     "Gabon",
//     "Gambia",
//     "Georgia",
//     "Germany",
//     "Ghana",
//     "Greece",
//     "Grenada",
//     "Guatemala",
//     "Guinea",
//     "Guinea-Bissau",
//     "Guyana",
//     "Haiti",
//     "Honduras",
//     "Hungary",
//     "Iceland",
//     "India",
//     "Indonesia",
//     "Iran",
//     "Iraq",
//     "Ireland",
//     "Israel",
//     "Italy",
//     "Jamaica",
//     "Japan",
//     "Jordan",
//     "Kazakhstan",
//     "Kenya",
//     "Kiribati",
//     "Korea, North",
//     "Korea, South",
//     "Kosovo",
//     "Kuwait",
//     "Kyrgyzstan",
//     "Laos",
//     "Latvia",
//     "Lebanon",
//     "Lesotho",
//     "Liberia",
//     "Libya",
//     "Liechtenstein",
//     "Lithuania",
//     "Luxembourg",
//     "Madagascar",
//     "Malawi",
//     "Malaysia",
//     "Maldives",
//     "Mali",
//     "Malta",
//     "Marshall Islands",
//     "Mauritania",
//     "Mauritius",
//     "Mexico",
//     "Micronesia",
//     "Moldova",
//     "Monaco",
//     "Mongolia",
//     "Montenegro",
//     "Morocco",
//     "Mozambique",
//     "Myanmar (Burma)",
//     "Namibia",
//     "Nauru",
//     "Nepal",
//     "Netherlands",
//     "New Zealand",
//     "Nicaragua",
//     "Niger",
//     "Nigeria",
//     "North Macedonia",
//     "Norway",
//     "Oman",
//     "Pakistan",
//     "Palau",
//     "Palestine",
//     "Panama",
//     "Papua New Guinea",
//     "Paraguay",
//     "Peru",
//     "Philippines",
//     "Poland",
//     "Portugal",
//     "Qatar",
//     "Romania",
//     "Russia",
//     "Rwanda",
//     "Saint Kitts and Nevis",
//     "Saint Lucia",
//     "Saint Vincent and the Grenadines",
//     "Samoa",
//     "San Marino",
//     "Sao Tome and Principe",
//     "Saudi Arabia",
//     "Senegal",
//     "Serbia",
//     "Seychelles",
//     "Sierra Leone",
//     "Singapore",
//     "Slovakia",
//     "Slovenia",
//     "Solomon Islands",
//     "Somalia",
//     "South Africa",
//     "South Sudan",
//     "Spain",
//     "Sri Lanka",
//     "Sudan",
//     "Suriname",
//     "Sweden",
//     "Switzerland",
//     "Syria",
//     "Taiwan",
//     "Tajikistan",
//     "Tanzania",
//     "Thailand",
//     "Togo",
//     "Tonga",
//     "Trinidad and Tobago",
//     "Tunisia",
//     "Turkey",
//     "Turkmenistan",
//     "Tuvalu",
//     "Uganda",
//     "Ukraine",
//     "United Arab Emirates",
//     "United Kingdom",
//     "United States",
//     "Uruguay",
//     "Uzbekistan",
//     "Vanuatu",
//     "Vatican City",
//     "Venezuela",
//     "Vietnam",
//     "Yemen",
//     "Zambia",
//     "Zimbabwe",
//   ];
//   final List<String> titleOptions = [
//     'Mr',
//     'Mrs',
//     'Ms',
//     'Dr',
//     'Prof',
//     'Shri',
//     'Smt',
//     'Hon',
//     'Gov',
//     'Rep',
//     'Amb'
//   ];
//   final List<String> category = [
//     'Mentor',
//     'Lawyer',
//     'Accountant',
//     'Arbitrator Center',
//     'New Market Consultant',
//     'Financial Advisor',
//     'ADR Professional',
//     'Chartered Accountant',
//     'Company Secretory',
//     'Export Adviser',
//     'Commercial Adviser',
//     'Innovation Adviser',
//     'Digital Service Specialist',
//     'Marketing Specialist',
//     'Other'
//   ];
//   final List<String> role = [
//     'Administrations/Finance Department',
//     'Arbitrator',
//     'Practicing Lawyer',
//     'Senior Advocate',
//     'justice',
//     'judge',
//     'Board of Directors',
//     'Exports/Import Department',
//     'General Management',
//     'HR Department',
//     'IT Department',
//     'R&D Department',
//     'Sales Department',
//     'Export Manager'
//   ];
//
//   final ApiService _apiService = ApiService();
//   bool _isLoading = false;
//   final Map<String, TextEditingController> controllers = {
//     'usernameEmail': TextEditingController(),
//     'password': TextEditingController(),
//     'confirmPassword': TextEditingController(),
//     'compnayOrgName': TextEditingController(),
//     'firstName': TextEditingController(),
//     'lastName': TextEditingController(),
//     'address': TextEditingController(),
//     'address2': TextEditingController(),
//     'country': TextEditingController(),
//     'city': TextEditingController(),
//     'state': TextEditingController(),
//     'pincode': TextEditingController(),
//     'phone': TextEditingController(),
//     'telephone': TextEditingController(),
//     'registrationNo': TextEditingController(),
//     'aecciCollaborationNo': TextEditingController(),
//   };
//
//   String? selectedProfessionalCategory;
//   String? selectedRole;
//
//   void _resetForm() {
//     controllers.forEach((_, controller) => controller.clear());
//     setState(() {
//       selectedProfessionalCategory = null;
//       selectedRole = null;
//     });
//   }
//
//   String? apiErrorMessage;
//
//   Future<void> _handleRegistration() async {
//     if (_personalFormKey.currentState!.validate()) {
//       setState(() => _isLoading = true);
//
//       try {
//         // Ensure phone number is clean and converted to integer
//         String phoneNumber = controllers['phone']?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? '';
//         if (phoneNumber.isEmpty || phoneNumber == '0') {
//           throw Exception('Please enter a valid phone number');
//         }
//
//         final payload = {
//           'email': controllers['usernameEmail']?.text.trim() ?? '',
//           'password': controllers['password']?.text ?? '',
//           'companyName': controllers['compnayOrgName']?.text.trim() ?? '',
//           'firstName': controllers['firstName']?.text.trim() ?? '',
//           'surName': controllers['lastName']?.text.trim() ?? '',
//           'address1': controllers['address']?.text.trim() ?? '',
//           'address2': controllers['address2']?.text.trim() ?? '',
//           'country': _formData['country'] ?? '',
//           'city': controllers['city']?.text.trim() ?? '',
//           'state': controllers['state']?.text.trim() ?? '',
//           'pinCode': int.tryParse(controllers['pincode']?.text.trim() ?? '0') ?? 0,
//           'phoneNo': int.parse(phoneNumber),
//           'telephoneNo': controllers['telephone']?.text.trim() ?? '',
//           'businessCategory': _selectedCategory ?? '',
//           'role': _selectedRole ?? '',
//           'isExisting': true,
//           'isTrial': false,
//           'reqType': "collaborationReq",
//           'selectMembership': "Collaboration",
//           'inputNumber': controllers['registrationNo']?.text.trim() ?? '',
//           'gstNo': "27XGFTH9012N7Z2",
//         };
//
//         print('Sending payload: ${json.encode(payload)}');
//
//         final response = await _apiService.createClient(payload);
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Registration successful!')),
//         );
//
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => LoginScreen()),
//         );
//
//         _resetForm();
//       } catch (e) {
//         print('Registration Error: $e'); // Detailed error logging
//
//         String errorMessage = 'Registration failed';
//         if (e.toString().contains('phoneNo is required')) {
//           errorMessage = 'Please enter a valid phone number';
//         }
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(errorMessage),
//             backgroundColor: Colors.red,
//           ),
//         );
//       } finally {
//         setState(() => _isLoading = false);
//       }
//     }
//   }
//
// // Add reset functionality for dropdowns
//
//
//   @override
//   void dispose() {
//     controllers.forEach((_, controller) => controller.dispose());
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //  drawer: CustomDrawer(context: context),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               icon: const Icon(
//                 Icons.arrow_back_ios_new,
//                 color: Colors.black,
//                 size: 30,
//               ),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             );
//           },
//         ),
//         title: Image.asset(
//           'assets/images/aecci4.png',
//           height: 50,
//           fit: BoxFit.contain,
//         ),
//
//       ),
//
//       body: Padding(
//         padding: EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Card(
//                 color: Color(0xFF021C43),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(12.0), // Reduced padding
//                   child: Form(
//                     key: _personalFormKey, // Changed to unique key
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           'fill all fields as per AECCI records',
//                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
//                         ),
//                         SizedBox(height: 5),
//                         _buildLabeledTextField2('Username(email) *', 'usernameEmail'),
//                         SizedBox(height: 10),
//                         Row(
//                           children: [
//
//                             Expanded(
//                               child: _buildLabeledTextField2('Password *', 'password'),
//                             ),
//                             const SizedBox(width: 10), // Reduced spacing
//                             Expanded(
//                               child: _buildLabeledTextField2('Confirm Password *', 'confirmPassword'),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 8),
//                         _buildLabeledTextField2('Company / Organization Name *', 'compnayOrgName'),
//                         SizedBox(height: 8),
//                         Row(
//                           children: [
//
//                             Expanded(
//                               child: _buildLabeledTextField2('First Name *', 'firstName'),
//                             ),
//                             const SizedBox(width: 10), // Reduced spacing
//                             Expanded(
//                               child: _buildLabeledTextField2('Last Name *', 'lastName'),
//                             ),
//                             const SizedBox(width: 10),
//
//                           ],
//                         ),
//                         SizedBox(height: 8),
//                         _buildLabeledDropdownField1('Professional Category', 'professionalCategory'),
//                         SizedBox(height: 8),
//                         _buildLabeledDropdownField2('Role *', 'role'),
//                         SizedBox(height: 8),
//                         _buildLabeledTextField2('Address 1 *', 'address'),
//                         SizedBox(height: 8),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: _buildLabeledTextField2('Address 2 *', 'address2'),
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: _buildLabeledTextField3('Country *', 'country'),
//                             ),// Reduced spacing
//                           ],
//                         ),
//                         SizedBox(height: 8),
//                         Row(
//                           children: [
//
//                             Expanded(
//                               child: _buildLabeledTextField2('City*', 'city'),
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: _buildLabeledTextField2('State *', 'state'),
//                             ),// Reduced spacing
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: _buildLabeledTextField2('Pin Code*', 'pincode'),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 8),
//                         Row(
//                           children: [
//
//                             Expanded(
//                               child: _buildLabeledTextField2('Phone *', 'phone'),
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: _buildLabeledTextField2('Telephone *', 'telephone'),
//                             ),// Reduced spacing
//                           ],
//                         ),
//                         SizedBox(height: 8),
//                         _buildLabeledTextField2('Registration No. *', 'registrationNo'),
//                         SizedBox(height: 8),
//                         _buildLabeledTextField2('AECCI Collbaration No. *', 'aecciCollaborationNo'),
//                         SizedBox(height: 8),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             SizedBox(
//                               width: 130, // You can adjust the width of each button
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   // Handle Reset functionality
//                                   print("Reset button clicked");
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.green, // Red color for Reset
//                                   padding: EdgeInsets.symmetric(vertical: 6),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8.0),
//                                   ),
//                                 ),
//                                 child: Text(
//                                   'Reset',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 16), // Space between buttons
//                             SizedBox(
//                               width: 130, // Same width for consistency
//                               child: ElevatedButton(
//                                 onPressed: _isLoading ? null : () {
//                                   // Handle Register functionality
//                                   print("Register button clicked");
//                                   _handleRegistration();
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.green, // Green color for Register
//                                   padding: EdgeInsets.symmetric(vertical: 6),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8.0),
//                                   ),
//                                 ),
//                                 child: _isLoading
//                                     ? CircularProgressIndicator(color: Colors.white)
//                                     : Text(
//                                   'Register',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   Widget _buildLabeledDropdownField1(String label, String fieldName) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Colors.white), // Adjusted to match TextField
//         ),
//         const SizedBox(height: 4), // Reduced from 5 to match TextField spacing
//         Container(
//           height: 40, // Fixed height for consistency
//           child: DropdownButtonFormField<String>(
//             value: _selectedCategory,
//             onChanged: (newValue) {
//               setState(() {
//                 _selectedCategory= newValue;
//               });
//             },
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.grey[200], // Light grey background
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//                 borderSide: BorderSide.none,
//               ),
//               contentPadding: const EdgeInsets.symmetric(
//                 vertical: 6.0, // Padding similar to TextField
//                 horizontal: 10.0, // Padding consistent with TextField
//               ),
//               isDense: true, // Makes the dropdown more compact
//             ),
//             style: const TextStyle(
//               fontSize: 14, // Matching font size for the dropdown
//               color: Colors.black, // Default text color for better visibility
//             ),
//             items: category.map((String title) {
//               return DropdownMenuItem<String>(
//                 value: title,
//                 child: Text(
//                   title,
//                   style: TextStyle(color: Colors.black), // Consistent with TextField
//                 ),
//               );
//             }).toList(),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return '$label is required';
//               }
//               return null;
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildLabeledDropdownField2(String label, String fieldName) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Colors.white), // Adjusted to match TextField
//         ),
//         const SizedBox(height: 4), // Reduced from 5 to match TextField spacing
//         Container(
//           height: 40, // Fixed height for consistency
//           child: DropdownButtonFormField<String>(
//             value: _selectedRole,
//             onChanged: (newValue) {
//               setState(() {
//                 _selectedRole= newValue;
//               });
//             },
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.grey[200], // Light grey background
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//                 borderSide: BorderSide.none,
//               ),
//               contentPadding: const EdgeInsets.symmetric(
//                 vertical: 6.0, // Padding similar to TextField
//                 horizontal: 10.0, // Padding consistent with TextField
//               ),
//               isDense: true, // Makes the dropdown more compact
//             ),
//             style: const TextStyle(
//               fontSize: 14, // Matching font size for the dropdown
//               color: Colors.black, // Default text color for better visibility
//             ),
//             items: role.map((String title) {
//               return DropdownMenuItem<String>(
//                 value: title,
//                 child: Text(
//                   title,
//                   style: TextStyle(color: Colors.black), // Consistent with TextField
//                 ),
//               );
//             }).toList(),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return '$label is required';
//               }
//               return null;
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   // Dropdown widget for the TITLE field
//   Widget _buildLabeledDropdownField(String label, String fieldName) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500), // Adjusted to match TextField
//         ),
//         const SizedBox(height: 4), // Reduced from 5 to match TextField spacing
//         Container(
//           height: 40, // Fixed height for consistency
//           child: DropdownButtonFormField<String>(
//             value: _selectedTitle,
//             onChanged: (newValue) {
//               setState(() {
//                 _selectedTitle = newValue;
//               });
//             },
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.grey[200], // Light grey background
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//                 borderSide: BorderSide.none,
//               ),
//               contentPadding: const EdgeInsets.symmetric(
//                 vertical: 6.0, // Padding similar to TextField
//                 horizontal: 10.0, // Padding consistent with TextField
//               ),
//               isDense: true, // Makes the dropdown more compact
//             ),
//             style: const TextStyle(
//               fontSize: 14, // Matching font size for the dropdown
//               color: Colors.black, // Default text color for better visibility
//             ),
//             items: titleOptions.map((String title) {
//               return DropdownMenuItem<String>(
//                 value: title,
//                 child: Text(
//                   title,
//                   style: TextStyle(color: Colors.black), // Consistent with TextField
//                 ),
//               );
//             }).toList(),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return '$label is required';
//               }
//               return null;
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildLabeledTextField3(String label, String field) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Label for the field
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 14, // Adjusted font size to match TextFormField
//             fontWeight: FontWeight.w500,
//             color: Colors.white,
//           ),
//         ),
//         const SizedBox(height: 4), // Adjusted space to match the TextFormField style
//         Container(
//           height: 40, // Fixed height for consistency
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: DropdownButtonFormField<String>(
//             value: _formData[field], // Add this to your form data
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.grey[200], // Light grey background
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//                 borderSide: BorderSide.none,
//               ),
//               contentPadding: const EdgeInsets.symmetric(
//                 vertical: 6.0, // Padding similar to TextField
//                 horizontal: 10.0, // Padding consistent with TextField
//               ),
//               isDense: true, // Makes the dropdown more compact
//             ),
//             isExpanded: true,  // Ensures the dropdown takes up full width
//             items: countriesList.map((String country) {
//               return DropdownMenuItem<String>(
//                 value: country,
//                 child: Text(
//                   country,
//                   style: TextStyle(fontSize: 14), // Adjust text size for the dropdown
//                 ),
//               );
//             }).toList(),
//             onChanged: (String? newValue) {
//               setState(() {
//                 _formData[field] = newValue;
//               });
//             },
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please select a country';
//               }
//               return null;
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//
//   Widget _buildLabeledTextField2(String label, String fieldName) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Colors.white),
//         ),
//         const SizedBox(height: 4),
//         Container(
//           height: 40,
//           child: TextFormField(
//             controller: controllers[fieldName], // Changed from field to fieldName
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.grey[200],
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//                 borderSide: BorderSide.none,
//               ),
//               contentPadding: const EdgeInsets.symmetric(
//                 vertical: 8.0,
//                 horizontal: 12.0,
//               ),
//               isDense: true,
//             ),
//             style: const TextStyle(fontSize: 14),
//             keyboardType: _getKeyboardType(fieldName),
//             inputFormatters: _getInputFormatters(fieldName),
//             validator: (value) {
//               if (value == null || value.trim().isEmpty) {
//                 return '$label is required';
//               }
//
//               switch (fieldName) {
//                 case 'usernameEmail':
//                   if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
//                     return 'Please enter a valid email';
//                   }
//                   break;
//
//                 case 'phone':
//                   String cleanedNumber = value.replaceAll(RegExp(r'[^0-9]'), '');
//                   if (cleanedNumber.length != 10) {
//                     return 'Phone number must be exactly 10 digits';
//                   }
//                   if (!cleanedNumber.startsWith(RegExp(r'[6-9]'))) {
//                     return 'Phone number must start with 6, 7, 8, or 9';
//                   }
//                   break;
//
//                 case 'telephone':
//                   if (!RegExp(r'^[0-9]{10}$').hasMatch(value.replaceAll(RegExp(r'[^0-9]'), ''))) {
//                     return 'Telephone number must be 10 digits';
//                   }
//                   break;
//
//                 case 'pincode':
//                   if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
//                     return 'Pin Code must be exactly 6 digits';
//                   }
//                   break;
//
//                 case 'password':
//                   if (value.length < 6) {
//                     return 'Password must be at least 6 characters';
//                   }
//                   break;
//
//                 case 'confirmPassword':
//                   if (value != controllers['password']?.text) {
//                     return 'Passwords do not match';
//                   }
//                   break;
//               }
//
//               return null;
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
// // Helper method to determine keyboard type
//   TextInputType _getKeyboardType(String fieldName) {
//     switch (fieldName) {
//       case 'pincode':
//       case 'phone':
//       case 'telephone':
//         return TextInputType.number;
//       case 'usernameEmail':
//         return TextInputType.emailAddress;
//       default:
//         return TextInputType.text;
//     }
//   }
//
// // Helper method to get input formatters
//   List<TextInputFormatter> _getInputFormatters(String fieldName) {
//     switch (fieldName) {
//       case 'pincode':
//         return [
//           FilteringTextInputFormatter.digitsOnly,
//           LengthLimitingTextInputFormatter(6),
//         ];
//       case 'phone':
//       case 'telephone':
//         return [
//           FilteringTextInputFormatter.digitsOnly,
//           LengthLimitingTextInputFormatter(10),
//         ];
//       default:
//         return [];
//     }
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:aecci/views/drawer/custom_drawer.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';  // for encoding data to JSON
// import 'package:aecci/services/api_service.dart';
// import 'package:aecci/views/login_view.dart';
//
//
// class R1 extends StatefulWidget {
//   @override
//   _ProfileUpdateScreenState createState() => _ProfileUpdateScreenState();
// }
//
// class _ProfileUpdateScreenState extends State<R1> {
//   final _personalFormKey = GlobalKey<FormState>();
//   final _addressFormKey = GlobalKey<FormState>();
//   String? _selectedTitle;
//   String? _selectedCategory;
//   String? _selectedRole;
//
//
//   Map<String, dynamic> _formData = {};
//   List<String> countriesList = [
//     "Afghanistan",
//     "Albania",
//     "Algeria",
//     "Andorra",
//     "Angola",
//     "Antigua and Barbuda",
//     "Argentina",
//     "Armenia",
//     "Australia",
//     "Austria",
//     "Azerbaijan",
//     "Bahamas",
//     "Bahrain",
//     "Bangladesh",
//     "Barbados",
//     "Belarus",
//     "Belgium",
//     "Belize",
//     "Benin",
//     "Bhutan",
//     "Bolivia",
//     "Bosnia and Herzegovina",
//     "Botswana",
//     "Brazil",
//     "Brunei",
//     "Bulgaria",
//     "Burkina Faso",
//     "Burundi",
//     "Cabo Verde",
//     "Cambodia",
//     "Cameroon",
//     "Canada",
//     "Central African Republic",
//     "Chad",
//     "Chile",
//     "China",
//     "Colombia",
//     "Comoros",
//     "Congo, Democratic Republic of the",
//     "Congo, Republic of the",
//     "Costa Rica",
//     "Cote d'Ivoire",
//     "Croatia",
//     "Cuba",
//     "Cyprus",
//     "Czech Republic",
//     "Denmark",
//     "Djibouti",
//     "Dominica",
//     "Dominican Republic",
//     "East Timor (Timor-Leste)",
//     "Ecuador",
//     "Egypt",
//     "El Salvador",
//     "Equatorial Guinea",
//     "Eritrea",
//     "Estonia",
//     "Eswatini",
//     "Ethiopia",
//     "Fiji",
//     "Finland",
//     "France",
//     "Gabon",
//     "Gambia",
//     "Georgia",
//     "Germany",
//     "Ghana",
//     "Greece",
//     "Grenada",
//     "Guatemala",
//     "Guinea",
//     "Guinea-Bissau",
//     "Guyana",
//     "Haiti",
//     "Honduras",
//     "Hungary",
//     "Iceland",
//     "India",
//     "Indonesia",
//     "Iran",
//     "Iraq",
//     "Ireland",
//     "Israel",
//     "Italy",
//     "Jamaica",
//     "Japan",
//     "Jordan",
//     "Kazakhstan",
//     "Kenya",
//     "Kiribati",
//     "Korea, North",
//     "Korea, South",
//     "Kosovo",
//     "Kuwait",
//     "Kyrgyzstan",
//     "Laos",
//     "Latvia",
//     "Lebanon",
//     "Lesotho",
//     "Liberia",
//     "Libya",
//     "Liechtenstein",
//     "Lithuania",
//     "Luxembourg",
//     "Madagascar",
//     "Malawi",
//     "Malaysia",
//     "Maldives",
//     "Mali",
//     "Malta",
//     "Marshall Islands",
//     "Mauritania",
//     "Mauritius",
//     "Mexico",
//     "Micronesia",
//     "Moldova",
//     "Monaco",
//     "Mongolia",
//     "Montenegro",
//     "Morocco",
//     "Mozambique",
//     "Myanmar (Burma)",
//     "Namibia",
//     "Nauru",
//     "Nepal",
//     "Netherlands",
//     "New Zealand",
//     "Nicaragua",
//     "Niger",
//     "Nigeria",
//     "North Macedonia",
//     "Norway",
//     "Oman",
//     "Pakistan",
//     "Palau",
//     "Palestine",
//     "Panama",
//     "Papua New Guinea",
//     "Paraguay",
//     "Peru",
//     "Philippines",
//     "Poland",
//     "Portugal",
//     "Qatar",
//     "Romania",
//     "Russia",
//     "Rwanda",
//     "Saint Kitts and Nevis",
//     "Saint Lucia",
//     "Saint Vincent and the Grenadines",
//     "Samoa",
//     "San Marino",
//     "Sao Tome and Principe",
//     "Saudi Arabia",
//     "Senegal",
//     "Serbia",
//     "Seychelles",
//     "Sierra Leone",
//     "Singapore",
//     "Slovakia",
//     "Slovenia",
//     "Solomon Islands",
//     "Somalia",
//     "South Africa",
//     "South Sudan",
//     "Spain",
//     "Sri Lanka",
//     "Sudan",
//     "Suriname",
//     "Sweden",
//     "Switzerland",
//     "Syria",
//     "Taiwan",
//     "Tajikistan",
//     "Tanzania",
//     "Thailand",
//     "Togo",
//     "Tonga",
//     "Trinidad and Tobago",
//     "Tunisia",
//     "Turkey",
//     "Turkmenistan",
//     "Tuvalu",
//     "Uganda",
//     "Ukraine",
//     "United Arab Emirates",
//     "United Kingdom",
//     "United States",
//     "Uruguay",
//     "Uzbekistan",
//     "Vanuatu",
//     "Vatican City",
//     "Venezuela",
//     "Vietnam",
//     "Yemen",
//     "Zambia",
//     "Zimbabwe",
//   ];
//   final List<String> titleOptions = [
//     'Mr',
//     'Mrs',
//     'Ms',
//     'Dr',
//     'Prof',
//     'Shri',
//     'Smt',
//     'Hon',
//     'Gov',
//     'Rep',
//     'Amb'
//   ];
//   final List<String> category = [
//     'Mentor',
//     'Lawyer',
//     'Accountant',
//     'Arbitrator Center',
//     'New Market Consultant',
//     'Financial Advisor',
//     'ADR Professional',
//     'Chartered Accountant',
//     'Company Secretory',
//     'Export Adviser',
//     'Commercial Adviser',
//     'Innovation Adviser',
//     'Digital Service Specialist',
//     'Marketing Specialist',
//     'Other'
//   ];
//   final List<String> role = [
//     'Administrations/Finance Department',
//     'Arbitrator',
//     'Practicing Lawyer',
//     'Senior Advocate',
//     'justice',
//     'judge',
//     'Board of Directors',
//     'Exports/Import Department',
//     'General Management',
//     'HR Department',
//     'IT Department',
//     'R&D Department',
//     'Sales Department',
//     'Export Manager'
//   ];
//
//   final ApiService _apiService = ApiService();
//   bool _isLoading = false;
//   final Map<String, TextEditingController> controllers = {
//     'usernameEmail': TextEditingController(),
//     'password': TextEditingController(),
//     'confirmPassword': TextEditingController(),
//     'compnayOrgName': TextEditingController(),
//     'firstName': TextEditingController(),
//     'lastName': TextEditingController(),
//     'address': TextEditingController(),
//     'address2': TextEditingController(),
//     'country': TextEditingController(),
//     'city': TextEditingController(),
//     'state': TextEditingController(),
//     'pincode': TextEditingController(),
//     'phone': TextEditingController(),
//     'telephone': TextEditingController(),
//     'registrationNo': TextEditingController(),
//     'aecciCollaborationNo': TextEditingController(),
//   };
//
//   String? selectedProfessionalCategory;
//   String? selectedRole;
//
//   void _resetForm() {
//     controllers.forEach((_, controller) => controller.clear());
//     setState(() {
//       selectedProfessionalCategory = null;
//       selectedRole = null;
//     });
//   }
//
//   String? apiErrorMessage;
//
//   Future<void> _handleRegistration() async {
//     if (_personalFormKey.currentState!.validate()) {
//       setState(() => _isLoading = true);
//
//       try {
//         // Fix phone number handling
//         String phoneNumber = controllers['mobileNo']?.text ?? ''; // Changed from 'phone' to 'mobileNo' to match your field name
//         phoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
//
//         if (phoneNumber.isEmpty) {
//           throw Exception('Please enter a valid phone number');
//         }
//
//         final payload = {
//           'email': controllers['usernameEmail']?.text.trim(),
//           'password': controllers['password']?.text,
//           'companyName': controllers['compnayOrgName']?.text.trim(),
//           'firstName': controllers['firstName']?.text.trim(),
//           'surName': controllers['lastName']?.text.trim(),
//           'address1': controllers['address']?.text.trim(),
//           'address2': controllers['address2']?.text.trim(),
//           'country': _formData['country'],
//           'city': controllers['city']?.text.trim(),
//           'state': controllers['state']?.text.trim(),
//           'pinCode': int.tryParse(controllers['pincode']?.text.trim() ?? '0'),
//           'phoneNo': int.parse(phoneNumber), // Convert to integer after cleaning
//           'telephoneNo': controllers['telephone']?.text.trim(),
//           'businessCategory': _selectedCategory,
//           'role': _selectedRole,
//           'isExisting': true,
//           'isTrial': false,
//           'reqType': "collaborationReq",
//           'selectMembership': "Collaboration",
//           'inputNumber': controllers['registrationNo']?.text.trim(),
//           'gstNo': "27XGFTH9012N7Z2",
//         };
//
//         print('Sending payload: ${json.encode(payload)}'); // Debug print
//
//         final response = await _apiService.createClient(payload);
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Registration successful!')),
//         );
//
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => LoginScreen()),
//         );
//
//         _resetForm();
//       } catch (e) {
//         print('Registration Error: $e'); // Debug print
//
//         String errorMessage = e.toString();
//         if (e.toString().contains('phone')) {
//           errorMessage = 'Please enter a valid phone number';
//         }
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(errorMessage),
//             backgroundColor: Colors.red,
//           ),
//         );
//       } finally {
//         setState(() => _isLoading = false);
//       }
//     }
//   }
//
//
//   @override
//   void dispose() {
//     controllers.forEach((_, controller) => controller.dispose());
//     super.dispose();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//        // leading: Icon(Icons.arrow_back, color: Colors.black),
//         backgroundColor: Colors.white,
//        // elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Form(
//           key: _personalFormKey,
//        child:  Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//              // const SizedBox(height: 20),
//               Center(
//                 child: Column(
//                   children: [
//                     Image.asset(
//                       'assets/images/aecci4.png',
//                       height: 60,
//                       fit: BoxFit.contain,// Adjust the size as needed
//                     ),
//
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 30),
//               const Text(
//                 "Personal Information",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Expanded(
//                     child: _buildLabeledTextField2("Username(email) *","userName"),
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: _buildLabeledTextField2("Password *","password"),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Expanded(
//                     child: _buildLabeledTextField2("Confirm Password *","confirmPassword"),
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: _buildLabeledTextField2("Company Name *","companyName"),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Expanded(
//                     child: _buildLabeledTextField2("First Name *","firstName"),
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: _buildLabeledTextField2("Last Name *","lastName"),
//                   ),
//
//                 ],
//               ),
//               SizedBox(height: 8),
//               _buildLabeledDropdownField1('Professional Category*', 'professionalCategory'),
//               const SizedBox(height: 16),
//               _buildLabeledDropdownField1('Role*', 'role'),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Expanded(
//                     child: _buildLabeledTextField2("Address 1 *","address1"),
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: _buildLabeledTextField2("Address 2 *","address2"),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Expanded(
//                     child: _buildLabeledTextField3("Country *", "country"),
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: _buildLabeledTextField2("City *","city"),
//                   ),
//                 ],
//
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Expanded(
//                     child: _buildLabeledTextField2("State *","state"),
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: _buildLabeledTextField2("Pincode *","pinCode"),
//                   ),
//                 ],
//
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Expanded(
//                     child: _buildLabeledTextField2("Mobile No. *","mobileNo"),
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: _buildLabeledTextField2("Telephone","telephone"),
//                   ),
//                 ],
//
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Expanded(
//                     child: _buildLabeledTextField2("Registration No *","registrationNumber"),
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: _buildLabeledTextField2("AECCI Collaboration No *","aecciCollaborationNo"),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   SizedBox(
//                     width: 130, // You can adjust the width of each button
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Handle Reset functionality
//                         print("Reset button clicked");
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.green, // Red color for Reset
//                         padding: EdgeInsets.symmetric(vertical: 6),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                       ),
//                       child: Text(
//                         'Reset',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 16), // Space between buttons
//                   SizedBox(
//                     width: 130, // Same width for consistency
//                     child: ElevatedButton(
//                       onPressed: _isLoading ? null : () {
//                         // Handle Register functionality
//                         print("Register button clicked");
//                         _handleRegistration();
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.green, // Green color for Register
//                         padding: EdgeInsets.symmetric(vertical: 6),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                       ),
//                       child: _isLoading
//                           ? CircularProgressIndicator(color: Colors.white)
//                           : Text(
//                         'Register',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 50),
//             ],
//           ),
//         ),
//         ),
//       ),
//     );
//   }
//
//
//
//
//   Widget _buildLabeledDropdownField1(String label, String fieldName) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
//         ),
//         const SizedBox(height: 4),
//         Container(
//           height: 40,
//           child: Expanded(
//             child: DropdownButtonFormField<String>(
//               value: _selectedCategory,
//               onChanged: (newValue) {
//                 setState(() {
//                   _selectedCategory = newValue;
//                 });
//               },
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                   borderSide: BorderSide(color: Colors.grey.shade400),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                   borderSide: BorderSide(color: Colors.grey.shade400, width: 1.2),
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(
//                   vertical: 4.0,
//                   horizontal: 8.0,
//                 ),
//               ),
//               style: const TextStyle(
//                 fontSize: 12,
//                 color: Colors.black,
//               ),
//               items: category.map((String title) {
//                 return DropdownMenuItem<String>(
//                   value: title,
//                   child: Text(
//                     title,
//                     style: const TextStyle(fontSize: 12, color: Colors.black),
//                   ),
//                 );
//               }).toList(),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return '$label is required';
//                 }
//                 return null;
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//
//   Widget _buildLabeledDropdownField2(String label, String fieldName) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal), // Smaller font size to match consistency
//         ),
//         const SizedBox(height: 4), // Reduced from 5 to match TextField spacing
//         Container(
//           height: 40, // Fixed height for consistency
//           child: DropdownButtonFormField<String>(
//             value: _selectedRole,
//             onChanged: (newValue) {
//               setState(() {
//                 _selectedRole = newValue;
//               });
//             },
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.white, // Light grey background
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0), // Slightly smaller border radius
//                 borderSide: BorderSide(color: Colors.grey.shade400),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//                 borderSide: BorderSide(color: Colors.grey.shade400, width: 1.2),
//               ),
//               contentPadding: const EdgeInsets.symmetric(
//                 vertical: 4.0, // Reduced padding to match the behavior of TextField
//                 horizontal: 8.0, // Padding consistent with TextField
//               ),
//               // Makes the dropdown more compact
//             ),
//             style: const TextStyle(
//               fontSize: 12, // Reduced dropdown item font size
//               color: Colors.black, // Default text color for better visibility
//             ),
//             items: role.map((String title) {
//               return DropdownMenuItem<String>(
//                 value: title,
//                 child: Text(
//                   title,
//                   style: const TextStyle(fontSize: 12, color: Colors.black), // Consistent with TextField
//                 ),
//               );
//             }).toList(),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return '$label is required';
//               }
//               return null;
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildLabeledDropdownField(String label, String fieldName) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal), // Smaller font size
//         ),
//         const SizedBox(height: 4), // Reduced from 5 to match TextField spacing
//         Container(
//           height: 40, // Fixed height for consistency
//           child: DropdownButtonFormField<String>(
//             value: _selectedTitle,
//             onChanged: (newValue) {
//               setState(() {
//                 _selectedTitle = newValue;
//               });
//             },
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.white, // Light grey background
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0), // Slightly smaller border radius
//                 borderSide: BorderSide(color: Colors.grey.shade400),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//                 borderSide: BorderSide(color: Colors.grey.shade400, width: 1.2),
//               ),
//               contentPadding: const EdgeInsets.symmetric(
//                 vertical: 4.0, // Reduced padding to match the behavior of TextField
//                 horizontal: 8.0, // Padding consistent with TextField
//               ),
//               // Makes the dropdown more compact
//             ),
//             style: const TextStyle(
//               fontSize: 12, // Reduced dropdown item font size
//               color: Colors.black, // Default text color for better visibility
//             ),
//             items: titleOptions.map((String title) {
//               return DropdownMenuItem<String>(
//                 value: title,
//                 child: Text(
//                   title,
//                   style: const TextStyle(fontSize: 12, color: Colors.black), // Consistent with TextField
//                 ),
//               );
//             }).toList(),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return '$label is required';
//               }
//               return null;
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//
//   Widget _buildLabeledTextField3(String label, String field) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Label for the field
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.normal,
//             // Removed the color: Colors.white property
//           ),
//         ),
//         const SizedBox(height: 4),
//         Container(
//           width: double.infinity,
//           height: 40,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: DropdownButtonFormField<String>(
//             // Rest of your existing code remains the same
//             value: _formData[field],
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.white,
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//                 borderSide: BorderSide(color: Colors.grey.shade400),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//                 borderSide: BorderSide(color: Colors.grey.shade400, width: 1.2),
//               ),
//               contentPadding: const EdgeInsets.symmetric(
//                 vertical: 4.0,
//                 horizontal: 8.0,
//               ),
//             ),
//             isExpanded: true,
//             items: countriesList.map((String country) {
//               return DropdownMenuItem<String>(
//                 value: country,
//                 child: Text(
//                   country,
//                   style: const TextStyle(
//                     fontSize: 12,
//                     color: Colors.black,
//                   ),
//                 ),
//               );
//             }).toList(),
//             onChanged: (String? newValue) {
//               setState(() {
//                 _formData[field] = newValue;
//               });
//             },
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please select a country';
//               }
//               return null;
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildLabeledTextField2(String label, String fieldName) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal), // Smaller font size
//         ),
//         const SizedBox(height: 4),
//         Container(
//           height: 40,
//           child: TextFormField(
//             controller: controllers[fieldName], // Changed from field to fieldName
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.white,
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0), // Slightly smaller border radius
//                 borderSide: BorderSide(color: Colors.grey.shade400),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//                 borderSide: BorderSide(color: Colors.grey.shade400, width: 1.2),
//               ),
//               contentPadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0), // Reduced padding
//
//             ),
//             style: const TextStyle(fontSize: 14),
//             keyboardType: _getKeyboardType(fieldName),
//             inputFormatters: _getInputFormatters(fieldName),
//             validator: (value) {
//               if (value == null || value.trim().isEmpty) {
//                 return '$label is required';
//               }
//
//               switch (fieldName) {
//                 case 'usernameEmail':
//                   if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
//                     return 'Please enter a valid email';
//                   }
//                   break;
//
//                 case 'phone':
//                   String cleanedNumber = value.replaceAll(RegExp(r'[^0-9]'), '');
//                   if (cleanedNumber.length != 10) {
//                     return 'Phone number must be exactly 10 digits';
//                   }
//                   if (!cleanedNumber.startsWith(RegExp(r'[6-9]'))) {
//                     return 'Phone number must start with 6, 7, 8, or 9';
//                   }
//                   break;
//
//                 case 'telephone':
//                   if (!RegExp(r'^[0-9]{10}$').hasMatch(value.replaceAll(RegExp(r'[^0-9]'), ''))) {
//                     return 'Telephone number must be 10 digits';
//                   }
//                   break;
//
//                 case 'pincode':
//                   if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
//                     return 'Pin Code must be exactly 6 digits';
//                   }
//                   break;
//
//                 case 'password':
//                   if (value.length < 6) {
//                     return 'Password must be at least 6 characters';
//                   }
//                   break;
//
//                 case 'confirmPassword':
//                   if (value != controllers['password']?.text) {
//                     return 'Passwords do not match';
//                   }
//                   break;
//               }
//
//               return null;
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//
// // Helper method to determine keyboard type
//   TextInputType _getKeyboardType(String fieldName) {
//     switch (fieldName) {
//       case 'pincode':
//       case 'phone':
//       case 'telephone':
//         return TextInputType.number;
//       case 'usernameEmail':
//         return TextInputType.emailAddress;
//       default:
//         return TextInputType.text;
//     }
//   }
//
// // Helper method to get input formatters
//   List<TextInputFormatter> _getInputFormatters(String fieldName) {
//     switch (fieldName) {
//       case 'pincode':
//         return [
//           FilteringTextInputFormatter.digitsOnly,
//           LengthLimitingTextInputFormatter(6),
//         ];
//       case 'phone':
//       case 'telephone':
//         return [
//           FilteringTextInputFormatter.digitsOnly,
//           LengthLimitingTextInputFormatter(10),
//         ];
//       default:
//         return [];
//     }
//   }
// }






import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aecci/views/drawer/custom_drawer.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';  // for encoding data to JSON
import 'package:aecci/services/api_service.dart';
import 'package:aecci/views/login_view.dart';



class R1 extends StatefulWidget {
  @override
  _ProfileUpdateScreenState createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<R1> {
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
    'companyName': TextEditingController(), // Fixed spelling from 'compnayOrgName'
    'firstName': TextEditingController(),
    'lastName': TextEditingController(),
    'address1': TextEditingController(),
    'address2': TextEditingController(),
    'country': TextEditingController(),
    'city': TextEditingController(),
    'state': TextEditingController(),
    'pinCode': TextEditingController(),
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
        // Debug prints to check controller values
        print('Debug: Checking email controller');
        print('usernameEmail controller: ${controllers['usernameEmail']}');
        print('usernameEmail value: ${controllers['usernameEmail']?.text}');

        // Check all form values
        controllers.forEach((key, controller) {
          print('Debug: $key value: ${controller.text}');
        });

        String? email = controllers['usernameEmail']?.text;
        String? registrationNumber = controllers['registrationNo']?.text;
        String? phoneNumber = controllers['phone']?.text;

        // Enhanced email validation with debug info
        if (email == null || email.trim().isEmpty) {
          print('Debug: Email validation failed - email is ${email == null ? "null" : "empty"}');
          throw Exception('Email is mandatory');
        } else {
          print('Debug: Email validation passed - email is: $email');
        }

        if (registrationNumber == null || registrationNumber.trim().isEmpty) {
          throw Exception('Registration number is mandatory');
        }

        if (phoneNumber == null || phoneNumber.isEmpty) {
          throw Exception('Phone number is required');
        }

        phoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

        if (phoneNumber.length != 10) {
          throw Exception('Phone number must be exactly 10 digits');
        }

        if (!phoneNumber.startsWith(RegExp(r'[6-9]'))) {
          throw Exception('Phone number must start with 6, 7, 8, or 9');
        }

        final payload = {
          'email': email.trim(),
          'password': controllers['password']?.text,
          'companyName': controllers['companyName']?.text?.trim(),
          'firstName': controllers['firstName']?.text?.trim(),
          'surName': controllers['lastName']?.text?.trim(),
          'address1': controllers['address1']?.text?.trim(),
          'address2': controllers['address2']?.text?.trim(),
          'country': _formData['country'],
          'city': controllers['city']?.text?.trim(),
          'state': controllers['state']?.text?.trim(),
          'pinCode': int.tryParse(controllers['pinCode']?.text?.trim() ?? '0'),
          'phoneNo': int.parse(phoneNumber ?? '0'),
          'telephoneNo': controllers['telephone']?.text?.trim(),
          'businessCategory': _selectedCategory,
          'role': _selectedRole,
          'isExisting': true,
          'isTrial': false,
          'reqType': "collaborationReq",
          'selectMembership': "Collaboration",
          'inputNumber': registrationNumber?.trim(),
          'gstNo': controllers['aecciCollaborationNo']?.text?.trim(),
        };
        // Print payload for debugging
        print('Debug: Final payload:');
        print(json.encode(payload));


        final response = await _apiService.createClient(payload);
        print('Debug: API Response received');
        print('Debug: Response: $response');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration successful!'), backgroundColor: Color(0xFF1748F8)),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );

        _resetForm();
      } catch (e) {
        print('Registration Error: $e');
        String errorMessage = e.toString().replaceAll('Exception: ', '');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
        );
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // Add this debug print to verify controller initialization
    print('Initializing phone controller: ${controllers['phone']}');
    print('Debug: usernameEmail controller initialization check: ${controllers['usernameEmail']?.hashCode}');
  }

  @override
  void dispose() {
    controllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back, color: Colors.black),
        backgroundColor: Colors.white,
        // elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _personalFormKey,
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/aecci6.png',
                        height: 60,
                        fit: BoxFit.contain,// Adjust the size as needed
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Personal Information",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildLabeledTextField2("Email Address *", "userName")
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildLabeledTextField2("Password *","password"),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildLabeledTextField2("Confirm Password *","confirmPassword"),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildLabeledTextField2("Company Name *", "companyName") // Instead of "compnayOrgName"
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildLabeledTextField2("First Name *","firstName"),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildLabeledTextField2("Last Name *","lastName"),
                    ),

                  ],
                ),
                SizedBox(height: 8),
                _buildLabeledDropdownField1('Professional Category*', 'professionalCategory'),
                const SizedBox(height: 16),
                _buildLabeledDropdownField1('Role*', 'role'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildLabeledTextField2("Address 1 *","address1"),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildLabeledTextField2("Address 2 *","address2"),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: _buildLabeledTextField3("Country *", "country"),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildLabeledTextField2("City *", "city"),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildLabeledTextField2("State *","state"),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildLabeledTextField2("Pincode *","pinCode"),
                    ),
                  ],

                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildLabeledTextField2("Mobile No. *","mobileNo"),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildLabeledTextField2("Telephone","telephone"),
                    ),
                  ],

                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildLabeledTextField2("Registration No *", "registrationNumber"),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildLabeledTextField2("AECCI Collaboration No *","aecciCollaborationNo"),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 130, // You can adjust the width of each button
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle Reset functionality
                          print("Reset button clicked");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF1748F8), // Red color for Reset
                          padding: EdgeInsets.symmetric(vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          'Reset',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16), // Space between buttons
                    SizedBox(
                      width: 130, // Same width for consistency
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : () {
                          // Handle Register functionality
                          print("Register button clicked");
                          _handleRegistration();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF1748F8), // Green color for Register
                          padding: EdgeInsets.symmetric(vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: _isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
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
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 4),
        Container(
          height: 40,
          child: DropdownButtonFormField<String>(
            value: fieldName == 'role' ? _selectedRole : _selectedCategory,
            onChanged: (newValue) {
              setState(() {
                if (fieldName == 'role') {
                  _selectedRole = newValue;
                } else {
                  _selectedCategory = newValue;
                }
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '$label is required';
              }
              return null;
            },
            items: (fieldName == 'role' ? role : category).map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
              );
            }).toList(),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.grey.shade400, width: 1.2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 8.0,
              ),
            ),
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
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal), // Smaller font size to match consistency
        ),
        const SizedBox(height: 4), // Reduced from 5 to match TextField spacing
        Container(
          height: 40, // Fixed height for consistency
          child: DropdownButtonFormField<String>(
            value: _selectedRole,
            onChanged: (newValue) {
              setState(() {
                _selectedRole = newValue;
              });
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white, // Light grey background
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0), // Slightly smaller border radius
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.grey.shade400, width: 1.2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 4.0, // Reduced padding to match the behavior of TextField
                horizontal: 8.0, // Padding consistent with TextField
              ),
              // Makes the dropdown more compact
            ),
            style: const TextStyle(
              fontSize: 12, // Reduced dropdown item font size
              color: Colors.black, // Default text color for better visibility
            ),
            items: role.map((String title) {
              return DropdownMenuItem<String>(
                value: title,
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 12, color: Colors.black), // Consistent with TextField
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

  Widget _buildLabeledDropdownField(String label, String fieldName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal), // Smaller font size
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
              fillColor: Colors.white, // Light grey background
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0), // Slightly smaller border radius
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.grey.shade400, width: 1.2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 4.0, // Reduced padding to match the behavior of TextField
                horizontal: 8.0, // Padding consistent with TextField
              ),
              // Makes the dropdown more compact
            ),
            style: const TextStyle(
              fontSize: 12, // Reduced dropdown item font size
              color: Colors.black, // Default text color for better visibility
            ),
            items: titleOptions.map((String title) {
              return DropdownMenuItem<String>(
                value: title,
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 12, color: Colors.black), // Consistent with TextField
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


    // Widget _buildLabeledTextField3(String label, String field) {
    //   return Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text(
    //         label,
    //         style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
    //       ),
    //       const SizedBox(height: 4),
    //       Container(
    //         width: double.infinity,
    //         height: 40,
    //         child: DropdownButtonFormField<String>(
    //           value: _formData[field],
    //           decoration: InputDecoration(
    //             filled: true,
    //             fillColor: Colors.white,
    //             enabledBorder: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(8.0),
    //               borderSide: BorderSide(color: Colors.grey.shade400),
    //             ),
    //             focusedBorder: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(8.0),
    //               borderSide: BorderSide(color: Colors.grey.shade400, width: 1.2),
    //             ),
    //             contentPadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
    //           ),
    //           items: countriesList.map((String country) {
    //             return DropdownMenuItem<String>(
    //               value: country,
    //               child: Text(country),
    //             );
    //           }).toList(),
    //           onChanged: (String? newValue) {
    //             setState(() {
    //               _formData[field] = newValue;
    //             });
    //           },
    //         ),
    //       ),
    //     ],
    //   );
    // }

  Widget _buildLabeledTextField3(String label, String field) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 4),
        SizedBox(  // Changed from Container to SizedBox
          height: 40,
          child: DropdownButtonFormField<String>(
            value: _formData[field],
            isExpanded: true,  // Add this to prevent overflow
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.grey.shade400, width: 1.2),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            ),
            items: countriesList.map((String country) {
              return DropdownMenuItem<String>(
                value: country,
                child: Text(
                  country,
                  overflow: TextOverflow.ellipsis,  // Add overflow handling
                  style: const TextStyle(fontSize: 14),  // Optional: adjust font size if needed
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _formData[field] = newValue;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLabeledTextField2(String label, String fieldName) {

      String controllerKey = fieldName;
      if (fieldName == 'mobileNo') {
        controllerKey = 'phone';
      } else if (fieldName == 'registrationNumber') {
        controllerKey = 'registrationNo';
      } else if (fieldName == 'userName') {  // Corrected to use '=='
        controllerKey = 'usernameEmail';
      }


      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 4),
          Container(
            height: 40,
            child: TextFormField(
              controller: controllers[controllerKey],
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.grey.shade400, width: 1.2),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
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

                case 'mobileNo': // Handle validation for mobile number
                  String cleanedNumber = value.replaceAll(RegExp(r'[^0-9]'), '');
                  if (cleanedNumber.length != 10) {
                    return 'Phone number must be exactly 10 digits';
                  }
                  if (!cleanedNumber.startsWith(RegExp(r'[6-9]'))) {
                    return 'Phone number must start with 6, 7, 8, or 9';
                  }
                  break;

                case 'telephone':
                  if (value.isNotEmpty && !RegExp(r'^[0-9]{10}$').hasMatch(value.replaceAll(RegExp(r'[^0-9]'), ''))) {
                    return 'Telephone number must be 10 digits';
                  }
                  break;

                case 'pinCode':
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

                case 'registrationNumber':
                  if (value.trim().isEmpty) {
                    return 'Registration number is mandatory';
                  }
                  // Additional validation for registration number format if needed
                  if (value.length < 4) {  // Example: minimum length check
                    return 'Registration number must be at least 4 characters';
                  }
                  if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {  // Only allow alphanumeric characters
                    return 'Registration number can only contain letters and numbers';
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
      case 'pinCode':
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
        return [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10),
        ];
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
