import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aecci/views/drawer/custom_drawer.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';  // for encoding data to JSON
import 'package:aecci/services/api_service.dart';
import 'package:aecci/views/login_view.dart';



class R2 extends StatefulWidget {
  @override
  _ProfileUpdateScreenState createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<R2> {
  final _personalFormKey = GlobalKey<FormState>();
  final _addressFormKey = GlobalKey<FormState>();
  String? _selectedTitle; // Selected title for dropdown-
  Map<String, dynamic> _formData = {};
  Map<String, dynamic> _formData1 = {};
  List<String> industriesList = [
    "Export Consultant",
    "Organic products",
    "Agriculture and forestry",
    "Livestock and fish",
    "Food",
    "Agricultural and forestry machinery and equipment",
    "Beverages",
    "Food, drink, tobacco and catering industry machinery and equipment",
    "Chemical base materials",
    "Plastic products",
    "Chemical products",
    "Chemical industry plant and equipment",
    "Rubber and plastic industry plant and equipment",
    "Health, medical and pharmaceutical",
    "Rubber products",
    "Furniture and linen",
    "Metal constructions for the building industry",
    "Heating, ventilation, air conditioning (HVAC) and refrigeration equipment",
    "Metal pipework, valves and containers",
    "Security equipment",
    "Hardware, ironmongery, cutlery and tools",
    "Timber, wooden products, machinery and equipment for the woodworking industry",
    "Building industry",
    "Civil engineering and building machinery and equipment",
    "Civil and marine engineering contractors",
    "Energy, fuel and water",
    "Environmental services, renewable energies",
    "Oil and gas industry plant and equipment",
    "Education and training",
    "Banking Sector",
    "International organisations, administrations and associations",
    "Social care, personal services",
    "Research and testing",
    "Information technology (IT) and Internet",
    "Technical offices and engineering consultancies, architects",
    "Courier services, telecommunications, radio and television",
    "Hospitality, tourism, hotel and catering industries",
    "Leisure, culture and entertainment",
    "Sports and leisure equipment",
    "Measuring and testing equipment",
    "Services to businesses",
    "Sourcing Agent",
    "Intending Agent",
    "Merchant Exporters",
    "Wholesale & Retail Traders",
    "Hire and rental services",
    "Hygiene and cleaning",
    "Financial and insurance services",
    "Charitable/Social Organisations",
    "Textile, clothing, leather, and shoemaking machinery and equipment",
    "Leathers, furs, and their products",
    "Clothing and footwear",
    "Textiles",
    "Precious stoneworking, watchmaking, and jewellery",
    "Transportation and logistics services",
    "Handling and storage plant and equipment",
    "Packaging machinery, equipment",
    "Electronic equipment",
    "Telecommunications equipment",
    "Electrical equipment",
    "Nuclear equipment",
    "Optical, photographic, and cinematographic equipment",
    "Industrial subcontractors",
    "Basic metal products",
    "Engines and mechanical parts",
    "Machinery and equipment for metalworking",
    "General traders, department and retail stores",
    "Paper and board making plant and equipment",
    "Printing and publishing",
    "Printing equipment",
    "Office and shop equipment",
    "Paper and board",
    "Glass, cement, and ceramics",
    "Quarried stone",
    "Mining, quarrying, and stoneworking plant and equipment",
    "Building industry",
    "Ores and minerals",
    "Accounting",
    "Airlines/Aviation",
    "Alternative Dispute Resolution",
    "Alternative Medicine",
    "Animation",
    "Apparel & Fashion",
    "Architecture & Planning",
    "Arts & Crafts",
    "Automotive",
    "Aviation & Aerospace",
    "Banking",
    "Biotechnology",
    "Broadcast Media",
    "Building Materials",
    "Business Supplies & Equipment",
    "Capital Markets",
    "Chemicals",
    "Civic & Social Organization",
    "Civil Engineering",
    "Commercial Real Estate",
    "Computer & Network Security",
    "Computer Games",
    "Computer Hardware",
    "Computer Networking",
    "Computer Software",
    "Construction",
    "Consumer Electronics",
    "Consumer Goods",
    "Consumer Services",
    "Cosmetics",
    "Dairy",
    "Defense & Space",
    "Design",
    "Education Management",
    "E-learning",
    "Electrical & Electronic Manufacturing",
    "Entertainment",
    "Environmental Services",
    "Events Services",
    "Executive Office",
    "Facilities Services",
    "Farming",
    "Financial Services",
    "Fine Art",
    "Fishery",
    "Food & Beverages",
    "Food Production",
    "Fundraising",
    "Furniture",
    "Gambling & Casinos",
    "Glass, Ceramics & Concrete",
    "Government Administration",
    "Government Relations",
    "Graphic Design",
    "Health, Wellness & Fitness",
    "Higher Education",
    "Hospital & Health Care",
    "Hospitality",
    "Human Resources",
    "Import & Export",
    "Individual & Family Services",
    "Industrial Automation",
    "Information Services",
    "Information Technology & Services",
    "Insurance",
    "International Affairs",
    "International Trade & Development",
    "Internet",
    "Investment Banking/Venture",
    "Investment Management",
    "Judiciary",
    "Law Enforcement",
    "Law Practice",
    "Legal Services",
    "Legislative Office",
    "Leisure & Travel",
    "Libraries",
    "Logistics & Supply Chain",
    "Luxury Goods & Jewelry",
    "Machinery",
    "Management Consulting",
    "Maritime",
    "Marketing & Advertising",
    "Market Research",
    "Mechanical or Industrial Engineering",
    "Media Production",
    "Medical Device",
    "Medical Practice",
    "Mental Health Care",
    "Military",
    "Mining & Metals",
    "Motion Pictures & Film",
    "Museums & Institutions",
    "Music",
    "Nanotechnology",
    "Newspapers",
    "Nonprofit Organization Management",
    "Oil & Energy",
    "Online Publishing",
    "Outsourcing/Offshoring",
    "Package/Freight Delivery",
    "Packaging & Containers",
    "Paper & Forest Products",
    "Performing Arts",
    "Pharmaceuticals",
    "Philanthropy",
    "Photography",
    "Plastics",
    "Political Organization",
    "Primary/Secondary",
    "Printing",
    "Professional Training",
    "Program Development",
    "Public Policy",
    "Public Relations",
    "Public Safety",
    "Publishing",
    "Railroad Manufacture",
    "Ranching",
    "Real Estate",
    "Recreational",
    "Facilities & Services",
    "Religious Institutions",
    "Renewables & Environment",
    "Research",
    "Restaurants",
    "Retail",
    "Security & Investigations",
    "Semiconductors",
    "Shipbuilding",
    "Sporting Goods",
    "Sports",
    "Staffing & Recruiting",
    "Supermarkets",
    "Telecommunications",
    "Textiles",
    "Think Tanks",
    "Tobacco",
    "Translation & Localization",
    "Transportation/Trucking/Railroad",
    "Utilities",
    "Venture Capital",
    "Veterinary",
    "Warehousing",
    "Wholesale",
    "Wine & Spirits",
    "Wireless",
    "Writing & Editing",
    "Other",
  ];
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
    'Gov'
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

  void _resetForm() {
    controllers.forEach((_, controller) => controller.clear());
    setState(() {
      selectedProfessionalCategory = null;
    });
  }

  String? apiErrorMessage;

  Future<void> _handleRegistration() async {
    if (_personalFormKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        // Ensure phone number is clean and converted to integer
        String phoneNumber = controllers['phone']?.text.replaceAll(
            RegExp(r'[^0-9]'), '') ?? '';
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
          'pinCode': int.tryParse(controllers['pincode']?.text.trim() ?? '0') ??
              0,
          'phoneNo': int.parse(phoneNumber),
          'telephoneNo': controllers['telephone']?.text.trim() ?? '',
          // 'businessCategory': _selectedCategory ?? '',

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


  @override
  void dispose() {
    controllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _formData = {
      'country': null, // Initialize country as null
    };
    _formData1 = {
      'industry': null, // Initialize country as null
    };
  }


  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      _formData = {
        'country': null, // Initialize country as null
      };
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // First Card: Personal Details
              Card(
                elevation: 2, // Added elevation for better visibility
                color: Color(0xFF021C43),
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
                          '* indicates required fields',
                          style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: _buildLabeledDropdownField(
                                  'TITLE *', 'title'),
                            ),
                            const SizedBox(width: 10), // Reduced spacing
                            Expanded(
                              child: _buildLabeledTextField2(
                                  'FIRST NAME *', 'firstName'),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildLabeledTextField2(
                                  'Last Name *', 'lastName'),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: _buildLabeledTextField2(
                                  'Company Name *', 'companyName'),
                            ),
                            const SizedBox(width: 10), // Reduced spacing
                            Expanded(
                              child: _buildLabeledTextField2(
                                  'Email *', 'email'),
                            ),

                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: _buildLabeledTextField2(
                                  'Password *', 'password'),
                            ),
                            const SizedBox(width: 10), // Reduced spacing
                            Expanded(
                              child: _buildLabeledTextField2(
                                  'Confirm Password *', 'confirmPassword'),
                            ),

                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: _buildLabeledTextField4(
                                  'Select Your Industry*',
                                  'selectYourIndustry'),
                            ),
                            const SizedBox(width: 10), // Reduced spacing
                            Expanded(
                              child: _buildLabeledTextField2(
                                  'Confirm Password *', 'confirmPassword'),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: _buildLabeledTextField2(
                                  'IFSC CODE/CIN NO. *', 'ifscCode'),
                            ),
                            const SizedBox(width: 10), // Reduced spacing
                            Expanded(
                              child: _buildLabeledTextField2(
                                  'Gst No. *', 'gstNo'),
                            ),

                          ],
                        ),
                        SizedBox(height: 5),
                        _buildLabeledTextField2('Address 1 *', 'address'),
                        SizedBox(height: 8),

                        Row(
                          children: [
                            Expanded(
                              child: _buildLabeledTextField2(
                                  'Address 2 *', 'address2'),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildLabeledTextField3(
                                  'Country *', 'country'),
                            ), // Reduced spacing
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [

                            Expanded(
                              child: _buildLabeledTextField2('City*', 'city'),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildLabeledTextField2(
                                  'State *', 'state'),
                            ), // Reduced spacing
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildLabeledTextField2(
                                  'Pin Code*', 'pinCode'),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity, // Same width for consistency
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
                              'Next',
                              style: TextStyle(
                                fontSize: 16,
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

  // Dropdown widget for the TITLE field
  Widget _buildLabeledDropdownField(String label, String fieldName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white), // Adjusted to match TextField
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
              fillColor: Colors.grey[200],
              // Light grey background
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
                  style: TextStyle(
                      color: Colors.black), // Consistent with TextField
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


  Widget _buildLabeledTextField4(String label, String field) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label for the field
        Text(
          label,
          style: TextStyle(
              fontSize: 14, // Adjusted font size to match TextFormField
              fontWeight: FontWeight.w500,
              color: Colors.white
          ),
        ),
        const SizedBox(height: 4),
        // Adjusted space to match the TextFormField style
        Container(
          height: 40, // Fixed height for consistency
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonFormField<String>(
            value: _formData1[field],
            // Add this to your form data
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              // Light grey background
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
            isExpanded: true,
            // Ensures the dropdown takes up full width
            items: industriesList.map((String industry) {
              return DropdownMenuItem<String>(
                value: industry,
                child: Text(
                  industry,
                  style: TextStyle(
                      fontSize: 14), // Adjust text size for the dropdown
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _formData1[field] = newValue;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a industry';
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
