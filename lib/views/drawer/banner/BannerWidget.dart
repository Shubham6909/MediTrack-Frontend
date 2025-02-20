import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:aecci/views/drawer/events/virtula_b2b_forum.dart';

class BannerWidget extends StatefulWidget {
  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final List<String> imagePaths = [
    'assets/images/Summer4.png',
    'assets/images/Summer4.png',
    'assets/images/Summer4.png',
  ];

  int _currentIndex = 0;
  PageController _pageController = PageController();

  void _handleImageTap(BuildContext context, int index) {
    if (index == 0) {
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

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: screenHeight * 0.18, // Increased height
          width: screenWidth * 0.92,
          child: CarouselSlider.builder(
            itemCount: imagePaths.length,
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 6),
              autoPlayAnimationDuration: Duration(milliseconds: 1500),
              autoPlayCurve: Curves.easeInOutCubic,
              enlargeCenterPage: true,
              viewportFraction: 0.86,
              height: screenHeight * 0.92, // Increased height
              enableInfiniteScroll: true,
              padEnds: false,
              pageSnapping: true,
              pauseAutoPlayOnTouch: true,
              pauseAutoPlayOnManualNavigate: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            itemBuilder: (context, index, realIndex) {
              return AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: _currentIndex == index ? 1.0 : 0.7,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: GestureDetector(
                      onTap: () => _handleImageTap(context, index),
                      child: Image.asset(
                        imagePaths[index % imagePaths.length],
                        fit: BoxFit.cover,
                        height: screenHeight * 0.21, // Increased height
                        errorBuilder: (context, error, stackTrace) {
                          print('Error loading image: $error');
                          return Center(
                            child: Icon(Icons.error, color: Colors.red),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            imagePaths.length,
                (index) => AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut, // Smooth transition
              margin: EdgeInsets.symmetric(horizontal: 8),
              width: _currentIndex == index ? 14 : 6, // Oval width
              height: _currentIndex == index ? 6 : 4, // Oval height
                  decoration: BoxDecoration(
                    color: _currentIndex == index ? Colors.black : Colors.grey.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(5), // Reduced height
                  ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}


// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:aecci/views/drawer/events/virtula_b2b_forum.dart';
//
// class BannerWidget extends StatefulWidget {
//   @override
//   _BannerWidgetState createState() => _BannerWidgetState();
// }

// class _BannerWidgetState extends State<BannerWidget> {
//   final List<BannerItem> bannerItems = [
//     BannerItem(
//       imagePath: 'assets/images/Summer4.png',
//       title: 'Your Title Here',
//       description: 'Your description text goes here',
//     ),
//     BannerItem(
//       imagePath: 'assets/images/Summer4.png',
//       title: 'Second Title',
//       description: 'Another description text',
//     ),
//     BannerItem(
//       imagePath: 'assets/images/Summer4.png',
//       title: 'Third Title',
//       description: 'Third description text',
//     ),
//   ];
//
//   int _currentIndex = 0;
//   late PageController _pageController;
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//     _checkForNullData();
//   }
//
//   // Debugging function to check for null values
//   void _checkForNullData() {
//     for (var item in bannerItems) {
//       if (item.title.isEmpty || item.description.isEmpty || item.imagePath.isEmpty) {
//         print('⚠️ Warning: BannerItem contains empty values! Data: $item');
//       }
//     }
//   }
//
//   void _handleImageTap(BuildContext context, int index) {
//     if (index == 0) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => VirtualB2BForumScreen(),
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         SizedBox(
//           height: screenHeight * 0.21,
//           width: screenWidth,
//           child: CarouselSlider.builder(
//             itemCount: bannerItems.length,
//             options: CarouselOptions(
//               autoPlay: true,
//               autoPlayInterval: Duration(seconds: 6),
//               autoPlayAnimationDuration: Duration(milliseconds: 1500),
//               autoPlayCurve: Curves.easeInOutCubic,
//               enlargeCenterPage: true,
//               viewportFraction: 1.0, // Full width
//               height: screenHeight * 0.21,
//               enableInfiniteScroll: true,
//               padEnds: false,
//               pageSnapping: true,
//               pauseAutoPlayOnTouch: true,
//               pauseAutoPlayOnManualNavigate: true,
//               onPageChanged: (index, reason) {
//                 setState(() {
//                   _currentIndex = index;
//                 });
//               },
//             ),
//             itemBuilder: (context, index, realIndex) {
//               return _buildBannerItem(context, bannerItems[index], index, screenWidth);
//             },
//           ),
//         ),
//         SizedBox(height: 10),
//         _buildCarouselIndicators(),
//       ],
//     );
//   }
//
//   Widget _buildBannerItem(BuildContext context, BannerItem item, int index, double screenWidth) {
//     return AnimatedOpacity(
//       duration: Duration(milliseconds: 500),
//       opacity: _currentIndex == index ? 1.0 : 0.7,
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 1),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(15),
//           child: Stack(
//             fit: StackFit.expand,
//             children: [
//               GestureDetector(
//                 onTap: () => _handleImageTap(context, index),
//                 child: Image.asset(
//                   item.imagePath.isNotEmpty ? item.imagePath : 'assets/images/placeholder.png',
//                   fit: BoxFit.cover,
//                   width: screenWidth,
//                   errorBuilder: (context, error, stackTrace) {
//                     print('Error loading image: $error');
//                     return Center(
//                       child: Icon(Icons.error, color: Colors.red),
//                     );
//                   },
//                 ),
//               ),
//               Positioned(
//                 left: 0,
//                 right: 0,
//                 bottom: 0,
//                 child: Container(
//                   padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.topCenter,
//                       colors: [
//                         Colors.black.withOpacity(0.8),
//                         Colors.transparent,
//                       ],
//                       stops: [0.0, 0.8],
//                     ),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         item.title.isNotEmpty ? item.title : "No Title Available",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           letterSpacing: 0.5,
//                         ),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       SizedBox(height: 6),
//                       Text(
//                         item.description.isNotEmpty ? item.description : "No Description Available",
//                         style: TextStyle(
//                           color: Colors.white.withOpacity(0.9),
//                           fontSize: 14,
//                           height: 1.2,
//                         ),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCarouselIndicators() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(
//         bannerItems.length,
//             (index) => AnimatedContainer(
//           duration: Duration(milliseconds: 300),
//           margin: EdgeInsets.symmetric(horizontal: 5),
//           width: _currentIndex == index ? 10 : 4,
//           height: _currentIndex == index ? 10 : 4,
//           decoration: BoxDecoration(
//             color: _currentIndex == index ? Colors.black : Colors.grey.withOpacity(0.7),
//             shape: BoxShape.circle,
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
// }
//
// // Updated BannerItem class with default values
// class BannerItem {
//   final String imagePath;
//   final String title;
//   final String description;
//
//   BannerItem({
//     required this.imagePath,
//     required this.title,
//     required this.description,
//   });
//
//   // Override toString for better debugging
//   @override
//   String toString() {
//     return 'BannerItem(title: $title, imagePath: $imagePath, description: $description)';
//   }
// }



