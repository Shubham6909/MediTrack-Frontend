// Create a base layout widget (put this in a new file, e.g., base_layout.dart)
import 'package:flutter/material.dart';
import 'package:aecci/views/footer.dart';
import 'package:aecci/views/IntroScreen.dart';
import 'package:aecci/views/drawer/events/virtula_b2b_forum.dart';

class BaseLayout extends StatelessWidget {
  final Widget child;
  final int currentIndex;

  const BaseLayout({
    Key? key,
    required this.child,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      floatingActionButton: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.only(bottom: 1),
        decoration: const BoxDecoration(
          color: Color(0xFF1B3149),
          shape: BoxShape.circle,
          boxShadow: [],
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.red,
              size: 28,
            ),
            label: 'Menu',
          ),
          const BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.article_outlined,
              color: Colors.green,
              size: 28,
            ),
            label: 'B2B Forum',
          ),
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey[600],
        backgroundColor: Colors.white,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MenuScreen()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => IntroScreen()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => VirtualB2BForumScreen()),
            );
          }
        },
      ),
    );
  }
}

