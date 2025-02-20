// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
//
// class BannerWidget extends StatefulWidget {
//   @override
//   _BannerWidgetState createState() => _BannerWidgetState();
// }
//
// class _BannerWidgetState extends State<BannerWidget> {
//   final List<String> imagePaths = [
//     'assets/images/virtual.png',
//     'assets/images/summer.png',
//     'assets/images/Summer1.png',
//     // 'assets/images/virtual.png',
//     // 'assets/images/virtual.png',
//     // 'assets/images/virtual.png',
//     // 'assets/images/virtual.png',
//     // 'assets/images/virtual.png',
//     // 'assets/images/virtual.png',
//     // 'assets/images/virtual.png'
//   ];
//
//   final List<String> imageTitles = [
//     'Goal 1 - National Integrity',
//     'Goal 2 - Equal Opportunity and Gender Equality',
//     'Goal 3 - Good Health and Well being',
//     // 'Goal 4 - Against Muscle and Money Power',
//     // 'Goal 5 - Uphold Secularism',
//     // 'Goal 6 - Industrial Development and\n    Infrastructure',
//     // 'Goal 7 - Employment and Economic Growth',
//     // 'Goal 8 - Justice, Peace, Calm and Prosperity',
//     // 'Goal 9 - Upliftment Farmers',
//     // 'Goal 10 - Quality Education',
//   ];
//
//   bool _isVisible = true;
//   int _currentIndex = 0; // Track the currently displayed image
//
//   void _toggleVisibility() {
//     setState(() {
//       _isVisible = !_isVisible;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Container(
//         height: _isVisible ? screenHeight * 0.20 : 50, // Adjusted height
//         width: screenWidth * 0.9,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           children: [
//             Expanded(
//               child: Stack(
//                 children: [
//                   if (_isVisible)
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: CarouselSlider.builder(
//                         itemCount: imagePaths.length,
//                         options: CarouselOptions(
//                           autoPlay: true,
//                           autoPlayInterval: Duration(seconds: 3),
//                           enlargeCenterPage: true,
//                           viewportFraction: 1.0,
//                           height: screenHeight * 0.2,
//                           enableInfiniteScroll: true,
//                           onPageChanged: (index, reason) {
//                             setState(() {
//                               _currentIndex = index;
//                             });
//                           },
//                         ),
//                         itemBuilder: (context, index, realIndex) {
//                           return Image.asset(
//                             imagePaths[index],
//                             width: double.infinity,
//                             fit: BoxFit.cover,
//                           );
//                         },
//                       ),
//                     ),
//                   if (!_isVisible)
//                     Center(
//                       child: Text(
//                         imageTitles[_currentIndex],
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   Positioned(
//                     top: 0,
//                     right: 8,
//                     child: InkWell(
//                       onTap: _toggleVisibility,
//                       borderRadius: BorderRadius.circular(30),
//                       child: Padding(
//                         padding: const EdgeInsets.all(4.0),
//                         child: Icon(
//                           _isVisible
//                               ? Icons.keyboard_arrow_down
//                               : Icons.keyboard_arrow_up,
//                           color: Colors.green,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 8),
//             if (_isVisible)
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 15.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: List.generate(
//                     imagePaths.length,
//                         (index) => AnimatedContainer(
//                       duration: Duration(milliseconds: 300),
//                       margin: EdgeInsets.symmetric(horizontal: 4),
//                       width: _currentIndex == index ? 10 : 6,
//                       height: _currentIndex == index ? 10 : 6,
//                       decoration: BoxDecoration(
//                         color: _currentIndex == index
//                             ? Colors.green
//                             : Colors.grey, // Active dot is green
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:aecci/views/drawer/events/virtula_b2b_forum.dart';
class BannerWidget extends StatefulWidget {
  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final List<String> imagePaths = [
    'assets/images/Splash1.png',
    'assets/images/Splash2.png',
    'assets/images/Splash3.png',
  ];
  int _currentIndex = 0;

  void _handleImageTap(BuildContext context, int index) {
    if (index == 0) { // Index 0 corresponds to virtual.png
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VirtualB2BForumScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: screenHeight * 0.18,
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CarouselSlider.builder(
                itemCount: imagePaths.length,
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                  height: screenHeight * 0.2,
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                itemBuilder: (context, index, realIndex) {
                  return GestureDetector(
                    onTap: () => _handleImageTap(context, index),
                    child: Container(
                      width: screenWidth * 0.9,
                      child: Image.asset(
                        imagePaths[index],
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          print('Error loading image: $error');
                          return Center(
                            child: Icon(Icons.error),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  imagePaths.length,
                      (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: _currentIndex == index ? 10 : 6,
                    height: _currentIndex == index ? 10 : 6,
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? Colors.green
                          : Colors.grey.withOpacity(0.7),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//dot...
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:aecci/views/drawer/events/virtula_b2b_forum.dart';
//
// class BannerWidget extends StatefulWidget {
//   @override
//   _BannerWidgetState createState() => _BannerWidgetState();
// }
//
// class _BannerWidgetState extends State<BannerWidget> {
//   final List<String> imagePaths = [
//     'assets/images/virtual.png',
//     'assets/images/summer.png',
//     'assets/images/Summer1.png',
//   ];
//
//   int _currentIndex = 0;
//
//   void _handleImageTap(int index) {
//     if (imagePaths[index] == 'assets/images/virtual.png') {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => VirtualB2BForumScreen()),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Container(
//         height: screenHeight * 0.20,
//         width: screenWidth * 0.9,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: CarouselSlider.builder(
//                 itemCount: imagePaths.length,
//                 options: CarouselOptions(
//                   autoPlay: true,
//                   autoPlayInterval: Duration(seconds: 3),
//                   enlargeCenterPage: true,
//                   viewportFraction: 1.0,
//                   height: screenHeight * 0.2,
//                   enableInfiniteScroll: true,
//                   onPageChanged: (index, reason) {
//                     setState(() {
//                       _currentIndex = index;
//                     });
//                   },
//                 ),
//                 itemBuilder: (context, index, realIndex) {
//                   return GestureDetector(
//                     onTap: () => _handleImageTap(index),
//                     child: Image.asset(
//                       imagePaths[index],
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                   );
//                 },
//               ),
//             ),
//             // Positioned indicator dots at the bottom
//             Positioned(
//               bottom: 6,
//               left: 0,
//               right: 0,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: List.generate(
//                   imagePaths.length,
//                       (index) => AnimatedContainer(
//                     duration: Duration(milliseconds: 300),
//                     margin: EdgeInsets.symmetric(horizontal: 4),
//                     width: _currentIndex == index ? 10 : 6,
//                     height: _currentIndex == index ? 10 : 6,
//                     decoration: BoxDecoration(
//                       color: _currentIndex == index
//                           ? Colors.green
//                           : Colors.green.withOpacity(0.5),
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         color: Colors.white.withOpacity(0.3),
//                         width: 1,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }