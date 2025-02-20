import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class QueryNotes extends StatefulWidget {
  @override
  _QueryNotesState createState() => _QueryNotesState();
}

class _QueryNotesState extends State<QueryNotes> {
  final List<String> images = [
    'assets/images/viewpoint.png',
    'assets/images/viewpoint1.png',
    'assets/images/viewpoint2.png',
    'assets/images/viewpoint2.png',
    'assets/images/viewpoint3.png',
    'assets/images/viewpoint5.png',
    'assets/images/viewpoint6.png',
    'assets/images/sir1.png',
    'assets/images/viewpoint.png',
    'assets/images/viewpoint.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Query Notes'),
        backgroundColor: Colors.indigo, // AppBar color
      ),
      body: Center(
        child: Container(
          width: 360,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Query Notes & Wing Consultation\n2 PM – 5.30 PM',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),

                  /// **Carousel Slider for Images**
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 120,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      viewportFraction: 0.4,
                    ),
                    items: images.map((image) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          image,
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
