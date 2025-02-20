import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aecci/views/drawer/custom_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CommercialDirectoryScreen extends StatefulWidget {
  final Map<String, dynamic> loginData;

  const CommercialDirectoryScreen({
    required this.loginData,
    Key? key,
  }) : super(key: key);

  @override
  _CommercialDirectoryScreenState createState() => _CommercialDirectoryScreenState();
}

class _CommercialDirectoryScreenState extends State<CommercialDirectoryScreen> {
  final _personalFormKey = GlobalKey<FormState>();
  bool _isLoading = false;
  File? _selectedImage;

  // Controllers for text fields
  late TextEditingController companyNameController;
  late TextEditingController employeesController;
  late TextEditingController businessCategoryController;
  late TextEditingController sourceController;
  late TextEditingController telephoneController;
  late TextEditingController emailController;
  late TextEditingController websiteController;
  late TextEditingController selectMembershipController;
  late TextEditingController inputNumberController;

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
    selectMembershipController = TextEditingController();
    inputNumberController = TextEditingController();
  }

  Future<void> fetchCompanyDetails() async {
    // Fetch company details logic here
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
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
    selectMembershipController.dispose();
    inputNumberController.dispose();
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
      // drawer: CustomDrawer(
      //   context: context,
      //   loginData: widget.loginData,
      // ),
      // appBar: AppBar(
      //   title: Image.asset(
      //     'assets/images/logo.png',
      //     height: 55,
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   scrolledUnderElevation: 0,
      //   centerTitle: true,
      //   leading: Builder(
      //     builder: (BuildContext context) {
      //       return IconButton(
      //         icon: const Icon(
      //           Icons.menu,
      //           color: Colors.grey,
      //           size: 30,
      //         ),
      //         onPressed: () {
      //           Scaffold.of(context).openDrawer();
      //         },
      //       );
      //     },
      //   ),
      // ),
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Company Overview',
            style: TextStyle(
              color: Colors.indigo,
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
            color: Colors.grey,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home, color: Colors.indigo),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.lightbulb_outline, color: Colors.indigo),
            onPressed: () {},
          ),
        ],
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
                            'COMMERCIAL DIRECTORY',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'COMPANY LOGO *',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 4),
                          GestureDetector(
                            onTap: _pickImage,
                            child: Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: _selectedImage == null
                                  ? Center(child: Text('Tap to select an image'))
                                  : Image.file(_selectedImage!, fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(height: 12),
                          _buildLabeledTextField(
                            'COMPANY NAME',
                            companyNameController,
                            isRequired: true,
                          ),
                          SizedBox(height: 12),
                          _buildLabeledTextField(
                            'NUMBER OF EMPLOYEES',
                            employeesController,
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 12),
                          _buildLabeledTextField(
                            'OWNER’S NAME',
                            businessCategoryController,
                          ),
                          SizedBox(height: 12),
                          _buildLabeledTextField(
                            'EMAIL-ID',
                            sourceController,
                          ),
                          SizedBox(height: 12),
                          _buildLabeledTextField(
                            'YEAR OF ESTABLISHMENT',
                            telephoneController,
                            keyboardType: TextInputType.phone,
                          ),
                          SizedBox(height: 12),
                          _buildLabeledTextField(
                            'COMPANY ADDRESS',
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
                            'MOBILE NO',
                            websiteController,
                          ),
                          SizedBox(height: 12),
                          _buildLabeledTextField(
                            'COMPANY PRODUCTS',
                            selectMembershipController,
                          ),
                          SizedBox(height: 12),
                          _buildLabeledTextField(
                            'COMPANY ACTIVITY',
                            inputNumberController,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Your update logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
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
    );
  }
}