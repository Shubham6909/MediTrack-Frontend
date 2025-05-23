import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:qr_flutter/qr_flutter.dart'; // For displaying QR code

// Model class to parse API response
class EmergencyData {
  final String qrCodeData;
  final String bloodGroup;
  final String allergies;
  final String emergencyContactName;
  final String emergencyContactNumber;

  EmergencyData({
    required this.qrCodeData,
    required this.bloodGroup,
    required this.allergies,
    required this.emergencyContactName,
    required this.emergencyContactNumber,
  });

  factory EmergencyData.fromJson(Map<String, dynamic> json) {
    return EmergencyData(
      qrCodeData: json['qrCodeData'] ?? '',
      bloodGroup: json['bloodGroup'] ?? '',
      allergies: json['allergies'] ?? '',
      emergencyContactName: json['emergencyContactName'] ?? '',
      emergencyContactNumber: json['emergencyContactNumber'] ?? '',
    );
  }
}

class EmergencyQRCodeScreen extends StatefulWidget {
  @override
  _EmergencyQRCodeScreenState createState() => _EmergencyQRCodeScreenState();
}

class _EmergencyQRCodeScreenState extends State<EmergencyQRCodeScreen> {
  EmergencyData? emergencyData;
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchEmergencyData();
  }

  // Function to fetch data from API
  Future<void> fetchEmergencyData() async {
    try {
      // Replace with your actual API endpoint
      final response = await http.get(Uri.parse('https://your-api-endpoint.com/emergency-data'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          emergencyData = EmergencyData.fromJson(data);
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load data: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get device screen size for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Emergency',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
          ? Center(child: Text(errorMessage, style: TextStyle(color: Colors.red)))
          : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              Text(
                'Emergency QR Code',
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // QR Code
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: QrImageView(
                  data: emergencyData?.qrCodeData ??
                      'https://example.com/emergency-info', // Fallback QR data
                  version: QrVersions.auto,
                  size: screenWidth * 0.5, // Responsive QR code size
                ),
              ),
              SizedBox(height: screenHeight * 0.04),

              // Info Cards
              _buildInfoCard(
                'Blood Group',
                emergencyData?.bloodGroup ?? 'A+',
                screenWidth,
              ),
              SizedBox(height: screenHeight * 0.02),

              _buildInfoCard(
                'Allergies',
                emergencyData?.allergies ?? 'Penicillin',
                screenWidth,
              ),
              SizedBox(height: screenHeight * 0.02),

              _buildInfoCard(
                'Emergency Contact',
                '${emergencyData?.emergencyContactName ?? 'Amit Kumar'}\n${emergencyData?.emergencyContactNumber ?? '+91-9875543210'}',
                screenWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget to build info cards (Blood Group, Allergies, Emergency Contact)
  Widget _buildInfoCard(String title, String value, double screenWidth) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: EmergencyQRCodeScreen(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
  ));
}