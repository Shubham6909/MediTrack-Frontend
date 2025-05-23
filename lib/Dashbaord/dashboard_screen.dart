import 'package:flutter/material.dart';
import '../screens/doctor_visit_reminder.dart';
import '../screens/emergency_qr_code_screen.dart';
import '../Footer/src/notch_bottom_bar_controller.dart';
import '../screens/medical_record_upload_screen.dart';
import '../screens/medicine_reminder_setup_screen.dart';

class DashboardScreen extends StatelessWidget {
  final NotchBottomBarController? controller;

  const DashboardScreen({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: isTablet ? 3 : 2,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0,
                childAspectRatio: 1.2,
                children: [
                  _buildActionCard(
                    context: context,
                    icon: Icons.upload_file,
                    iconColor: Colors.blue.shade600,
                    label: 'Upload Record',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MedicalRecordUploadScreen()),
                      );
                    },
                  ),
                  _buildActionCard(
                    context: context,
                    icon: Icons.medical_services,
                    iconColor: Colors.blue.shade600,
                    label: 'Medical Reminder',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MedicineReminderSetupScreen()),
                      );
                    },
                  ),
                  _buildActionCard(
                    context: context,
                    icon: Icons.sos,
                    iconColor: Colors.blue.shade600,
                    label: 'Emergency QR',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EmergencyQRCodeScreen()),
                      );
                    },
                  ),
                  _buildActionCard(
                    context: context,
                    icon: Icons.sos,
                    iconColor: Colors.blue.shade600,
                    label: 'Doctor Visit Reminder',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DoctorVisitReminder()),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Health Summary',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              _buildHealthSummaryCard(),
            ],
        ),
        ),
      ),
    );
  }

  Widget _buildActionCard({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF0F8FF),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: iconColor,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHealthSummaryCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F8FF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.calendar_today,
                color: Colors.blue,
                size: 24,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Upcoming Doctor Visit',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Tome/Tow · 10:00 AM',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
