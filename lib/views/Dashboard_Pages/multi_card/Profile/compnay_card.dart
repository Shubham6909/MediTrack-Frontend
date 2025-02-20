import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../drawer/services/commercial_directory.dart';

class CompnayCard extends StatefulWidget {
  final Map<String, dynamic> loginData;
  final Map<String, dynamic> getData;
  final Map<String, dynamic> token;

  const CompnayCard({
    required this.loginData,
    required this.getData,
    required this.token,
    Key? key,
  }) : super(key: key);

  @override
  _CompnayCardScreenState createState() => _CompnayCardScreenState();
}

class _CompnayCardScreenState extends State<CompnayCard> {
  // Dates
  DateTime? createdAt;
  DateTime? approvedAt;
  DateTime? fullyReviewedAt;

  String? memberShipNo;
  String? email;
  String? companyName;
  String? balance;

  // New fields
  String? companyLogo;
  String? ownersName;
  int? establishmentYear;
  String? companyAdd;
  int? mobileNo;
  String? companyProduct;
  String? companyActivity;

  bool isExpanded = false;


  Map<String, dynamic>? companyDirData;
  bool isLoading = true;
  String? error;
  final ScrollController _scrollController = ScrollController();
  late Timer _timer;

  final _personalFormKey = GlobalKey<FormState>();
  final _addressFormKey = GlobalKey<FormState>();
  final _companyFromkey = GlobalKey<FormState>();
  bool _isLoading = false;

  // Controllers for text fields
  late TextEditingController companyNameController;
  late TextEditingController employeesController;
  late TextEditingController businessCategoryController;
  late TextEditingController sourceController;
  late TextEditingController telephoneController;
  late TextEditingController emailController;
  late TextEditingController websiteController;
  late TextEditingController address1Controller;
  late TextEditingController address2Controller;
  late TextEditingController cityController;
  late TextEditingController countryController;
  late TextEditingController stateController;
  late TextEditingController pinCodeController;
  late TextEditingController bankNameController;
  late TextEditingController accountNoController;
  late TextEditingController ifscCodeController;
  late TextEditingController selectMembershipController;
  late TextEditingController inputNumberController;
  late TextEditingController gstNoController;
  late TextEditingController chamberBenefitsController;
  late TextEditingController titleController;
  late TextEditingController firstNameController;
  late TextEditingController surNameController;
  late TextEditingController roleController;
  late TextEditingController phoneNoController;
  late TextEditingController accountStatusController;
  late TextEditingController balanceController;
  late TextEditingController memberShipNoController;
  late TextEditingController membershipCertificateController;
  late TextEditingController validUpToController;

