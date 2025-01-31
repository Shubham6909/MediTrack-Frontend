import 'package:flutter/material.dart';

class EPlatformSection extends StatelessWidget {
  final String title;
  final String description;

  // Constructor
  const EPlatformSection({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF001C42), // Background color
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}







class EPlatformSection1 extends StatelessWidget {
  final String title;
  final String description;

  const EPlatformSection1({
    required this.title,
    required this.description,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
  return Container(
  width: double.infinity,
  decoration: BoxDecoration(
  color: const Color(0xFF001C42),
  ),
  child: Padding(
  padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisSize: MainAxisSize.max,
  children: [
  // Image
  Image.asset(
  'assets/images/sir.png', // Path to the image
  height: 150, // Adjust size as needed
  width: 150,
  fit: BoxFit.cover,
  ),
  const SizedBox(width: 25), // Space between image and text
  // Text next to the image
  Expanded(
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Text(
  title,
  style: const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  color: Colors.white,
  ),
  ),
  const SizedBox(height: 8),
  Text(
  description,
  style: const TextStyle(
  fontSize: 16,
  color: Colors.white,
  height: 1.5,
  fontWeight: FontWeight.bold,
  ),
  ),
  ],
  ),
  ),
  ],
  ),
  const SizedBox(height: 4), // Small space between description and chairman's text
  // Chairman Info directly below the image
  Column(
  crossAxisAlignment: CrossAxisAlignment.start,

  children: const [
  // Name of Chairman
  Text(
  '   Shri. Jaheer Bukhari',
  style: TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  ),
  ),
  SizedBox(height: 2), // Reduced space between name and title
  // Position of Chairman
  Text(
  '   AECCI Chairman',
  style: TextStyle(
  fontSize: 14,
  color: Colors.white,
  ),
  ),
  ],
  ),
  ],
  ),
  ),
  );
  }
  }
