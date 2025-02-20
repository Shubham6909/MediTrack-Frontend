import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aecci/views/drawer/custom_drawer.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';  // for encoding data to JSON
import 'package:aecci/services/api_service.dart';
import 'package:aecci/views/login_view.dart';
import 'package:aecci/views/Sign_Up/r2.dart';




class B2BScreen1 extends StatefulWidget {
  @override
  _ProfileUpdateScreenState createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<B2BScreen1> {
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

  @override
  void initState() {
    super.initState();
    _formData = {
      'country': null,
    };
    _formData1 = {
      'industry': null,
    };
  }


  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      _formData = {
        'country': null,
      };
    }

    return Scaffold(
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
              SizedBox(height: 4),
              Card(

                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Form(
                    key: _addressFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Do you find this important but ‘too-costly’ to fly abroad for exploring business opportunities?',
                          style: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'AECCI ‘Virtual B2B Forum’ is back with an opportunity to meet global experts at the comfort of your business..',
                          style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Being your trade association, we understand the complexities of business, necessities to expand,'
                              ' and limitations to spend. To help you overcome such challenges, '
                              'we have collaborated with 30+ expert partners within the Asia '
                              'and Africa region from the prominent trade partner countries: '
                              'Germany, Nigeria, Vietnam, Cambodia, Oman, Brazil, Egypt, and many more.',
                          style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 14),
                        Text(
                          'With this, AECCI marks its presence in 30+ countries. '
                              'To make your global business journey an enriching experience, '
                              'we are bringing back the “Virtual Business Forum” with opportunities '
                              'to have “one-to-one 30-minute interaction sessions” with our '
                              'collaborative expert partners.',
                          style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Under the initiative, you can meet our collaborators from the listed countries.',
                          style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Prioritizing your trade requirements, we are keeping the B2B platform open and displaying the available collaborators along with their preferred meeting slots. By logging into the B2B platform, you can view and request appointments for your chosen countries.',
                          style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'The B2B initiative will support your business expansion and address all your concerns. We encourage you to explore the opportunities and seek advice on your trade queries, such as:',
                          style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        SizedBox(height: 14),
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
                                "Reaching new customers",
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
                                'Business expansion',
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
                                'Credibility checks of trade partners',
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
                                'Compliances and regulations in foreign lands',
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
                                'Product or brand registrations in the chosen country',
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
                                'Resolving commercial disputes',
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
                                'Seeking investment partners',
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
                                'Fulfilling IPR needs',
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
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'And other such issues',
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
                          'join us for the big initiative, and avail the opportunity to connect with the right source to reach to your potential market.',
                          style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'For more information, please contact:\nEmail: ed@aecci.org.in\nHandphone: +91-8433720996\nBoard Lines: +91-22-412 711 45 | 46 | 47',
                          style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => R2()),
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


  Widget _buildLabeledDropdownField(String label, String fieldName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14,
              fontWeight: FontWeight.w500,color: Colors.white), // Adjusted to match TextField
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
            value: _formData[field],
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
            items: countriesList.map((String country) {
              return DropdownMenuItem<String>(
                value: country,
                child: Text(
                  country,
                  style: TextStyle(
                      fontSize: 14), // Adjust text size for the dropdown
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
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Colors.white), // Increased from 12
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
            keyboardType: fieldName == 'pinCode'
                ? TextInputType.number // For Pin Code, make the keyboard numeric
                : TextInputType.text,
            inputFormatters: fieldName == 'pinCode'
                ? [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(6)] // Restrict to 6 digits
                : [],
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
              } else if (fieldName == 'pinCode') {
                if (value == null || value.isEmpty) {
                  return '$label is required';
                }
                // Ensure exactly 6 digits
                if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
                  return 'Pin Code must be exactly 6 digits';
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