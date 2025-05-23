import 'package:flutter/material.dart';

class ProfileSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Settings')),
      body: Center(child: Text('Edit personal and contact info')),
    );
  }
}