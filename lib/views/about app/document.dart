import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Document extends StatefulWidget {
  @override
  _DocumentState createState() => _DocumentState();
}

class _DocumentState extends State<Document> {
  @override
  void initState() {
    super.initState();
    _launchURL();
  }

  // Function to open the URL and close the screen
  void _launchURL() async {
    final Uri url = Uri.parse("https://e-platform.aecci.org.in/e-co-verification");
    if (await launchUrl(url, mode: LaunchMode.externalApplication)) {
      Navigator.pop(context); // Close the screen after opening the URL
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Show loading spinner while redirecting
      ),
    );
  }
}
