import 'package:flutter/material.dart';

class MagazineGridScreen extends StatelessWidget {
  final List<Map<String, dynamic>> magazineData = [
    {
      'year': '2025',
      'issues': [
        {'image': 'assets/viewpoint/1.png', 'month': 'February 2025'},
        {'image': 'assets/viewpoint/2.png', 'month': 'January 2025'},
      ]
    },
    {
      'year': '2024',
      'issues': [
        {'image': 'assets/viewpoint/3.png', 'month': 'November 2024'},
        {'image': 'assets/viewpoint/4.png', 'month': 'July 2024'},
        {'image': 'assets/viewpoint/5.png', 'month': 'September 2024'},
        {'image': 'assets/viewpoint/6.png', 'month': 'August 2024'},
        {'image': 'assets/viewpoint/7.png', 'month': 'July 2024'},
        {'image': 'assets/viewpoint/8.png', 'month': 'June 2024'},
        {'image': 'assets/viewpoint/9.png', 'month': 'May 2024'},
        {'image': 'assets/viewpoint/10.jpg', 'month': 'April 2024'},
        {'image': 'assets/viewpoint/13.png', 'month': 'April 2024'},
        {'image': 'assets/viewpoint/14.png', 'month': 'March 2024'},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'AECCI Viewpoint & Weekly',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: magazineData.map((yearData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  yearData['year'],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                Container(
                  width: double.infinity,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: yearData['issues'].length,
                    itemBuilder: (context, index) {
                      final issue = yearData['issues'][index];
                      return Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: AspectRatio(
                              aspectRatio: 0.7, // Ensures proper scaling
                              child: Image.asset(
                                issue['image'],
                                fit: BoxFit.contain, // Keeps full image visible
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            issue['month'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
