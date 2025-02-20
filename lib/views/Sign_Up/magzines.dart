import 'package:flutter/material.dart';
import 'package:aecci/views/about app/advertise.dart';
import 'package:aecci/views/about app/viewpoint.dart';

class AdvertiseScreen extends StatelessWidget {
  const AdvertiseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  Advertise(),
                ),
              );
            },
            child: Image.asset(
              'assets/images/c4.png',
              width: double.infinity,
              height: 90,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  MagazineGridScreen(),
                ),
              );
            },
            child: Image.asset(
              'assets/images/c5.png',
              width: double.infinity,
              height: 90,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}

