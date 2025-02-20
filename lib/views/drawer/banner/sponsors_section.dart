import 'package:flutter/material.dart';
import 'dart:async';

class SponsorsSection extends StatefulWidget {
  const SponsorsSection({Key? key}) : super(key: key);

  @override
  State<SponsorsSection> createState() => _SponsorsSectionState();
}

class _SponsorsSectionState extends State<SponsorsSection> {
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;
  int _currentIndex = 0;

  final List<Map<String, String>> sponsors = [
    {'image': 'assets/images/1.png', 'name': 'NMR'},
    {'image': 'assets/images/2.png', 'name': 'NMR'},
    {'image': 'assets/images/3.png', 'name': 'NMR'},
    {'image': 'assets/images/4.png', 'name': 'NMR'},
    {'image': 'assets/images/5.png', 'name': 'NMR'},
    {'image': 'assets/images/6.png', 'name': 'NMR'},
    {'image': 'assets/images/7.png', 'name': 'NMR'},
    {'image': 'assets/images/8.png', 'name': 'NMR'},
    {'image': 'assets/images/9.png', 'name': 'NMR'},
    {'image': 'assets/images/10.png', 'name': 'NMR'},
    {'image': 'assets/images/11.png', 'name': 'NMR'},
    {'image': 'assets/images/12.png', 'name': 'NMR'},
    {'image': 'assets/images/13.png', 'name': 'NMR'},
    {'image': 'assets/images/14.png', 'name': 'NMR'},
    {'image': 'assets/images/15.png', 'name': 'NMR'},
    {'image': 'assets/images/16.png', 'name': 'NMR'},
    {'image': 'assets/images/17.png', 'name': 'NMR'},
    {'image': 'assets/images/18.png', 'name': 'NMR'},
    {'image': 'assets/images/19.png', 'name': 'NMR'},
    {'image': 'assets/images/21.png', 'name': 'NMR'},
    {'image': 'assets/images/22.png', 'name': 'NMR'},
    {'image': 'assets/images/23.png', 'name': 'NMR'},
    {'image': 'assets/images/24.png', 'name': 'NMR'},
    {'image': 'assets/images/25.png', 'name': 'NMR'},
    {'image': 'assets/images/26.png', 'name': 'NMR'},
    {'image': 'assets/images/27.png', 'name': 'NMR'},
    {'image': 'assets/images/28.png', 'name': 'NMR'},
    {'image': 'assets/images/29.png', 'name': 'NMR'},
    {'image': 'assets/images/30.png', 'name': 'NMR'},
    {'image': 'assets/images/31.png', 'name': 'NMR'},
    {'image': 'assets/images/32.png', 'name': 'NMR'},
    // {'image': 'assets/images/turkey.png', 'name': 'AWI & Co Legal Consultants'},
    // {'image': 'assets/images/muharam.png', 'name': 'NMR'},
    // {'image': 'assets/images/muharam1.png', 'name': 'Thesis Law Firm'},
    // {'image': 'assets/images/muharam2.png', 'name': 'Peons'},
    // {'image': 'assets/images/colorful.png', 'name': 'EGC India'},
    // {'image': 'assets/images/a5.png', 'name': 'EGC India'},
    // {'image': 'assets/images/v1.png', 'name': 'EGC India'},
    // {'image': 'assets/images/v2.png', 'name': 'EGC India'},
    // {'image': 'assets/images/v3.png', 'name': 'EGC India'},
    // {'image': 'assets/images/v4.png', 'name': 'EGC India'},
    //
    // {'image': 'assets/images/v5.png', 'name': 'NMR'},
    // {'image': 'assets/images/v6.png', 'name': 'NMR'},
    // {'image': 'assets/images/v7.png', 'name': 'NMR'},
    // {'image': 'assets/images/v8.png', 'name': 'NMR'},
    // {'image': 'assets/images/v9.png', 'name': 'NMR'},
    // {'image': 'assets/images/v10.png', 'name': 'NMR'},
    // {'image': 'assets/images/v11.png', 'name': 'NMR'},
    // {'image': 'assets/images/v11.png', 'name': 'NMR'},
    //
    // {'image': 'assets/images/v14.png', 'name': 'NMR'},
    // {'image': 'assets/images/v15.png', 'name': 'NMR'},
    // {'image': 'assets/images/v16.png', 'name': 'NMR'},
    // {'image': 'assets/images/v17.png', 'name': 'NMR'},
    // {'image': 'assets/images/v18.png', 'name': 'NMR'},
    // {'image': 'assets/images/v19.png', 'name': 'NMR'},
    // {'image': 'assets/images/v20.png', 'name': 'NMR'},
    // {'image': 'assets/images/v21.png', 'name': 'NMR'},

  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentIndex < sponsors.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }

      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _currentIndex * 102.0, // 90(width) + 12(padding)
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(), // Disable manual scrolling
                  child: Row(
                    children: sponsors.map((sponsor) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Container(
                          width: 90,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              sponsor['image']!,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}