import 'package:flutter/material.dart';
import 'package:aecci/views/Sign_Up/B2B.dart';
import 'package:aecci/views/Sign_Up/Collaborator.dart';
import 'package:aecci/views/login_view.dart';
import 'package:aecci/views/login_view.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<Signup> {
  bool isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 130),
              Image.asset(
                'assets/images/aecci3.png',
                height: 130,
                fit: BoxFit.cover,
              ),
              const Text(
                'Asian Exporters Chamber of Commerce and Industry',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'OutFit',
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: const Text(
                  'AECCI B2B Forum app is here! Sign up, access e-services, and grow your business.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Impact',
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
              SizedBox(height: 45),

              // Dropdown section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    // Sign Up Button
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isDropdownOpen = !isDropdownOpen;  // Toggle dropdown
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 35), // Adjust horizontal padding
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min, // Shrinks to fit content
                        children: [
                          // Wrap the text in a Flexible widget to prevent overflow
                          Flexible(
                            child: const Text(
                              'Select category',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Impact',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 3,
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 15,
                            child: Icon(
                              isDropdownOpen
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_right_outlined,
                              color: Colors.purple,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),


                    if (isDropdownOpen)
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.start, // Aligns the text and icon to the left
                                children: [
                                  const Text(
                                    'Sign up for B2B',
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(
                                    Icons.keyboard_arrow_right_outlined,
                                    color: Colors.purple,
                                    size: 30,
                                  ),
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  isDropdownOpen = false;
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => B2BScreen1()),
                                );
                              },
                            ),


                            const Divider(height: 1),
                            ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.start, // Aligns the text and icon to the left
                                children: [
                                  const Text(
                                    'Sign up for Collaborator',
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(
                                    Icons.keyboard_arrow_right_outlined, // You can change this to any other icon you like
                                    color: Colors.purple,
                                    size: 30,
                                  ),
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  isDropdownOpen = false;
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Collaborator()),
                                );
                              },
                            ),

                            const Divider(height: 1),
                            ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.start, // Aligns the text and icon to the left
                                children: [
                                  const Text(
                                    'Sign up for E-Platform',
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right_outlined, // You can use any icon you prefer
                                    color: Colors.purple,
                                    size: 30,
                                  ),
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  isDropdownOpen = false;
                                });

                              },
                            ),

                          ],
                        ),
                      ),
                  ],
                ),
              ),

              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                            ),
                            child: const Text(
                              'Log In',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                            ),
                            child: const Text(
                              'Forgot Password',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
