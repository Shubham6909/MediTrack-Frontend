import 'package:flutter/material.dart';

class VaccinationTrackerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vaccination Tracker')),
      body: Center(child: Text('Vaccination list and schedule')),
    );
  }
}