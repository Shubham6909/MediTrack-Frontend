// import 'package:flutter/material.dart';
//
// class DashboardScreen extends StatefulWidget {
//   final Map<String, dynamic>? loginData;
//   final String? companyName;
//   final String? validUpTo;
//   final String? balance;
//
//   const DashboardScreen({
//     Key? key,
//     this.loginData,
//     this.companyName,
//     this.validUpTo,
//     this.balance,
//   }) : super(key: key);
//
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   bool showBalance = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         width: 350,
//         child: Card(
//           color: const Color(0xFFF5F3ED),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Membership No:',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Text(
//                       "${widget.loginData!['info']['memberShipNo']}",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   "${widget.companyName}",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   "Valid Upto: ${widget.validUpTo}",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Wallet Balance:",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         Text(
//                           showBalance ? "₹ ${widget.balance}" : "₹ ****",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                         IconButton(
//                           icon: Icon(
//                             showBalance ? Icons.visibility_off : Icons.visibility,
//                             color: Colors.black,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               showBalance = !showBalance;
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }