// import 'package:flutter/material.dart';
//
// class AccountOverviewCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Account Overview"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "SELECTED ACCOUNT",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8),
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               color: Colors.blue.shade700,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Asian Exporters Of",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       "021688700000780",
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.white70,
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       "Available balance",
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.white70,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       "₹ 30,257.01",
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: Text(
//                         "View More Details",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.white70,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton.icon(
//                   onPressed: () {},
//                   icon: Icon(Icons.share, color: Colors.blue),
//                   label: Text("Share my account details"),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Text(
//               "FREQUENT SERVICE REQUESTS",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 _buildServiceRequestTile(Icons.receipt_long, "Statement"),
//                 _buildServiceRequestTile(Icons.account_balance, "Fixed Deposit"),
//                 _buildServiceRequestTile(Icons.person_add_alt, "Nominee"),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildServiceRequestTile(IconData icon, String label) {
//     return Column(
//       children: [
//         Icon(icon, size: 36, color: Colors.blue),
//         SizedBox(height: 8),
//         Text(
//           label,
//           style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//         ),
//       ],
//     );
//   }
// }
