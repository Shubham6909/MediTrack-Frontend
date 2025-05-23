// import 'package:flutter/material.dart';
// import 'package:aecci/views/IntroScreen.dart';
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _navigateToHomeScreen();
//   }
//
//   // Navigate to the HomeScreen after a delay (e.g., 3 seconds)
//   _navigateToHomeScreen() async {
//     await Future.delayed(Duration(seconds: 3));
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => IntroScreen()),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Image.asset('assets/images1/aecci6.webp'),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'dart:async';
import 'login/login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFADD8E6), // Light blue background
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.medical_services,
                size: 100.0,
                color: Colors.black.withOpacity(0.8),
              ),
              const SizedBox(height: 20),
              const Text(
                'MediTrack',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A3D5C),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
