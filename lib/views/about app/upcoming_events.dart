import 'package:flutter/material.dart';

class UpcomingEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Events', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.purple,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: '  WEBINAR'),
            EventCard(date: '10', monthYear: 'Feb 2025', title: 'Navigating the Egyptian Investment Landscape', location: 'Online - Zoom'),
            EventCard(date: '11', monthYear: 'Feb 2025', title: 'Non Disclosure of Agreements (NDA)', location: 'Online - Zoom'),

            SectionTitle(title: '  LIVE SESSIONS'),
            EventCard(date: '12', monthYear: 'Feb 2025', title: 'Making the Most of International Trade Shows: Series 15', location: 'Online - Zoom'),
            EventCard(date: '18', monthYear: 'Feb 2024', title: 'What you need to know about AEO: Series 16', location: 'Online - Zoom'),

            SectionTitle(title: '  SEMINARS & WORKSHOPS'),
            EventCard(date: '07', monthYear: 'Feb 2025', title: 'Export Business for New Comers', location: 'Navi Mumbai'),
            EventCard(date: '15', monthYear: 'Feb 2025', title: 'FEMA documentation for Import Export', location: 'Navi Mumbai'),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String date, monthYear, title, location;
  const EventCard({required this.date, required this.monthYear, required this.title, required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(date, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                  Text(monthYear, style: const TextStyle(color: Colors.white, fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(location, style: const TextStyle(fontSize: 14, color: Colors.black54)),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Register Now', style: TextStyle(color: Colors.pink)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
