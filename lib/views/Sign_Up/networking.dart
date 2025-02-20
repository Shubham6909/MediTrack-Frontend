import 'package:flutter/material.dart';
import 'package:aecci/views/about app/information.dart';
import 'package:aecci/views/about app/upcoming_events.dart';
import 'package:aecci/views/about app/international_collaboration.dart';

class NetworkingSections extends StatelessWidget {
  const NetworkingSections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Text(
          'AECCI Networking',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        // First row with two images
        Container(
          width: screenWidth,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildImageCard(context, 'assets/images/c1.png', InternationalCollaboration(), screenHeight),
              const SizedBox(width: 16),
              _buildImageCard(context, 'assets/images/c3.png', Information(), screenHeight),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImageCard(
      BuildContext context,
      String imagePath,
      Widget destinationScreen,
      double screenHeight,
      {bool isFullWidth = false}
      ) {
    Widget imageWidget = ClipRRect(
      borderRadius: BorderRadius.circular(8), // Optional: adds rounded corners
      child: Image.asset(
        imagePath,
        height: screenHeight * 0.2,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );

    return isFullWidth
        ? InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationScreen),
        );
      },
      child: imageWidget,
    )
        : Expanded(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destinationScreen),
          );
        },
        child: imageWidget,
      ),
    );
  }
}