// import 'dart:io';
//
// import 'package:aecci/views/drawer/custom_drawer.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:ui';
//
// class CertificateView extends StatelessWidget {
//   const CertificateView({Key? key}) : super(key: key);
//   Future<void> _downloadCertificate(BuildContext context) async {
//     try {
//       // Get application directory
//       final directory = await getApplicationDocumentsDirectory();
//       final path = directory.path;
//
//       // Copy asset to local storage
//       ByteData data = await rootBundle.load('assets/images/certificate.jpg');
//       List<int> bytes = data.buffer.asUint8List();
//       File file = File('$path/certificate.jpg');
//       await file.writeAsBytes(bytes);
//
//       // Show success message
//       if (context.mounted) {  // Check if context is still valid
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Certificate downloaded successfully'),
//           ),
//         );
//       }
//     } catch (e) {
//       // Show error message
//       if (context.mounted) {  // Check if context is still valid
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Failed to download certificate: ${e.toString()}'),
//           ),
//         );
//       }
//     }
//   }
//
//
//   void _showCertificateDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => Dialog(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             AppBar(
//               backgroundColor: Colors.white,
//               automaticallyImplyLeading: false,
//               toolbarHeight: 40, // Reduced height
//               elevation: 0, // Remove shadow
//               actions: [
//                 Padding(
//                   padding: const EdgeInsets.only(right: 8.0),
//                   child: IconButton(
//                     color: Colors.black,
//                     icon: const Icon(Icons.download),
//                     onPressed: () => _downloadCertificate(context),
//                     padding: EdgeInsets.zero, // Remove padding around icon
//                     constraints: const BoxConstraints(), // Remove minimum size constraints
//                   ),
//                 ),
//               ],
//             ),
//             // Removed Expanded and set fit for Image
//             InteractiveViewer(
//               child: Image.asset(
//                 'assets/images/certificate.jpg',
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: CustomDrawer(context: context),
//       appBar: AppBar(
//         title: Image.asset(
//           'assets/images/aecci3.png', // Path to your image asset
//           height: 70, // Adjust the height of the image
//         ),
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               icon: const Icon(
//                 Icons.menu,
//                 color: Colors.black,
//                 size: 30,
//               ),
//               onPressed: () {
//                 Scaffold.of(context).openDrawer(); // Open the drawer
//               },
//             );
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Certificate Header
//             Container(
//               padding: const EdgeInsets.all(10),
//               child: const Column(
//                 children: [
//                   Text(
//                     'Certificate of Membership',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     'Congratulations for attaining your membership certificate!',
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.green,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   Text(
//                     'You are now the part of AECCIs Members Fraternity.',
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.green,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.brown.shade300,
//                   width: 2,
//                 ),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   // Apply blur effect to the top half of the image using BackdropFilter
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(8), // Ensure the image stays rounded
//                     child: SizedBox(
//                       height: MediaQuery.of(context).size.height / 2, // Display half of the screen height
//                       child: BackdropFilter(
//                         filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Adjust blur level
//                         child: Image.asset(
//                           'assets/images/certificate.jpg',
//                           fit: BoxFit.cover, // Ensure the image fills the top half
//                         ),
//                       ),
//                     ),
//                   ),
//                   // GestureDetector for tapping the image to show the dialog
//                   GestureDetector(
//                     onTap: () => _showCertificateDialog(context),
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 5,
//                         vertical: 5,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                       child: const Text(
//                         'VIEW CERTIFICATE',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Text('Alert', style: TextStyle(color: Colors.blue, fontSize: 20)),
//             Text('Your membership subscription is''\n''           valid for 1149 days', style: TextStyle(color: Colors.red, fontSize: 18)),
//             ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//                 backgroundColor: Colors.blue,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8), // Adjust the radius as needed
//                 ), // Background color
//                 elevation: 4, // Shadow elevation
//               ),
//               child: const Text(
//                 'Renew Your Membership',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                 ),
//               ),
//             )
//
//
//
//           ],
//         ),
//       ),
//     );
//   }
//
//
// }


import 'dart:io';
import 'package:aecci/views/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui';

class CertificateView extends StatelessWidget {
  const CertificateView({Key? key}) : super(key: key);

  Future<void> _downloadCertificate(BuildContext context) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = directory.path;

      ByteData data = await rootBundle.load('assets/images/certificate.jpg');
      List<int> bytes = data.buffer.asUint8List();
      File file = File('$path/certificate.jpg');
      await file.writeAsBytes(bytes);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Certificate downloaded successfully'),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to download certificate: ${e.toString()}'),
          ),
        );
      }
    }
  }

  void _showCertificateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              toolbarHeight: 40,
              elevation: 0,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    color: Colors.black,
                    icon: const Icon(Icons.download),
                    onPressed: () => _downloadCertificate(context),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ),
              ],
            ),
            InteractiveViewer(
              child: Image.asset(
                'assets/images/certificate.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRenewalForm(BuildContext context) {
    String selectedPackage = '1 Year';
    Map<String, int> packageAmounts = {
      '1 Year': 10000,
      '2 Year': 20000,
      '3 Year': 30000,
      '5 Year': 50000,
    };

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), // 0 for a rectangular shape
            ),
            title: const Text(
              'Membership Renewal',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
              children: [
                const Text('For Renewal fill the below form'),
                Divider(color: Colors.grey),
                const SizedBox(height: 6),
                Text('Type of Memb : Corporate  Amount : ₹ ${packageAmounts[selectedPackage]}/-'),
                const Text('Memb NO. : AECCI/MEM/15-16/001'),
                const Text('Company Name : Excellency Legalisation Services Pvt.Ltd.'),
                Divider(color: Colors.grey),
                const SizedBox(height: 6),
                const Text(
                  'Package Selection :',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8.0, // Space between chips
                  runSpacing: 8.0, // Space between lines if wrapping occurs
                  children: packageAmounts.keys.map((package) {
                    return ChoiceChip(
                      label: Text(package),
                      selected: selectedPackage == package,
                      onSelected: (bool selected) {
                        setState(() {
                          selectedPackage = package;
                        });
                      },
                      backgroundColor: Colors.grey[200], // Background color when not selected
                      selectedColor: Colors.blue, // Background color when selected
                      labelStyle: TextStyle(
                        color: selectedPackage == package ? Colors.white : Colors.black, // Text color
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4), // Slightly rounded corners
                        side: BorderSide.none, // Remove border
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            actions: [
              TextButton(
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
                child: const Text('Cancel', style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  'Proceed Payment',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: CustomDrawer(context: context),
      drawer: CustomDrawer(context: context, loginData: {}),
      appBar: AppBar(
        title: Image.asset(
          'assets/images/aecci3.png',
          height: 70,
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
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: const Column(
                children: [
                  Text(
                    'Certificate of Membership',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Congratulations for attaining your membership certificate!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'You are now the part of AECCIs Members Fraternity.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.brown.shade300,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Image.asset(
                          'assets/images/certificate.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _showCertificateDialog(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'VIEW CERTIFICATE',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text('Alert', style: TextStyle(color: Colors.blue, fontSize: 20)),
            Text('Your membership subscription is\nvalid for 1149 days', style: TextStyle(color: Colors.red, fontSize: 18)),
            ElevatedButton(
              onPressed: () => _showRenewalForm(context),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 4,
              ),
              child: const Text(
                'Renew Your Membership',
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
  }
}