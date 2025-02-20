// import 'package:flutter/material.dart';
// import 'package:aecci/views/drawer/custom_drawer.dart';
//
// class PersonalDetailsScreen extends StatefulWidget {
//   final Map<String, dynamic>? loginData;
//   final Map<String, dynamic>? getData;
//   final String token;
//
//   const PersonalDetailsScreen({
//     this.loginData,
//     this.getData,
//     required this.token,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   _PersonalDetailsScreenState createState() => _PersonalDetailsScreenState();
// }
//
// class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
//   // Form controllers
//
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _surnameController = TextEditingController();
//   final TextEditingController _jobTitleController = TextEditingController();
//   final TextEditingController _mobileController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _address1Controller = TextEditingController();
//   final TextEditingController _address2Controller = TextEditingController();
//   final TextEditingController _cityController = TextEditingController();
//   final TextEditingController _countryController = TextEditingController();
//   final TextEditingController _stateController = TextEditingController();
//   final TextEditingController _pinCodeController = TextEditingController();
//
//   // Form data
//   String? gstNo;
//   String? email;
//   String? companyName;
//   String? selectMembership;
//   String? balance;
//   String? validUpTo;
//   String? membershipType;
//   String? inputNumber;
//   int? numberOfEmployees;
//   String? websiteAdd;
//   String? address1;
//   String? address2;
//   String? city;
//   String? country;
//   String? state;
//   String? pinCode;
//   String? businessCategory;
//   String? title;
//   String? firstName;
//   String? surName;
//   String? role;
//   String? telephoneNo;
//   int? phoneNo;
//   String? registeredBank;
//   String? registeredAccountNo;
//   String? IFSCCode;
//   String? memberShipNo;
//   String? accountStatus;
//   bool? isApproved;
//   bool? isExisting;
//   String? companyLogo;
//   String? ownersName;
//   int? establishmentYear;
//   String? companyAdd;
//   int? mobileNo;
//   String? companyProduct;
//   String? companyActivity;
//
//   final _personalFormKey = GlobalKey<FormState>();
//   final _addressFormKey = GlobalKey<FormState>();
//   String? _selectedTitle;
//   bool isLoading = true;
//
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
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeData();
//   }
//
//   void _initializeData() {
//     if (widget.loginData != null && widget.loginData!.containsKey('info')) {
//       final info = widget.loginData!['info'] as Map<String, dynamic>;
//       _loadLoginData(info);
//     }
//
//     if (widget.getData != null && widget.getData!.containsKey('data')) {
//       final data = widget.getData!['data'] as Map<String, dynamic>;
//       _loadGetData(data);
//     }
//
//     _initializeControllers();
//     setState(() => isLoading = false);
//   }
//
//   void _loadLoginData(Map<String, dynamic> info) {
//     gstNo = info['gstNo']?.toString();
//     balance = info['balance']?.toString();
//     email = info['email']?.toString();
//     selectMembership = info['selectMembership']?.toString();
//     validUpTo = info['validUpTo']?.toString();
//     companyName = info['companyName']?.toString();
//     membershipType = info['selectMembership']?.toString();
//     inputNumber = info['inputNumber']?.toString();
//     numberOfEmployees = info['numberOfEmployees'];
//     websiteAdd = info['websiteAdd']?.toString();
//     address1 = info['address1']?.toString();
//     address2 = info['address2']?.toString();
//     city = info['city']?.toString();
//     country = info['country']?.toString();
//     state = info['state']?.toString();
//     pinCode = info['pinCode']?.toString();
//     businessCategory = info['businessCategory']?.toString();
//
//     String? receivedTitle = info['title']?.toString();
//     _selectedTitle = titleOptions.contains(receivedTitle) ? receivedTitle : null;
//
//     title = info['title']?.toString();
//     firstName = info['firstName']?.toString();
//     surName = info['surName']?.toString();
//     role = info['role']?.toString();
//     telephoneNo = info['telephoneNo']?.toString();
//     phoneNo = info['phoneNo'];
//   }
//
//   void _loadGetData(Map<String, dynamic> data) {
//     companyName = data['companyName']?.toString() ?? companyName;
//     companyLogo = data['companyLogo']?.toString();
//     ownersName = data['ownersName']?.toString();
//     email = data['email']?.toString() ?? email;
//     establishmentYear = data['establishmentYear'];
//     companyAdd = data['companyAdd']?.toString();
//     mobileNo = data['mobileNo'];
//     companyProduct = data['companyProduct']?.toString();
//     companyActivity = data['companyActivity']?.toString();
//   }
//
//   void _initializeControllers() {
//     _titleController.text = title ?? '';
//     _firstNameController.text = firstName ?? '';
//     _surnameController.text = surName ?? '';
//     _jobTitleController.text = role ?? '';
//     _mobileController.text = phoneNo?.toString() ?? '';
//     _emailController.text = email ?? '';
//     _address1Controller.text = address1 ?? '';
//     _address2Controller.text = address2 ?? '';
//     _cityController.text = city ?? '';
//     _countryController.text = country ?? '';
//     _stateController.text = state ?? '';
//     _pinCodeController.text = pinCode ?? '';
//   }
//
//   @override
//   void dispose() {
//     _titleController.dispose();
//     _firstNameController.dispose();
//     _surnameController.dispose();
//     _jobTitleController.dispose();
//     _mobileController.dispose();
//     _emailController.dispose();
//     _address1Controller.dispose();
//     _address2Controller.dispose();
//     _cityController.dispose();
//     _countryController.dispose();
//     _stateController.dispose();
//     _pinCodeController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       drawer: CustomDrawer(
//         context: context,
//         loginData: widget.loginData ?? {},
//       ),
//       appBar: AppBar(
//         title: Image.asset(
//           'assets/images/logo.png',
//           height: 50,
//           fit: BoxFit.contain,
//         ),
//         backgroundColor: Colors.white,
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               icon: const Icon(
//                 Icons.menu,
//                 color: Colors.black,
//                 size: 30,
//               ),
//               onPressed: () {
//                 Scaffold.of(context).openDrawer();
//               },
//             );
//           },
//         ),
//       ),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               _buildDashboardCard(),
//               const SizedBox(height: 16),
//               _buildPersonalDetailsCard(),
//               const SizedBox(height: 16),
//               _buildAddressCard(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   Widget _buildDashboardCard() {
//     return Center(
//       child: Container(
//         width: 350,
//         child: Card(
//           color: const Color(0xFFF5F3ED),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _buildDashboardHeader(),
//                 _buildMembershipDetails(),
//                 _buildBalanceAndValidity(),
//                 _buildWelcomeMessage(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDashboardHeader() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const Text(
//           'Dashboard',
//           style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
//         ),
//         Text(
//           selectMembership ?? 'N/A',
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildMembershipDetails() {
//     return Align(
//       alignment: Alignment.centerRight,
//       child: Text(
//         memberShipNo ?? 'N/A',
//         style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
//       ),
//     );
//   }
//
//   Widget _buildBalanceAndValidity() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Wallet Balance:',
//                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
//               ),
//               Text(
//                 "₹ $balance",
//                 style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
//               ),
//             ],
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               const Text(
//                 "Valid Upto",
//                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
//               ),
//               Text(
//                 (validUpTo ?? 'N/A'),
//                 style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildWelcomeMessage() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Welcome!',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
//         ),
//         Text(
//           email ?? 'N/A',
//           style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
//         ),
//       ],
//     );
//   }
//
//
//
//   Widget _buildPersonalDetailsCard() {
//     return _buildCard(
//       title: 'Personal Details',
//       formKey: _personalFormKey,
//       children: [
//         Row(
//           children: [
//             Expanded(
//               flex: 1,
//               child: _buildLabeledDropdownField('TITLE'),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               flex: 2,
//               child: _buildLabeledTextField(
//                 'FIRST NAME',
//                 _firstNameController,
//                 validator: _requiredValidator,
//                 isEditable: false,
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 16),
//         _buildLabeledTextField(
//           'SURNAME',
//           _surnameController,
//           validator: _requiredValidator,
//           isEditable: false,
//         ),
//         const SizedBox(height: 16),
//         _buildLabeledTextField(
//           'JOB TITLE',
//           _jobTitleController,
//           validator: _requiredValidator,
//           isEditable: false,
//         ),
//         const SizedBox(height: 16),
//         _buildLabeledTextField(
//           'MOBILE NO.',
//           _mobileController,
//           validator: _phoneValidator,
//           keyboardType: TextInputType.phone,
//           isEditable: false,
//         ),
//         const SizedBox(height: 16),
//         _buildLabeledTextField(
//           'EMAIL',
//           _emailController,
//           validator: _emailValidator,
//           keyboardType: TextInputType.emailAddress,
//           isEditable: false,
//         ),
//         const SizedBox(height: 16),
//         _buildUpdateButton(),
//       ],
//     );
//   }
//
//   Widget _buildAddressCard() {
//     return _buildCard(
//       title: 'Personal Address',
//       formKey: _addressFormKey,
//       children: [
//         _buildLabeledTextField(
//           'ADDRESS 1',
//           _address1Controller,
//           validator: _requiredValidator,
//           isEditable: false,
//         ),
//         const SizedBox(height: 16),
//         _buildLabeledTextField(
//           'ADDRESS 2',
//           _address2Controller,
//           isEditable: false,
//         ),
//         const SizedBox(height: 16),
//         _buildLabeledTextField(
//           'CITY',
//           _cityController,
//           validator: _requiredValidator,
//           isEditable: false,
//         ),
//         const SizedBox(height: 16),
//         _buildLabeledTextField(
//           'COUNTRY',
//           _countryController,
//           validator: _requiredValidator,
//           isEditable: false,
//         ),
//         const SizedBox(height: 16),
//         _buildLabeledTextField(
//           'STATE',
//           _stateController,
//           validator: _requiredValidator,
//           isEditable: false,
//         ),
//         const SizedBox(height: 16),
//         _buildLabeledTextField(
//           'PIN CODE',
//           _pinCodeController,
//           validator: _pinCodeValidator,
//           keyboardType: TextInputType.number,
//           isEditable: false,
//         ),
//         const SizedBox(height: 16),
//         _buildUpdateButton(),
//       ],
//     );
//   }
//
//   Widget _buildLabeledDropdownField(String label) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(height: 8),
//         DropdownButtonFormField<String>(
//           value: _selectedTitle,
//           decoration: InputDecoration(
//             filled: true,
//             fillColor: Colors.grey[200],
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide.none,
//             ),
//             contentPadding: const EdgeInsets.symmetric(
//               horizontal: 12,
//               vertical: 8,
//             ),
//           ),
//           items: titleOptions.map((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//           onChanged: (String? newValue) {
//             setState(() {
//               _selectedTitle = newValue;
//             });
//           },
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return 'Please select a title';
//             }
//             return null;
//           },
//         ),
//       ],
//     );
//   }
//
//   Widget _buildLabeledTextField(
//       String label,
//       TextEditingController controller, {
//         String? Function(String?)? validator,
//         TextInputType? keyboardType,
//         bool isEditable = true,
//       }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(height: 8),
//         isEditable
//             ? TextFormField(
//           controller: controller,
//           decoration: InputDecoration(
//             filled: true,
//             fillColor: Colors.grey[200],
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide.none,
//             ),
//             contentPadding: const EdgeInsets.symmetric(
//               horizontal: 12,
//               vertical: 8,
//             ),
//           ),
//           validator: validator,
//           keyboardType: keyboardType,
//         )
//             : Container(
//           height: 48, // Set a fixed height
//           width: double.infinity, // Set width to fill the parent
//           padding: const EdgeInsets.symmetric(
//             horizontal: 12,
//             vertical: 8,
//           ),
//           decoration: BoxDecoration(
//             color: Colors.grey[200],
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               controller.text,
//               style: const TextStyle(
//                 fontSize: 14,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildUpdateButton() {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: _handleUpdate,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.green,
//           padding: const EdgeInsets.symmetric(vertical: 12),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//         ),
//         child: const Text(
//           'Update',
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
//
//   String? _requiredValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'This field is required';
//     }
//     return null;
//   }
//
//   String? _emailValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Email is required';
//     }
//     if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
//       return 'Please enter a valid email';
//     }
//     return null;
//   }
//
//   String? _phoneValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Phone number is required';
//     }
//     if (!RegExp(r'^\d{10}$').hasMatch(value)) {
//       return 'Please enter a valid 10-digit phone number';
//     }
//     return null;
//   }
//
//   String? _pinCodeValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'PIN code is required';
//     }
//     if (!RegExp(r'^\d{6}$').hasMatch(value)) {
//       return 'Please enter a valid 6-digit PIN code';
//     }
//     return null;
//   }
//
//   void _handleUpdate() {
//     if (!_personalFormKey.currentState!.validate()) {
//       return;
//     }
//
//     // TODO: Implement update logic here
//     // You can access the form values using the controllers
//     final updateData = {
//       'title': _selectedTitle,
//       'firstName': _firstNameController.text,
//       'surname': _surnameController.text,
//       'jobTitle': _jobTitleController.text,
//       'mobileNo': _mobileController.text,
//       'email': _emailController.text,
//     };
//
//     // Add your update logic here
//   }
//
//   Widget _buildCard({
//     required String title,
//     required GlobalKey<FormState> formKey,
//     required List<Widget> children,
//   }) {
//     return Container(
//       width: double.infinity,
//       child: Card(
//         color: Colors.white,
//         elevation: 2,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 ...children,
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
import 'package:flutter/material.dart';
import 'package:aecci/views/drawer/custom_drawer.dart';

import '../dashboard.dart';

class PersonalDetailsScreen extends StatefulWidget {
  final Map<String, dynamic>? loginData;
  final Map<String, dynamic>? getData;
  final String token;

  const PersonalDetailsScreen({
    this.loginData,
    this.getData,
    required this.token,
    Key? key,
  }) : super(key: key);

  @override
  _PersonalDetailsScreenState createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  // Form controllers
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

  // Form data
  String? gstNo;
  String? email;
  String? companyName;
  String? selectMembership;
  String? balance;
  String? validUpTo;
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
  String? firstName;
  String? surName;
  String? role;
  String? telephoneNo;
  int? phoneNo;
  String? registeredBank;
  String? registeredAccountNo;
  String? IFSCCode;
  String? memberShipNo;
  String? accountStatus;
  bool? isApproved;
  bool? isExisting;
  String? companyLogo;
  String? ownersName;
  int? establishmentYear;
  String? companyAdd;
  int? mobileNo;
  String? companyProduct;
  String? companyActivity;

  final _personalFormKey = GlobalKey<FormState>();
  final _addressFormKey = GlobalKey<FormState>();
  String? _selectedTitle;
  bool isLoading = true;

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

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    if (widget.loginData != null && widget.loginData!.containsKey('info')) {
      final info = widget.loginData!['info'] as Map<String, dynamic>;
      _loadLoginData(info);
    }

    if (widget.getData != null && widget.getData!.containsKey('data')) {
      final data = widget.getData!['data'] as Map<String, dynamic>;
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
    _selectedTitle = titleOptions.contains(receivedTitle) ? receivedTitle : null;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomDrawer(
        context: context,
        loginData: widget.loginData ?? {},
      ),

      // appBar: AppBar(
      //   title: Image.asset(
      //     'assets/images/logo.png',
      //     height: 50,
      //     fit: BoxFit.contain,
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   scrolledUnderElevation: 0,
      //   leading: Builder(
      //     builder: (BuildContext context) {
      //       return IconButton(
      //         icon: const Icon(
      //           Icons.menu,
      //           color: Colors.black,
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
        title: Image.asset(
          'assets/images/logo.png',
          height: 50,
          fit: BoxFit.contain,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.dashboard,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DashboardScreen(
                    loginData: widget.loginData,
                    getData: widget.getData,
                    token: widget.token,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // _buildDashboardCard(),
              // const SizedBox(height: 16),
              _buildPersonalDetailsCard(),
              const SizedBox(height: 8),
              _buildAddressCard(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildDashboardCard() {
  //   return Center(
  //     child: Container(
  //       width: 1800, // Increase the width as needed
  //       child: Card(
  //         elevation: 4,
  //         margin: const EdgeInsets.all(16),
  //         child: Container(
  //           padding: const EdgeInsets.all(16),
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(8),
  //             gradient: const LinearGradient(
  //               begin: Alignment.topLeft,
  //               end: Alignment.bottomRight,
  //               colors: [Colors.white, Color(0xFFF5F5F5)],
  //             ),
  //           ),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               _buildTopSection(),
  //               const SizedBox(height: 4),
  //               _buildMembershipDetails(),
  //               const Divider(height: 16),
  //               _buildBalanceAndValidity(),
  //               const SizedBox(height: 16),
  //               _buildWelcomeSection(),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildTopSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(Icons.dashboard, color: Color(0xFF1A237E), size: 28),
              SizedBox(width: 8),
              Text(
                'DASHBOARD',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A237E),
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.account_balance_wallet,
                  color: Colors.green,
                  size: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  '₹-$balance',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMembershipDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Membership No:',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              memberShipNo ?? 'N/A',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF1A237E).withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.verified_user,
                color: Color(0xFF1A237E),
                size: 20,
              ),
              const SizedBox(width: 4),
              Text(
                selectMembership ?? 'N/A',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A237E),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBalanceAndValidity() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_today,
                  color: Colors.grey,
                  size: 16,
                ),
                const SizedBox(width: 4),
                const Text(
                  'Valid Upto:',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              validUpTo ?? 'N/A',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A237E).withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.person,
            color: Color(0xFF1A237E),
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A237E),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  email ?? 'N/A',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalDetailsCard() {
    return _buildCard(
      title: 'Personal Details',
      formKey: _personalFormKey,
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: _buildLabeledDropdownField('TITLE'),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: _buildLabeledTextField(
                'FIRST NAME',
                _firstNameController,
                validator: _requiredValidator,
                isEditable: false,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildLabeledTextField(
          'SURNAME',
          _surnameController,
          validator: _requiredValidator,
          isEditable: false,
        ),
        const SizedBox(height: 16),
        _buildLabeledTextField(
          'JOB TITLE',
          _jobTitleController,
          validator: _requiredValidator,
          isEditable: false,
        ),
        const SizedBox(height: 16),
        _buildLabeledTextField(
          'MOBILE NO.',
          _mobileController,
          validator: _phoneValidator,
          keyboardType: TextInputType.phone,
          isEditable: false,
        ),
        const SizedBox(height: 16),
        _buildLabeledTextField(
          'EMAIL',
          _emailController,
          validator: _emailValidator,
          keyboardType: TextInputType.emailAddress,
          isEditable: false,
        ),
        const SizedBox(height: 16),
        _buildUpdateButton(),
      ],
    );
  }

  Widget _buildAddressCard() {
    return _buildCard(
      title: 'Personal Address',
      formKey: _addressFormKey,
      children: [
        _buildLabeledTextField(
          'ADDRESS 1',
          _address1Controller,
          validator: _requiredValidator,
          isEditable: false,
        ),
        const SizedBox(height: 16),
        _buildLabeledTextField(
          'ADDRESS 2',
          _address2Controller,
          isEditable: false,
        ),
        const SizedBox(height: 16),
        _buildLabeledTextField(
          'CITY',
          _cityController,
          validator: _requiredValidator,
          isEditable: false,
        ),
        const SizedBox(height: 16),
        _buildLabeledTextField(
          'COUNTRY',
          _countryController,
          validator: _requiredValidator,
          isEditable: false,
        ),
        const SizedBox(height: 16),
        _buildLabeledTextField(
          'STATE',
          _stateController,
          validator: _requiredValidator,
          isEditable: false,
        ),
        const SizedBox(height: 16),
        _buildLabeledTextField(
          'PIN CODE',
          _pinCodeController,
          validator: _pinCodeValidator,
          keyboardType: TextInputType.number,
          isEditable: false,
        ),
        const SizedBox(height: 16),
        _buildUpdateButton(),
      ],
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


  Widget _buildLabeledTextField(
      String label,
      TextEditingController controller, {
        String? Function(String?)? validator,
        TextInputType? keyboardType,
        bool isEditable = true,
      }) {
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
        isEditable
            ? TextFormField(
          controller: controller,
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
          validator: validator,
          keyboardType: keyboardType,
        )
            : Container(
          height: 48, // Set a fixed height
          width: double.infinity, // Set width to fill the parent
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              controller.text,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
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
          backgroundColor: Colors.green,
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
}

