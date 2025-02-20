import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PersonalCard extends StatefulWidget {
  final Map<String, dynamic> loginData;
  final Map<String, dynamic> getData;
  final Map<String, dynamic> token;

  const PersonalCard({
    required this.loginData,
    required this.getData,
    required this.token,
    Key? key,
  }) : super(key: key);

  @override
  _PersonalCardScreenState createState() => _PersonalCardScreenState();
}

class _PersonalCardScreenState extends State<PersonalCard> {
  bool showBalance = false; // Add this line
  // Existing variables
  String? firstName;
  String? balance;
  String? validUpTo;
  String? email;
  String? companyName;
  String? ownersName;
  int? establishmentYear;
  String? companyAdd;
  int? mobileNo;
  String? companyProduct;
  String? companyActivity;
  String? memberShipNo;
  bool isExpanded = false;

  // Form data
  String? gstNo;
  String? selectMembership;
  String? membershipType;
  String? inputNumber;
  int? numberOfEmployees;
  String? websiteAdd;
  String? address1;
  String? address2;
  String? city;
  String? country;
  String? state;
  String? pinCode;
  String? businessCategory;
  String? title;
  String? surName;
  String? role;
  String? telephoneNo;
  int? phoneNo;
  String? registeredBank;
  String? registeredAccountNo;
  String? IFSCCode;
  String? accountStatus;
  bool? isApproved;
  bool? isExisting;
  String? companyLogo;
  String? reqType;

  final _personalFormKey = GlobalKey<FormState>();
  final _addressFormKey = GlobalKey<FormState>();
  String? _selectedTitle;
  bool isLoading = true;
  bool isPersonalInfo = false;

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

  // Define the missing controllers
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _address1Controller = TextEditingController();
  final TextEditingController _address2Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    if (widget.loginData != null && widget.loginData.containsKey('info')) {
      final info = widget.loginData['info'] as Map<String, dynamic>;
      _loadLoginData(info);
    }

    if (widget.getData != null && widget.getData.containsKey('data')) {
      final data = widget.getData['data'] as Map<String, dynamic>;
      _loadGetData(data);
    }