  void _showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }


  @override
  void initState() {
    print("Login Data: ${widget.loginData}"); // Debugging
    print("Login Data: ${widget.getData}"); // Debugging

    // ✅ Ensure loginData exists and has the 'info' field
    if (widget.loginData != null && widget.loginData!.containsKey('info') && widget.loginData!['info'] != null) {
      final info = widget.loginData!['info'] as Map<String, dynamic>;

      balance = info['balance']?.toString() ?? 'N/A';
      email = info['email']?.toString() ?? 'N/A';
      companyName = info['companyName']?.toString() ?? 'N/A';

      // Membership Details
      memberShipNo = info['memberShipNo']?.toString() ?? 'N/A';


    // Fetch data from getData
    if (widget.getData != null && widget.getData!.containsKey('data') && widget.getData!['data'] != null) {
      final data = widget.getData!['data'] as Map<String, dynamic>;

      companyName = data['companyName']?.toString() ?? 'N/A';
      companyLogo = data['companyLogo']?.toString() ?? 'N/A';
      ownersName = data['ownersName']?.toString() ?? 'N/A';
      email = data['email']?.toString() ?? 'N/A';
      establishmentYear = data['establishmentYear'] ?? 'N/A';
      companyAdd = data['companyAdd']?.toString() ?? 'N/A';
      mobileNo = data['mobileNo'] ?? 'N/A';
      companyProduct = data['companyProduct']?.toString() ?? 'N/A';
      companyActivity = data['companyActivity']?.toString() ?? 'N/A';
    } else {
      print("Error: getData or 'data' field is missing.");
    }

    setState(() {
      isLoading = false;
    });

    void startAutoScroll() {
      const double scrollSpeed = 80.0; // Increased pixels per frame
      const int frameDuration = 8; // Frame duration in milliseconds
      _timer = Timer.periodic(Duration(milliseconds: frameDuration), (timer) {
        if (_scrollController.hasClients) {
          final maxScrollExtent = _scrollController.position.maxScrollExtent;
          final currentScrollPosition = _scrollController.position.pixels;
          final newScrollPosition = currentScrollPosition + scrollSpeed;

          if (newScrollPosition >= maxScrollExtent) {
            _scrollController.jumpTo(0.0);
          } else {
            _scrollController.animateTo(
              newScrollPosition,
              duration: Duration(milliseconds: frameDuration),
              curve: Curves.decelerate, // Smooth stop effect
            );
          }
        }
      });
    }

    startAutoScroll();
  }
    super.initState();
    initializeControllers();
    fetchCompanyDetails();
  }

  String formatDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat('dd MMM yyyy').format(parsedDate);
    } catch (e) {
      return date;
    }
  }

  void initializeControllers() {
    companyNameController = TextEditingController();
    employeesController = TextEditingController();
    businessCategoryController = TextEditingController();
    sourceController = TextEditingController();
    telephoneController = TextEditingController();
    emailController = TextEditingController();
    websiteController = TextEditingController();
    address1Controller = TextEditingController();
    address2Controller = TextEditingController();
    cityController = TextEditingController();
    countryController = TextEditingController();
    stateController = TextEditingController();
    pinCodeController = TextEditingController();
    bankNameController = TextEditingController();
    accountNoController = TextEditingController();
    ifscCodeController = TextEditingController();
    selectMembershipController = TextEditingController();
    inputNumberController = TextEditingController();
    gstNoController = TextEditingController();
    chamberBenefitsController = TextEditingController();
    titleController = TextEditingController();
    firstNameController = TextEditingController();
    surNameController = TextEditingController();
    roleController = TextEditingController();
    phoneNoController = TextEditingController();
    accountStatusController = TextEditingController();
    balanceController = TextEditingController();
    memberShipNoController = TextEditingController();
    membershipCertificateController = TextEditingController();
    validUpToController = TextEditingController();
  }

  Future<void> fetchCompanyDetails() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);

    final userId = widget.loginData['userId'] ?? widget.loginData['info']?['_id']?.toString();
    if (userId == null) {
      _showMessage('Error: User ID not found');
      setState(() => _isLoading = false);
      return;
    }

    final token = widget.loginData['token'] ?? widget.loginData['data']?['token'];
    if (token == null) {
      _showMessage('Error: Authentication token not found');
      setState(() => _isLoading = false);
      return;
    }

    final url = 'https://e-platapi.aecci.org.in/getCompanyDetails/$userId';
    print('Fetching data from: $url');

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (!mounted) return;

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'];
        setState(() {
          companyNameController.text = data['companyName'] ?? '';
          employeesController.text = data['numberOfEmployees']?.toString() ?? '';
          businessCategoryController.text = data['businessCategory'] ?? '';
          sourceController.text = data['howDidYouKnowAboutUs'] ?? '';
          telephoneController.text = data['telephoneNo'] ?? '';
          emailController.text = data['email'] ?? '';
          websiteController.text = data['websiteAdd'] ?? '';
          address1Controller.text = data['address1'] ?? '';
          address2Controller.text = data['address2'] ?? '';
          cityController.text = data['city'] ?? '';
          countryController.text = data['country'] ?? '';
          stateController.text = data['state'] ?? '';
          pinCodeController.text = data['pinCode'] ?? '';
          bankNameController.text = data['registeredBank'] ?? '';
          accountNoController.text = data['registeredAccountNo'] ?? '';
          ifscCodeController.text = data['IFSCCode'] ?? '';
          selectMembershipController.text = data['selectMembership'] ?? '';
          inputNumberController.text = data['inputNumber'] ?? '';
          gstNoController.text = data['gstNo'] ?? '';
          chamberBenefitsController.text = data['chamberBenefits'] ?? '';
          titleController.text = data['title'] ?? '';
          firstNameController.text = data['firstName'] ?? '';
          surNameController.text = data['surName'] ?? '';
          roleController.text = data['role'] ?? '';
          phoneNoController.text = data['phoneNo']?.toString() ?? '';
          accountStatusController.text = data['accountStatus'] ?? '';
          balanceController.text = data['balance']?.toString() ?? '';
          memberShipNoController.text = data['memberShipNo'] ?? '';
          membershipCertificateController.text = data['membershipCertificate'] ?? '';
          validUpToController.text = data['validUpTo'] ?? '';
        });
      } else {
        final errorData = json.decode(response.body);
        _showMessage('Error: ${errorData['message'] ?? 'Failed to fetch company details'}');
      }
    } catch (e) {
      print('Error fetching company details: $e');
      _showMessage('Failed to fetch company details. Please try again.');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    companyNameController.dispose();
    employeesController.dispose();
    businessCategoryController.dispose();
    sourceController.dispose();
    telephoneController.dispose();
    emailController.dispose();
    websiteController.dispose();
    address1Controller.dispose();
    address2Controller.dispose();
    cityController.dispose();
    countryController.dispose();
    stateController.dispose();
    pinCodeController.dispose();
    bankNameController.dispose();
    accountNoController.dispose();
    ifscCodeController.dispose();
    selectMembershipController.dispose();
    inputNumberController.dispose();
    gstNoController.dispose();
    chamberBenefitsController.dispose();
    titleController.dispose();
    firstNameController.dispose();
    surNameController.dispose();
    roleController.dispose();
    phoneNoController.dispose();
    accountStatusController.dispose();
    balanceController.dispose();
    memberShipNoController.dispose();
    membershipCertificateController.dispose();
    validUpToController.dispose();
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }


  Widget _buildInfoRow(String label, String value, {IconData? icon, VoidCallback? onTap}) {
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
                  style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
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



  Widget _buildLabeledTextField(
      String label,
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
              // fillColor: Colors.white,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Company Overview',
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 340,
                      maxHeight: 654,
                    ),
                    child: Card(
                      // color: const Color(0xFF4A3FBC),
                      color: Color(0xFF1748F8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Text(
                                //   '$companyName',
                                //   style: const TextStyle(
                                //       fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                // ),
                                Text(
                                  companyName != null && companyName!.length > 30
                                      ? '${companyName!.substring(0, 30)}..'
                                      : companyName ?? 'Company Name',
                                  style: const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.edit, color: Colors.white),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => CommercialDirectoryScreen(loginData: widget.loginData)),
                                    );
                                  },
                                ),
                              ],
                            ),
                            Text(
                              memberShipNo != null && memberShipNo!.length > 30
                                  ? '${memberShipNo!.substring(0, 30)}..'
                                  : memberShipNo ?? 'memberShipNo',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            // const SizedBox(height: 16.0),
                            // Container(
                            //   width: double.infinity, // Full width
                            //   height: 50, // Adjust height as per UI
                            //   decoration: BoxDecoration(
                            //     gradient: LinearGradient(
                            //       colors: [Color(0xFF3A3DFF), Color(0xFF6A6DFF)], // Adjust gradient to match UI
                            //       begin: Alignment.topLeft,
                            //       end: Alignment.bottomRight,
                            //     ),
                            //     borderRadius: BorderRadius.circular(12.0), // Smooth rounded corners
                            //   ),
                            //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       const Text(
                            //         'Available balance',
                            //         style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
                            //       ),
                            //       Row(
                            //         children: [
                            //           Text(
                            //             '₹$balance.00', // Dynamic Balance here
                            //             style: const TextStyle(
                            //               fontSize: 16,
                            //               fontWeight: FontWeight.bold,
                            //               color: Colors.white,
                            //             ),
                            //           ),
                            //           const SizedBox(width: 8),
                            //           const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
                            //         ],
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            const SizedBox(height: 12.0),
                            if (isExpanded) ...[
                              // const Divider(color: Colors.white54),
                              // _buildInfoRow("Owner's Name", "$ownersName"),
                              _buildInfoRow("Owner Name", ownersName ?? 'N/A'),
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
                              // _buildInfoRow("Established", "$establishmentYear"),
                              // _buildInfoRow("Company Address", "$companyAdd"),
                              _buildInfoRow("Established", establishmentYear?.toString() ?? 'N/A'),
                              _buildInfoRow("Company Address", companyAdd ?? 'N/A'),
                              _buildInfoRow(
                                "Company Mobile No",
                                mobileNo?.toString() ?? 'N/A',
                                icon: Icons.copy,
                                onTap: () {
                                  Clipboard.setData(ClipboardData(text: mobileNo?.toString() ?? ''));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Mobile copied to clipboard')),
                                  );
                                },
                              ),
                              _buildInfoRow("Company Product", companyProduct ?? 'N/A'),
                              _buildInfoRow("Company Activity", companyActivity ?? 'N/A'),
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
                                      style: const TextStyle(
                                          color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                    Icon(
                                      isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
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
            ),
            const SizedBox(height: 10),
            // Company Details Card
            Card(
              color: Colors.white,
              elevation: 2,
              margin: EdgeInsets.only(bottom: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _personalFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Company Details',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      _buildLabeledTextField(
                        'Company Name',
                        companyNameController,
                        isRequired: true,
                      ),
                      SizedBox(height: 12),
                      _buildLabeledTextField(
                        'Number of Employees',
                        employeesController,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 12),
                      _buildLabeledTextField(
                        'Business Category',
                        businessCategoryController,
                      ),
                      SizedBox(height: 12),
                      _buildLabeledTextField(
                        'Where did you hear about us?',
                        sourceController,
                      ),
                      SizedBox(height: 12),
                      _buildLabeledTextField(
                        'Telephone No.',
                        telephoneController,
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 12),
                      _buildLabeledTextField(
                        'COMPANY E-Mail',
                        emailController,
                        isRequired: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          if (!value.contains('@') || !value.contains('.')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 12),
                      _buildLabeledTextField(
                        'Website',
                        websiteController,
                      ),

                    ],
                  ),
                ),
              ),
            ),

            // Address Card
            Card(
              color: Colors.white,
              elevation: 2,
              margin: EdgeInsets.only(bottom: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _addressFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Company Address',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      _buildLabeledTextField(
                        'Address Line 1',
                        address1Controller,
                        isRequired: true,
                      ),
                      SizedBox(height: 12),
                      _buildLabeledTextField(
                        'Address Line 2',
                        address2Controller,
                      ),
                      SizedBox(height: 12),
                      _buildLabeledTextField(
                        'City',
                        cityController,
                        isRequired: true,
                      ),
                      SizedBox(height: 12),
                      _buildLabeledTextField(
                        'Country',
                        countryController,
                        isRequired: true,
                      ),
                      SizedBox(height: 12),
                      _buildLabeledTextField(
                        'State',
                        stateController,
                        isRequired: true,
                      ),
                      SizedBox(height: 12),
                      _buildLabeledTextField(
                        'PIN Code',
                        pinCodeController,
                        isRequired: true,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'PIN Code is required';
                          }
                          if (value.length != 6) {
                            return 'PIN Code must be 6 digits';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Bank Details Card
            Card(
              color: Colors.white,
              elevation: 2,
              margin: EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _companyFromkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bank Details',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      _buildLabeledTextField(
                        'Bank Name',
                        bankNameController,
                      ),
                      SizedBox(height: 12),
                      _buildLabeledTextField(
                        'Account Number',
                        accountNoController,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 12),
                      _buildLabeledTextField(
                        'IFSC Code',
                        ifscCodeController,
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            if (!RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$').hasMatch(value)) {
                              return 'Please enter a valid IFSC code';
                            }
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          // onPressed: _isLoading ? null : _updateCompanyDetails,
                          onPressed: () {
                            // Your update logic here
                          },
                          style: ElevatedButton.styleFrom(
                            // backgroundColor: Colors.green,
                            // backgroundColor: Color(0xFF001F8E),
                            backgroundColor: Color(0xFF1748F8),
                            padding: EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            disabledBackgroundColor: Colors.grey,
                          ),
                          child: _isLoading
                              ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                              : Text(
                            'Update Details',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

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
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
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

  // Widget _buildInfoRow(String label, String value) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 4.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(label, style: const TextStyle(fontSize: 14, color: Colors.white)),
  //         const SizedBox(width: 8),
  //         Flexible(
  //           child: Text(
  //             value.isNotEmpty ? value : '-',
  //             style: const TextStyle(fontSize: 14, color: Colors.white70),
  //             overflow: TextOverflow.ellipsis,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

