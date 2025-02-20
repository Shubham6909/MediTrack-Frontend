import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aecci/views/drawer/custom_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CompanyDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> loginData;

  const CompanyDetailsScreen({
    required this.loginData,
    Key? key,
  }) : super(key: key);

  @override
  _CompanyDetailsScreenState createState() => _CompanyDetailsScreenState();
}

class _CompanyDetailsScreenState extends State<CompanyDetailsScreen> {
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
    super.initState();
    initializeControllers();
    fetchCompanyDetails();
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
    super.dispose();
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
      drawer: CustomDrawer(
        context: context,
        loginData: widget.loginData,
      ),
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          height: 55,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.grey,
                size: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
        onRefresh: fetchCompanyDetails,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
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
                          // SizedBox(height: 12),
                          // _buildLabeledTextField(
                          //   'Select Membership',
                          //   selectMembershipController,
                          // ),
                          // SizedBox(height: 12),
                          // _buildLabeledTextField(
                          //   'Input Number',
                          //   inputNumberController,
                          // ),
                          // SizedBox(height: 12),
                          // _buildLabeledTextField(
                          //   'GST Number',
                          //   gstNoController,
                          // ),
                          // SizedBox(height: 12),
                          // _buildLabeledTextField(
                          //   'Chamber Benefits',
                          //   chamberBenefitsController,
                          // ),
                          // SizedBox(height: 12),
                          // _buildLabeledTextField(
                          //   'Title',
                          //   titleController,
                          // ),
                          // SizedBox(height: 12),
                          // _buildLabeledTextField(
                          //   'First Name',
                          //   firstNameController,
                          // ),
                          // SizedBox(height: 12),
                          // _buildLabeledTextField(
                          //   'Surname',
                          //   surNameController,
                          // ),
                          // SizedBox(height: 12),
                          // _buildLabeledTextField(
                          //   'Role',
                          //   roleController,
                          // ),
                          // SizedBox(height: 12),
                          // _buildLabeledTextField(
                          //   'Phone Number',
                          //   phoneNoController,
                          //   keyboardType: TextInputType.phone,
                          // ),
                          // SizedBox(height: 12),
                          // _buildLabeledTextField(
                          //   'Account Status',
                          //   accountStatusController,
                          // ),
                          // SizedBox(height: 12),
                          // _buildLabeledTextField(
                          //   'Balance',
                          //   balanceController,
                          //   keyboardType: TextInputType.number,
                          // ),
                          // SizedBox(height: 12),
                          // _buildLabeledTextField(
                          //   'Membership Number',
                          //   memberShipNoController,
                          // ),
                          // SizedBox(height: 12),
                          // _buildLabeledTextField(
                          //   'Membership Certificate',
                          //   membershipCertificateController,
                          // ),
                          // SizedBox(height: 12),
                          // _buildLabeledTextField(
                          //   'Valid Up To',
                          //   validUpToController,
                          // ),
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
                                backgroundColor: Colors.green,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}