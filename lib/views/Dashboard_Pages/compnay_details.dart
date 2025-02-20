import 'package:flutter/material.dart';

class CompnayDetails extends StatefulWidget {
  final Map<String, dynamic>? loginData;
  final Map<String, dynamic>? getData;


  final String token;

  const CompnayDetails({
    Key? key,
    this.loginData,
    this.getData,
    required this.token,
  }) : super(key: key);

  @override
  _CompnayDetailsState createState() => _CompnayDetailsState();
}


class _CompnayDetailsState extends State<CompnayDetails> {
  bool showBalance = false; // Add this line
  // Existing vari
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false, // This will remove the default drawer icon
        title: Image.asset(
          'assets/images/logo786.png',
          height: 50,
          fit: BoxFit.contain,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.lightbulb_outline, color: Colors.orangeAccent),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.access_time, color: Colors.orangeAccent),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.orangeAccent),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Container(
              width: 350,
              child: Card(
                color: const Color(0xFF4A3FBC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Company Information',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.white),
                            onPressed: () {
                              // Add your edit action here
                            },
                          ),
                        ],
                      ),
                      Divider(color: Colors.grey),
                      // Text(
                      //   "Company: $companyName",
                      //   style: TextStyle(
                      //     fontSize: 14,
                      //     fontWeight: FontWeight.bold,
                      //     color: Colors.white,
                      //   ),
                      // ),
                      SizedBox(height: 6),
                      Text(
                        "Owner: $ownersName",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Email: $email",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Established: $establishmentYear",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        " Company Address: $companyAdd",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      // SizedBox(height: 6),
                      // Text(
                      //   "Mobile: $mobileNo",
                      //   style: TextStyle(
                      //     fontSize: 14,
                      //     fontWeight: FontWeight.bold,
                      //     color: Colors.white,
                      //   ),
                      // ),
                      SizedBox(height: 6),
                      Text(
                        "Company Product : $companyProduct",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Company Activity: $companyActivity",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}