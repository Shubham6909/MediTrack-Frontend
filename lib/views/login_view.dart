// import 'package:flutter/material.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   bool _rememberMe = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//             child: const Text('AECCI', style: TextStyle(color: Colors.white))),
//         backgroundColor: const Color(0xFF20533A),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 0.0, right: 0.0), // No padding for e-Platform section
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // e-Platform Section (Full Width, no side padding)
//               Container(
//                 width: double.infinity, // Full width
//                 decoration: BoxDecoration(
//                   color: Color(0xFF001C42), // Background color for the section
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0), // Padding for content inside
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'e-Platform',
//                         style: TextStyle(
//                           fontSize: 26,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       const Text(
//                         'Embark on a new era of seamless business solutions! AECCI proudly unveils its upgraded e-Platform.',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.white,
//                           height: 1.5,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // **Email Section with Custom Padding**
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0), // Custom padding for the email section
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.only(bottom: 8.0),
//                       child: Text(
//                         'Email',
//                         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Container(
//                       width: double.infinity,
//                       child: TextField(
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Colors.grey[200],
//                           hintText: 'Enter your email',
//                           contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8.0), // Border radius
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5.0),
//                             borderSide: BorderSide(color: Colors.grey), // Border color when not focused
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                             borderSide: BorderSide(color: Colors.grey), // Border color when focused
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               const SizedBox(height: 16),
//
//               // **Password Section with Custom Padding**
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0), // Custom padding for the password section
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.only(bottom: 8.0),
//                       child: Text(
//                         'Password',
//                         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Container(
//                       width: double.infinity,
//                       child: TextField(
//                         obscureText: true, // Obscure text for password
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Colors.grey[200],
//                           hintText: 'Enter your password',
//                           contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5.0),
//                             borderSide: BorderSide(color: Colors.grey),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                             borderSide: BorderSide(color: Colors.grey),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//
//
//               // "Remember Me" Checkbox and Forgot Password Link
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0), // Same padding for the row
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Transform.translate(
//                           offset: Offset(-12, 0),
//                           child: Checkbox(
//                             value: _rememberMe,
//                             onChanged: (bool? value) {
//                               setState(() {
//                                 _rememberMe = value!;
//                               });
//                             },
//                           ),
//                         ),
//                         Transform.translate(
//                           offset: Offset(-15, 0),
//                           child: const Text(
//                             'Remember me',
//                             style: TextStyle(fontSize: 14),
//                           ),
//                         ),
//                       ],
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         // Add Forgot Password logic here
//                       },
//                       child: const Text(
//                         'Forgot password?',
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//
//
//               // **Log In and Sign Up Buttons (with Custom Padding)**
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0), // Padding applied here too
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: ElevatedButton(
//                             onPressed: () {
//                               // Add Log In logic here
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Color(0xFFEB9B00),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                               padding: const EdgeInsets.symmetric(vertical: 5.0),
//                             ),
//                             child: const Text(
//                               'Log In',
//                               style: TextStyle(fontSize: 14, color: Colors.white),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           child: ElevatedButton(
//                             onPressed: () {
//                               // Add Sign Up logic here
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.blue,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                               padding: const EdgeInsets.symmetric(vertical: 5.0),
//                             ),
//                             child: const Text(
//                               'Sign Up',
//                               style: TextStyle(fontSize: 14, color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // Add Verify Documents logic here
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xFF4CAF50),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           padding: const EdgeInsets.symmetric(vertical: 12.0),
//                         ),
//                         child: const Text(
//                           'Verify Your Documents',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:aecci/component/eplatform.dart';
// import 'package:aecci/views/dashboard.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   bool _rememberMe = false;
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   // Function to call the API when Log In button is pressed
//   Future<void> _login() async {
//     // Get email and password from the controllers
//     String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();
//
//
//     // In your login success handler
//
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => DashboardScreen()),
//       );
//
//
//
//     if (email.isEmpty || password.isEmpty) {
//       // Show error if fields are empty
//       _showMessage('Please enter both email and password');
//       return;
//     }
//
//     try {
//       final response = await http.post(
//         Uri.parse('https://e-platapi.aecci.org.in/loginClient/'),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({
//           'email': email,
//           'password': password,
//           'rememberMe': _rememberMe,
//         }),
//       );
//
//       // Check if the response is successful
//       if (response.statusCode == 200) {
//         // Handle successful login
//         final data = json.decode(response.body);
//
//         // Print the payload (response body) to the console
//         print('Login successful: ${data.toString()}');
//
//
//         _showMessage('Login successful: ${data['message']}');
//       } else {
//         // Handle error if login fails
//         final errorData = json.decode(response.body);
//
//         print('Error response: ${errorData.toString()}');
//         _showMessage('Error: ${errorData['message']}');
//       }
//     } catch (e) {
//       print('Something went wrong: $e');
//       // Handle any errors
//       _showMessage('Something went wrong. Please try again later.');
//     }
//   }
//
//
//
//
//   // Function to show a message (Snackbar or alert)
//   void _showMessage(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Image.asset(
//             'assets/images/AECCI Logo (1).png', // Path to your image asset
//             height: 55, // Adjust the height of the image
//           ),
//         ),
//         backgroundColor: const Color(0xFF20533A),
//       ),
//
//       body:
//       Padding(
//         padding: const EdgeInsets.only(left: 0.0, right: 0.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               EPlatformSection(
//                 title: 'e-Platform',
//                 description:
//                 'Embark on a new era of seamless business solutions! AECCI proudly unveils its upgraded e-Platform.',
//               ),
//               const SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.only(bottom: 8.0),
//                       child: Text(
//                         'Email',
//                         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Container(
//                       width: double.infinity,
//                       child: TextField(
//                         controller: _emailController,
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Colors.grey[200],
//                           hintText: 'Enter your email',
//                           contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5.0),
//                             borderSide: BorderSide(color: Colors.grey),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                             borderSide: BorderSide(color: Colors.grey),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               const SizedBox(height: 16),
//
//               // **Password Section with Custom Padding**
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.only(bottom: 8.0),
//                       child: Text(
//                         'Password',
//                         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Container(
//                       width: double.infinity,
//                       child: TextField(
//                         controller: _passwordController,
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Colors.grey[200],
//                           hintText: 'Enter your password',
//                           contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5.0),
//                             borderSide: BorderSide(color: Colors.grey),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                             borderSide: BorderSide(color: Colors.grey),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               // "Remember Me" Checkbox
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Transform.translate(
//                           offset: Offset(-12, 0),
//                           child: Checkbox(
//                             value: _rememberMe,
//                             onChanged: (bool? value) {
//                               setState(() {
//                                 _rememberMe = value!;
//                               });
//                             },
//                           ),
//                         ),
//                         Transform.translate(
//                           offset: Offset(-15, 0),
//                           child: const Text(
//                             'Remember me',
//                             style: TextStyle(fontSize: 14),
//                           ),
//                         ),
//                       ],
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         // Add Forgot Password logic here
//                       },
//                       child: const Text(
//                         'Forgot password?',
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               const SizedBox(height: 20),
//
//               // Log In Button
//     Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0), // Padding applied here too
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: ElevatedButton(
//
//                             onPressed: _login,
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Color(0xFFEB9B00),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                               padding: const EdgeInsets.symmetric(vertical: 5.0),
//                             ),
//                             child: const Text(
//                               'Log In',
//                               style: TextStyle(fontSize: 14, color: Colors.white),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           child: ElevatedButton(
//                             onPressed: () {
//                               // Add Sign Up logic here
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.blue,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                               padding: const EdgeInsets.symmetric(vertical: 5.0),
//                             ),
//                             child: const Text(
//                               'Sign Up',
//                               style: TextStyle(fontSize: 14, color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // Add Verify Documents logic here
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xFF4CAF50),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           padding: const EdgeInsets.symmetric(vertical: 12.0),
//                         ),
//                         child: const Text(
//                           'Verify Your Documents',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:aecci/component/eplatform.dart';
import 'package:aecci/views/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to call the API when Log In button is pressed
  //30 jan correct
  // Future<void> _login() async {
  //   // Get email and password from the controllers
  //   String email = _emailController.text.trim();
  //   String password = _passwordController.text.trim();
  //
  //   if (email.isEmpty || password.isEmpty) {
  //     _showMessage('Please enter both email and password');
  //     return;
  //   }
  //
  //   try {
  //     final response = await http.post(
  //       Uri.parse('https://e-platapi.aecci.org.in/loginClient/'),
  //       headers: {'Content-Type': 'application/json'},
  //       body: json.encode({
  //         'email': email,
  //         'password': password,
  //         'rememberMe': _rememberMe,
  //       }),
  //     );
  //
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       print('Login successful: ${data.toString()}');
  //
  //       // ✅ Correct way to check if login is successful
  //       if (data['status'] == true) {
  //         _showMessage('Login successful: ${data['message']}');
  //
  //         // ✅ Navigate to Dashboard and pass loginData
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => DashboardScreen(loginData: data), // Pass response data
  //           ),
  //         );
  //       } else {
  //         _showMessage('Login failed: ${data['message']}');
  //       }
  //     } else {
  //       final errorData = json.decode(response.body);
  //       print('Error response: ${errorData.toString()}');
  //       _showMessage('Error: ${errorData['message']}');
  //     }
  //   } catch (e) {
  //     print('Something went wrong: $e');
  //     _showMessage('Something went wrong. Please try again later.');
  //   }
  // }

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
        Uri.parse('https://e-platapi.aecci.org.in/loginClient/'),
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

          // Pass the _id along with loginData
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DashboardScreen(
                loginData: data,  // Pass the full login data, including _id
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
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'assets/images/AECCI.png', // Path to your image asset
            height: 70, // Adjust the height of the image
          ),
        ),
        backgroundColor: Colors.white,
      ),

      body:
      Padding(
        padding: const EdgeInsets.only(left: 0.0, right: 0.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EPlatformSection(
                title: 'e-Platform',
                description:
                'Embark on a new era of seamless business solutions! AECCI proudly unveils its upgraded e-Platform.',
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Email',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: 'Enter your email',
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // **Password Section with Custom Padding**
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Password',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: 'Enter your password',
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // "Remember Me" Checkbox
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Transform.translate(
                          offset: Offset(-12, 0),
                          child: Checkbox(
                            value: _rememberMe,
                            onChanged: (bool? value) {
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(-15, 0),
                          child: const Text(
                            'Remember me',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // Add Forgot Password logic here
                      },
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Log In Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0), // Padding applied here too
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(

                            onPressed: _login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFEB9B00),
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
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Add Sign Up logic here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                            ),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add Verify Documents logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4CAF50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                        ),
                        child: const Text(
                          'Verify Your Documents',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
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
