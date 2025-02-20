import 'package:aecci/component/eplatform.dart';
import 'package:aecci/views/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Sign_Up/B2B.dart';
import 'Sign_Up/Collaborator.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isDropdownOpen = false;
  bool _rememberMe = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    // Get email and password from the controllers
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showMessage('Please enter both email and password');
      return;
    }


    try {
      final response = await http.post(
        // Uri.parse('https://e-platapi.aecci.org.in/loginClient/'),
        Uri.parse('http://localhost:3001/loginClient/'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
          'rememberMe': _rememberMe,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Login successful: ${data.toString()}');

        if (data['status'] == true) {
          _showMessage('Login successful: ${data['message']}');

          // Extract the authentication token
          final token = data['data']['token'];
          if (token == null) {
            _showMessage('Error: Authentication token not found');
            return;
          }

          // Extract user ID from info object
          final userId = data['info']['_id']?.toString();
          if (userId == null) {
            _showMessage('Error: User ID not found in response');
            return;
          }

          // Call the second GET API with the correct user ID and token
          final comDirDetailsResponse = await http.get(
            Uri.parse('https://e-platapi.aecci.org.in/getComDirDetails/$userId'),
            headers: {
              'Authorization': 'Bearer $token',  // Add token to headers
            },
          );

          if (comDirDetailsResponse.statusCode == 200) {
            print('ComDir details: ${comDirDetailsResponse.body}');
          } else {
            try {
              final errorData = json.decode(comDirDetailsResponse.body);
              print('Error response: ${errorData.toString()}');
              _showMessage('Error: ${errorData['message']}');
            } catch (e) {
              print('Failed to fetch ComDir details: ${comDirDetailsResponse.statusCode}');
              _showMessage('Failed to fetch ComDir details');
            }
          }

          // Pass both the user info and token to the dashboard
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DashboardScreen(
                loginData: data,
                getData: json.decode(comDirDetailsResponse.body),
                token: token,
              ),
            ),
          );
        } else {
          _showMessage('Login failed: ${data['message']}');
        }
      } else {
        final errorData = json.decode(response.body);
        print('Error response: ${errorData.toString()}');
        _showMessage('Error: ${errorData['message']}');
      }
    } catch (e) {
      print('Something went wrong: $e');
      _showMessage('Something went wrong. Please try again later.');
    }
  }


// Function to show a Snackbar message
  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 90),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 60,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Email',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'email',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  bool _obscureText = true;
                  return TextField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 18),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                  ),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Define a boolean to control dropdown visibility
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isDropdownOpen = !isDropdownOpen; // Toggle dropdown visibility
                            });
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Conditionally show the dropdown
                    if (isDropdownOpen)
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        width: double.infinity, // Makes the dropdown fill available width
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
                        child: Builder(
                          builder: (context) {
                            // Calculate available width for the dropdown
                            double availableWidth = MediaQuery.of(context).size.width - 60; // Subtracting horizontal padding (30 * 2)
                            return ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: availableWidth),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Sign up for B2B',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Icon(
                                          Icons.keyboard_arrow_right_outlined,
                                          color: Colors.grey,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      setState(() {
                                        isDropdownOpen = false; // Close the dropdown after selection
                                      });
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => B2BScreen1()),
                                      );
                                    },
                                  ),
                                  const Divider(height: 0, color: Colors.grey),
                                  ListTile(
                                    title: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Sign up for Collaborator',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Icon(
                                          Icons.keyboard_arrow_right_outlined,
                                          color: Colors.grey,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      setState(() {
                                        isDropdownOpen = false; // Close the dropdown after selection
                                      });
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Collaborator()),
                                      );
                                    },
                                  ),
                                  const Divider(height: 0, color: Colors.grey),
                                  ListTile(
                                    title: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Sign up for E-Platform',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right_outlined,
                                          color: Colors.grey,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      setState(() {
                                        isDropdownOpen = false; // Close the dropdown after selection
                                      });

                                      // Add any further actions if needed for E-Platform
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
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