    _initializeControllers();
    setState(() => isLoading = false);
  }

  void _loadLoginData(Map<String, dynamic> info) {
    gstNo = info['gstNo']?.toString();
    balance = info['balance']?.toString();
    email = info['email']?.toString();
    selectMembership = info['selectMembership']?.toString();
    reqType = info['reqType']?.toString();
    memberShipNo = info['memberShipNo']?.toString();
    validUpTo = info['validUpTo']?.toString();
    companyName = info['companyName']?.toString();
    membershipType = info['selectMembership']?.toString();
    inputNumber = info['inputNumber']?.toString();
    numberOfEmployees = info['numberOfEmployees'];
    websiteAdd = info['websiteAdd']?.toString();
    address1 = info['address1']?.toString();
    address2 = info['address2']?.toString();
    city = info['city']?.toString();
    country = info['country']?.toString();
    state = info['state']?.toString();
    pinCode = info['pinCode']?.toString();
    businessCategory = info['businessCategory']?.toString();

    String? receivedTitle = info['title']?.toString();
    _selectedTitle =
    titleOptions.contains(receivedTitle) ? receivedTitle : null;

    title = info['title']?.toString();
    firstName = info['firstName']?.toString();
    surName = info['surName']?.toString();
    role = info['role']?.toString();
    telephoneNo = info['telephoneNo']?.toString();
    phoneNo = info['phoneNo'];
  }

  void _loadGetData(Map<String, dynamic> data) {
    companyName = data['companyName']?.toString() ?? companyName;
    companyLogo = data['companyLogo']?.toString();
    ownersName = data['ownersName']?.toString();
    email = data['email']?.toString() ?? email;
    establishmentYear = data['establishmentYear'];
    companyAdd = data['companyAdd']?.toString();
    mobileNo = data['mobileNo'];
    companyProduct = data['companyProduct']?.toString();
    companyActivity = data['companyActivity']?.toString();
  }

  void _initializeControllers() {
    _titleController.text = title ?? '';
    _firstNameController.text = firstName ?? '';
    _surnameController.text = surName ?? '';
    _jobTitleController.text = role ?? '';
    _mobileController.text = phoneNo?.toString() ?? '';
    _emailController.text = email ?? '';
    _address1Controller.text = address1 ?? '';
    _address2Controller.text = address2 ?? '';
    _cityController.text = city ?? '';
    _countryController.text = country ?? '';
    _stateController.text = state ?? '';
    _pinCodeController.text = pinCode ?? '';
  }

  @override
  void dispose() {
    _titleController.dispose();
    _firstNameController.dispose();
    _surnameController.dispose();
    _jobTitleController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _address1Controller.dispose();
    _address2Controller.dispose();
    _cityController.dispose();
    _countryController.dispose();
    _stateController.dispose();
    _pinCodeController.dispose();
    super.dispose();
  }

  void _showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Widget _buildInfoRow(String label, String value,
      {IconData? icon, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          if (icon != null && onTap != null) // Show icon only if provided
            IconButton(
              icon: Icon(icon, color: Colors.white),
              onPressed: onTap,
            ),
        ],
      ),
    );
  }

  Widget _buildLabeledTextField(String label,
      TextEditingController controller, {
        bool isRequired = false,
        TextInputType? keyboardType,
        String? Function(String?)? validator,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isRequired ? '$label *' : label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          height: 40,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
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
            validator: validator ?? (isRequired ? (value) {
              if (value == null || value.isEmpty) {
                return '$label is required';
              }
              return null;
            } : null),
          ),
        ),
      ],
    );
  }

  Widget _buildCard({
    required String title,
    required GlobalKey<FormState> formKey,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      child: Card(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ...children,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabeledDropdownField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedTitle,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
          ),
          items: titleOptions.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                _selectedTitle = newValue;
                _titleController.text = newValue; // Correct assignment
              });
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a title';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildUpdateButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _handleUpdate,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1748F8),
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: const Text(
          'Update',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      return 'Please enter a valid 10-digit phone number';
    }
    return null;
  }

  String? _pinCodeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'PIN code is required';
    }
    if (!RegExp(r'^\d{6}$').hasMatch(value)) {
      return 'Please enter a valid 6-digit PIN code';
    }
    return null;
  }

  void _handleUpdate() {
    if (!_personalFormKey.currentState!.validate()) {
      return;
    }

    // TODO: Implement update logic here
    // You can access the form values using the controllers
    final updateData = {
      'title': _selectedTitle,
      'firstName': _firstNameController.text,
      'surname': _surnameController.text,
      'jobTitle': _jobTitleController.text,
      'mobileNo': _mobileController.text,
      'email': _emailController.text,
    };

    // Add your update logic here
  }

  Widget _buildGridOptionCard(IconData icon, String title, Color iconBackgroundColor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green),
            ),
            child: Icon(icon, size: 20, color: Colors.orange),
          ),
          SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to get the membership label
  // Helper method to get the membership label
  String _getMembershipLabel(String? selectMembership) {
    switch (selectMembership) {
      case 'Digital User':
        return 'AECCI Code No';
      case 'Collaboration':
        return 'Collaboration No';
      default:
        return 'Membership No';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Personal Overview',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 340,
                    maxHeight: 654,
                  ),
                  child: Card(
                    color: Color(0xFF1748F8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _getMembershipLabel(selectMembership),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.white),
                                onPressed: () {
                                  setState(() {
                                    isPersonalInfo = !isPersonalInfo;
                                  });
                                },
                              ),
                            ],
                          ),
                          Text(
                            memberShipNo != null && memberShipNo!.length > 30
                                ? '${memberShipNo!.substring(0, 30)}..'
                                : memberShipNo ?? 'memberShipNo',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Container(
                            width: double.infinity, // Full width
                            height: 50, // Adjust height as per UI
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF3A3DFF), Color(0xFF6A6DFF)], // Adjust gradient to match UI
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(12.0), // Smooth rounded corners
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Available balance',
                                  style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '₹$balance.01', // Dynamic Balance here
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          if (isExpanded) ...[
                            _buildInfoRow("Company Name", "$companyName"),
                            _buildInfoRow(
                              "Email",
                              email ?? 'N/A',
                              icon: Icons.copy,
                              onTap: () {
                                Clipboard.setData(ClipboardData(text: email ?? ''));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Email copied to clipboard')),
                                );
                              },
                            ),
                            _buildInfoRow("Valid Upto", "$validUpTo"),
                            const SizedBox(height: 12),
                          ],
                          Center(
                            child: TextButton(
                              onPressed: () => setState(() => isExpanded = !isExpanded),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    isExpanded ? "View Less Details" : "View More Details",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (isPersonalInfo) ...[
              const SizedBox(height: 16.0),
              _buildCard(
                title: 'Personal Information',
                formKey: _personalFormKey,
                children: [
                  _buildLabeledDropdownField('Title'),
                  const SizedBox(height: 12),
                  _buildLabeledTextField(
                    'First Name',
                    _firstNameController,
                    isRequired: true,
                  ),
                  const SizedBox(height: 12),
                  _buildLabeledTextField(
                    'Surname',
                    _surnameController,
                    isRequired: true,
                  ),
                  const SizedBox(height: 12),
                  _buildLabeledTextField(
                    'Job Title',
                    _jobTitleController,
                  ),
                  const SizedBox(height: 12),
                  _buildLabeledTextField(
                    'Mobile Number',
                    _mobileController,
                    isRequired: true,
                    keyboardType: TextInputType.phone,
                    validator: _phoneValidator,
                  ),
                  const SizedBox(height: 12),
                  _buildLabeledTextField(
                    'Email',
                    _emailController,
                    isRequired: true,
                    keyboardType: TextInputType.emailAddress,
                    validator: _emailValidator,
                  ),
                  const SizedBox(height: 16),
                  _buildUpdateButton(),
                ],
              ),
              const SizedBox(height: 16.0),
              _buildCard(
                title: 'Address Information',
                formKey: _addressFormKey,
                children: [
                  _buildLabeledTextField(
                    'Address Line 1',
                    _address1Controller,
                    isRequired: true,
                  ),
                  const SizedBox(height: 12),
                  _buildLabeledTextField(
                    'Address Line 2',
                    _address2Controller,
                  ),
                  const SizedBox(height: 12),
                  _buildLabeledTextField(
                    'City',
                    _cityController,
                    isRequired: true,
                  ),
                  const SizedBox(height: 12),
                  _buildLabeledTextField(
                    'Country',
                    _countryController,
                    isRequired: true,
                  ),
                  const SizedBox(height: 12),
                  _buildLabeledTextField(
                    'State',
                    _stateController,
                    isRequired: true,
                  ),
                  const SizedBox(height: 12),
                  _buildLabeledTextField(
                    'PIN Code',
                    _pinCodeController,
                    isRequired: true,
                    keyboardType: TextInputType.number,
                    validator: _pinCodeValidator,
                  ),
                  const SizedBox(height: 16),
                  _buildUpdateButton(),
                ],
              ),
            ],
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Quick.png',
                  height: 20,
                  width: 20,
                  color: Colors.blueAccent,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 8),
                Text(
                  "Quick Links",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1,
                children: [
                  _buildGridOptionCard(
                    Icons.domain_verification_outlined,
                    'E-Platform',
                    Colors.blueAccent.shade100,
                  ),
                  _buildGridOptionCard(
                    Icons.place_rounded,
                    'E-Verification',
                    Colors.deepOrange.shade400,
                  ),
                  _buildGridOptionCard(
                    Icons.card_membership_sharp,
                    'Membership',
                    Colors.green,
                  ),
                  _buildGridOptionCard(
                    Icons.announcement_rounded,
                    'Annual Report',
                    Colors.blueAccent.shade400,
                  ),
                  _buildGridOptionCard(
                    Icons.business_center_outlined,
                    'Innovation Index',
                    Colors.purple,
                  ),
                  _buildGridOptionCard(
                    Icons.info,
                    'Research & Info',
                    Colors.orange,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}





