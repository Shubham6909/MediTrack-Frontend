import 'package:flutter/material.dart';
import '../screens/medicine_reminder_setup_screen.dart';
import '../screens/vaccination_tracker_screen.dart';
import '../screens/medical_record_upload_screen.dart';
import '../screens/emergency_qr_code_screen.dart';
import 'profile_settings_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> features = [
    {'title': 'Medicine Reminder', 'icon': Icons.medication, 'screen': MedicineReminderSetupScreen()},
    {'title': 'Vaccination Tracker', 'icon': Icons.vaccines, 'screen': VaccinationTrackerScreen()},
    {'title': 'Medical Records', 'icon': Icons.folder, 'screen': MedicalRecordUploadScreen()},
    {'title': 'Emergency QR Code', 'icon': Icons.qr_code, 'screen': EmergencyQRCodeScreen()},
    {'title': 'Profile Settings', 'icon': Icons.person, 'screen': ProfileSettingsScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MediTrack Dashboard')),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12
        ),
        itemCount: features.length,
        itemBuilder: (context, index) {
          final feature = features[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => feature['screen']),
            ),
            child: Card(
              elevation: 4,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(feature['icon'], size: 40),
                    SizedBox(height: 10),
                    Text(feature['title']),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}