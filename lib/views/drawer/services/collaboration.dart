import 'package:aecci/views/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CollaborationPortal(),
    );
  }
}

class CollaborationPortal extends StatefulWidget {
  @override
  _CollaborationPortalState createState() => _CollaborationPortalState();
}

class _CollaborationPortalState extends State<CollaborationPortal> {
  final List<String> countries = [
    "Brazil", "Cambodia", "Denmark", "Egypt",
    "Mexico", "Tanzania", "Bahamas", "Bosnia & Herzegovina",
    "Bangladesh", "Algeria", "Nigeria", "Vietnam",
    "United Kingdom", "China", "Pakistan", "Oman",
    "Turkey", "Greece", "Thailand", "Ethiopia",
    "South Sudan", "Sri Lanka", "UAE", "Uzbekistan",
    "Jordan"
  ];

  String? selectedCountry;
  String displayedImage = 'assets/images/Brazil.png';  // Default image

  void showPopup(BuildContext context, String country) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Use the country name to dynamically load the image
                Image.asset('assets/images/${country}1.png', fit: BoxFit.cover),

                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 4,
                  ),
                  child: const Text(
                    'Close',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: CustomDrawer(context: context),
      drawer: CustomDrawer(context: context, loginData: {}),
      appBar: AppBar(
        title: Image.asset(
          'assets/images/aecci3.png', // Path to your image asset
          height: 70, // Adjust the height of the image
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer
              },
            );
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.5,
                ),
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCountry = countries[index];
                        // Set image based on selected country
                        displayedImage = 'assets/images/${countries[index]}.png';
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        countries[index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );

                },
              ),
            ),
          ),
          if (selectedCountry != null)
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.blueGrey[900],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Image.asset(displayedImage, height: 100, width: 100, fit: BoxFit.contain,),
                            SizedBox(height: 10),
                            Text(
                              "$selectedCountry",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "($selectedCountry)",
                              style: TextStyle(color: Colors.white70),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                if (selectedCountry != null) {
                                  showPopup(context, selectedCountry!);  // Pass the selected country to showPopup
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 4,
                              ),
                              child: const Text(
                                'Read More',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Text(
                              "AECCI Collaboration with $selectedCountry",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "♦ Traders’ Support: A partnership for legal assistance in trade.",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "♦ Empowering Trade: Collaboration to empower exporters and importers.",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "♦ Legal Support: Expert guidance on legal matters.",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "This International collaboration supports trade industry exporters and importers.",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
