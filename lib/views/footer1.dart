// import 'package:flutter/material.dart';
// import 'package:aecci/views/IntroScreen.dart';
// import 'package:aecci/views/footer.dart';
//
// class MainLayout extends StatefulWidget {
//   const MainLayout({Key? key}) : super(key: key);
//
//   @override
//   State<MainLayout> createState() => _MainLayoutState();
// }
//
// class _MainLayoutState extends State<MainLayout> {
//   int _currentIndex = 0;
//
//   // List of screens to display
//   final List<Widget> _screens = [
//     const IntroScreen(),
//     const SizedBox(), // Placeholder for index 1
//     const SizedBox(), // Placeholder for index 2
//     const MenuScreen(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_currentIndex],
//       bottomNavigationBar: CustomBottomNavBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }
//
// class CustomBottomNavBar extends StatefulWidget {
//   final int currentIndex;
//   final Function(int) onTap;
//
//   const CustomBottomNavBar({
//     Key? key,
//     required this.currentIndex,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
// }
//
// class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 55,
//       margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(25),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           _buildNavItem(0, Icons.home),
//           _buildNavItem(1, Icons.person_outline),
//           Container(
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               shape: BoxShape.circle,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.blue.withOpacity(0.3),
//                   blurRadius: 8,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: const Icon(
//               Icons.currency_rupee,
//               color: Colors.white,
//               size: 18,
//             ),
//           ),
//           _buildNavItem(2, Icons.credit_card),
//           _buildNavItem(3, Icons.menu),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildNavItem(int index, IconData icon) {
//     final isSelected = widget.currentIndex == index;
//     return GestureDetector(
//       onTap: () => widget.onTap(index),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             icon,
//             color: isSelected ? Colors.blue : Colors.grey,
//             size: 22,
//           ),
//         ],
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
//
// // Import your screens
// import 'package:aecci/views/footer.dart';
// import 'package:aecci/views/IntroScreen.dart';
//
// class CustomBottomNavBar extends StatefulWidget {
//   final int currentIndex;
//   final Function(int) onTap;
//
//   const CustomBottomNavBar({
//     Key? key,
//     required this.currentIndex,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
// }
//
// class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
//   void _handleNavigation(BuildContext context, int index) {
//     widget.onTap(index);
//
//     switch (index) {
//       case 0: // Home icon
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const IntroScreen()),
//         );
//         break;
//       case 3: // Menu icon
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const MenuScreen()),
//         );
//         break;
//     // Other indices (1, 2) will just update the selected index but not navigate
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 55,
//       margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(25),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           _buildNavItem(context, 0, Icons.home,),
//          // _buildNavItem(context, 1, Icons.person_outline),
//           Container(
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               shape: BoxShape.circle,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.blue.withOpacity(0.3),
//                   blurRadius: 8,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: const Icon(
//               Icons.currency_rupee,
//               color: Colors.white,
//               size: 18,
//             ),
//           ),
//         //  _buildNavItem(context, 2, Icons.credit_card),
//           _buildNavItem(context, 3, Icons.menu),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildNavItem(BuildContext context, int index, IconData icon) {
//     final isSelected = widget.currentIndex == index;
//     return GestureDetector(
//       onTap: () => _handleNavigation(context, index),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             icon,
//             color: isSelected ? Colors.blue : Colors.grey,
//             size: 22,
//           ),
//         ],
//       ),
//     );
//   }
// }


// 17 feb
// import 'package:flutter/material.dart';
//
// // Import your screens
// import 'package:aecci/views/footer.dart';
// import 'package:aecci/views/IntroScreen.dart';
// import 'package:aecci/views/footer.dart';
//
// class CustomBottomNavBar extends StatefulWidget {
//   final int currentIndex;
//   final Function(int) onTap;
//
//   const CustomBottomNavBar({
//     Key? key,
//     required this.currentIndex,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
// }
//
// class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
//   void _handleNavigation(BuildContext context, int index) {
//     widget.onTap(index);
//
//     switch (index) {
//       case 0: // Home
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const IntroScreen()),
//         );
//         break;
//       case 2: // More button (Floating + button)
//       case 3: // Menu
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const MenuScreen()), // ✅ Navigates to MenuScreen
//         );
//         break;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       clipBehavior: Clip.none, // Allows overflow
//       alignment: Alignment.bottomCenter,
//       children: [
//         // Bottom Navigation Bar
//         Container(
//           height: 50,
//           margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(25),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 blurRadius: 10,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _buildNavItem(context, 0, Icons.home, "Home"),
//               const SizedBox(width: 60), // Space for floating button
//               _buildNavItem(context, 3, Icons.login_sharp, "Login"),
//             ],
//           ),
//         ),
//
//         // Floating Circular Button with "+" Icon
//         Positioned(
//           bottom: 40, // Moves it above the navigation bar
//           child: Column(
//             children: [
//               GestureDetector(
//                 onTap: () => _handleNavigation(context, 2), // ✅ Clicking "+" navigates to MenuScreen
//                 child: Container(
//                   width: 50,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     shape: BoxShape.circle,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.blue.withOpacity(0.3),
//                         blurRadius: 8,
//                         offset: const Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: const Icon(Icons.add, color: Colors.white, size: 28),
//                 ),
//               ),
//               const SizedBox(height: 4), // Space between icon and text
//               const Text(
//                 "More",
//                 style: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.grey,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildNavItem(BuildContext context, int index, IconData icon, String label) {
//     final isSelected = widget.currentIndex == index;
//     return GestureDetector(
//       onTap: () => _handleNavigation(context, index),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             icon,
//             color: isSelected ? Colors.blue : Colors.grey,
//             size: 22,
//           ),
//           const SizedBox(height: 4),
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w500,
//               color: isSelected ? Colors.blue : Colors.grey,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

// Import your screens
import 'package:aecci/views/footer.dart';
import 'package:aecci/views/IntroScreen.dart';
import 'package:aecci/views/footer.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  void _handleNavigation(BuildContext context, int index) {
    widget.onTap(index);

    switch (index) {
      case 0: // Home
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const IntroScreen()),
        );
        break;
      case 2: // More button (Floating + button)
      case 3: // Menu
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MenuScreen()), // ✅ Navigates to MenuScreen
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Allows overflow
      alignment: Alignment.bottomCenter,
      children: [
        // Bottom Navigation Bar
        Container(
          height: 50,
          margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(context, 0, Icons.home, "Home"),
              const SizedBox(width: 60), // Space for floating button
              _buildNavItem(context, 3, Icons.login_sharp, "Login"),
            ],
          ),
        ),

        // Floating Circular Button with "+" Icon
        Positioned(
          bottom: 40, // Moves it above the navigation bar
          child: Column(
            children: [
              GestureDetector(
                onTap: () => _handleNavigation(context, 2), // ✅ Clicking "+" navigates to MenuScreen
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 28),
                ),
              ),
              const SizedBox(height: 4), // Space between icon and text
              const Text(
                "More",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(BuildContext context, int index, IconData icon, String label) {
    final isSelected = widget.currentIndex == index;
    return GestureDetector(
      onTap: () => _handleNavigation(context, index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.grey,
            size: 22,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
