
import 'package:flutter/material.dart';

import '../../dashboard.dart';
import '../../login_view.dart';
import '../custom_drawer.dart';



class CustomBottomNavBar extends StatefulWidget {
  final String token;
  final Map<String, dynamic>? loginData;
  final Map<String, dynamic>? getData;
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.token,
    this.loginData,
    this.getData,
  }) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  void _handleNavigation(BuildContext context, int index) {
    widget.onTap(index);

    switch (index) {
      case 0: // Home
        if (widget.token != null && widget.token!.isNotEmpty) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DashboardScreen(
                token: widget.token!,
                loginData: widget.loginData ?? {},
                getData: widget.getData ?? {},
              ),
            ),
          );
        } else {
          print("Error: Token is null or empty!");
        }
        break;
      case 2: // More button (Floating + button)
      case 3: // Menu
      Scaffold.of(context).openDrawer();
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
          height: 60,
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
              _buildNavItem(context, 3, Icons.login, "Login"),
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
                    // color: Colors.blue,
                    color: Color(0xFF1748F8),
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
              const SizedBox(height: 1),
              GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: const Text(
                  "More",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
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
      onTap: () {
        if (index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DashboardScreen(
                token: widget.token!,
                loginData: widget.loginData ?? {},
                getData: widget.getData ?? {},
              ),
            ),
          );
        } else if (index == 3) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        } else {
          _handleNavigation(context, index);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFF1748F8) : Colors.grey,
            size: 22,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isSelected ? const Color(0xFF1748F8) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}