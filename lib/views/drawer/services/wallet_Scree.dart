// import 'package:flutter/material.dart';
// import 'package:aecci/views/drawer/custom_drawer.dart';
// import 'package:aecci/views/drawer/services/add_amount.dart';
//
// class WalletScreen extends StatefulWidget {
//   @override
//   _WalletScreenState createState() => _WalletScreenState();
// }
//
// class _WalletScreenState extends State<WalletScreen> {
//   int currentPage = 1;
//   final int itemsPerPage = 5;
//
//
//   final List<Map<String, dynamic>> transactionData = [
//     {
//       'srNo': '1',
//       'date': '08/07/2024',
//       'title': 'Electronic Certificate',
//       'code': 'eCO/2739/24-25',
//       'amount': '-70',
//       'approvedDate': '07/08/2024, 12:40',
//     },
//     {
//       'srNo': '2',
//       'date': '05/28/2024',
//       'title': 'Chamber Event Booking',
//       'code': 'CEB/002/24-25',
//       'amount': '0',
//       'approvedDate': '28/05/2024, 11:43',
//     },
//     {
//       'srNo': '3',
//       'date': '05/25/2024',
//       'title': 'Electronic Certificate',
//       'code': 'eCO/1226/24-25',
//       'amount': '-140',
//       'approvedDate': '25/05/2024, 19:14',
//     },
//     {
//       'srNo': '4',
//       'date': '05/25/2024',
//       'title': 'Electronic Certificate',
//       'code': 'eCO/1226/24-25',
//       'amount': '-140',
//       'approvedDate': '25/05/2024, 19:14',
//     },
//     {
//       'srNo': '5',
//       'date': '05/25/2024',
//       'title': 'Electronic Certificate',
//       'code': 'eCO/1226/24-25',
//       'amount': '-140',
//       'approvedDate': '25/05/2024, 19:14',
//     },
//     {
//       'srNo': '6',
//       'date': '05/25/2024',
//       'title': 'Electronic Certificate',
//       'code': 'eCO/1226/24-25',
//       'amount': '-140',
//       'approvedDate': '25/05/2024, 19:14',
//     },
//     {
//       'srNo': '7',
//       'date': '05/25/2024',
//       'title': 'Electronic Certificate',
//       'code': 'eCO/1226/24-25',
//       'amount': '-140',
//       'approvedDate': '25/05/2024, 19:14',
//     },
//     {
//       'srNo': '8',
//       'date': '05/25/2024',
//       'title': 'Electronic Certificate',
//       'code': 'eCO/1226/24-25',
//       'amount': '-140',
//       'approvedDate': '25/05/2024, 19:14',
//     },
//     {
//       'srNo': '9',
//       'date': '05/25/2024',
//       'title': 'Electronic Certificate',
//       'code': 'eCO/1226/24-25',
//       'amount': '-140',
//       'approvedDate': '25/05/2024, 19:14',
//     },
//     {
//       'srNo': '10',
//       'date': '05/25/2024',
//       'title': 'Electronic Certificate',
//       'code': 'eCO/1226/24-25',
//       'amount': '-140',
//       'approvedDate': '25/05/2024, 19:14',
//     },
//   ];
//
//   List<Map<String, dynamic>> get paginatedData {
//     final startIndex = (currentPage - 1) * itemsPerPage;
//     final endIndex = startIndex + itemsPerPage;
//     return transactionData.sublist(
//       startIndex,
//       endIndex > transactionData.length ? transactionData.length : endIndex,
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: CustomDrawer(context: context),
//       appBar: AppBar(
//         title: Text(
//           'Wallet',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: const Color(0xFF20533A),
//         centerTitle: true,
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               icon: const Icon(
//                 Icons.menu,
//                 color: Colors.white,
//                 size: 30,
//               ),
//               onPressed: () {
//                 Scaffold.of(context).openDrawer();
//               },
//             );
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Card(
//                 color: Colors.white,
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(Icons.account_balance, size: 28),
//                           SizedBox(width: 8),
//                           Text(
//                             'Your Registered Bank\nAccount Details',
//                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         'Please ensure the bank details are accurate',
//                         style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//                       ),
//                       SizedBox(height: 10),
//                       Row(
//                         children: [
//                           Chip(
//                             label: Text('Verified', style: TextStyle(color: Colors.white)),
//                             backgroundColor: Colors.blue,
//                           ),
//                           SizedBox(width: 12), // Add spacing between the Chip and Icon
//                           Icon(Icons.edit, color: Colors.grey),
//                         ],
//                       ),
//                       SizedBox(height: 8),
//                       Text('Bank Name: IndusInd Bank Ltd', style: TextStyle(fontWeight: FontWeight.bold)),
//                       Text('IFSC Code: INDB0000599'),
//                       Text('Name: Excellency Legalisation Services Pvt. Ltd.'),
//                       Text('Account No.: 159920200996'),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 5),
//               Card(
//                 color: Colors.white,
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Text('Balance: ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                               Text('₹ -229.00', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)),
//                               SizedBox(width: 5),
//                               Icon(Icons.refresh, color: Colors.grey),
//                             ],
//                           ),
//                           ElevatedButton(
//                             onPressed: () {
//                               Navigator.push(context, MaterialPageRoute(builder: (context) => AddAmountScreen()));
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.green,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(4),
//                               ),
//                               padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
//                             ),
//                             child: Text('+ Add Balance', style: TextStyle(fontSize: 14, color: Colors.white)),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Column(
//                           children: [
//                             DataTable(
//                               columnSpacing: 20.0,
//                               headingRowHeight: 36.0,
//                               dataRowHeight: 45.0,
//                               border: TableBorder.all(color: Colors.grey[300]!, width: 0.8),
//                               columns: [
//                                 DataColumn(label: Text('SR. NO', style: TextStyle(fontWeight: FontWeight.bold))),
//                                 DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
//                                 DataColumn(label: Text('Particulars', style: TextStyle(fontWeight: FontWeight.bold))),
//                                 DataColumn(label: Text('Amount', style: TextStyle(fontWeight: FontWeight.bold))),
//                                 DataColumn(label: Text('Approved Date', style: TextStyle(fontWeight: FontWeight.bold))),
//                               ],
//                               rows: paginatedData.map((item) => DataRow(
//                                 cells: [
//                                   DataCell(Text(item['srNo'])),
//                                   DataCell(Text(item['date'])),
//                                   DataCell(Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       Text(item['title'], style: TextStyle(fontSize: 12)),
//                                       Text(item['code'], style: TextStyle(fontSize: 12, color: Colors.grey)),
//                                     ],
//                                   )),
//                                   DataCell(Text(item['amount'], style: TextStyle(color: Colors.red))),
//                                   DataCell(Text(item['approvedDate'], style: TextStyle(color: Colors.green))),
//                                 ],
//                               )).toList(),
//                             ),
//                             SizedBox(height: 16),
//                             Container(
//                               width: 800, // Match this with your table width or adjust as needed
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   IconButton(
//                                     icon: Icon(Icons.chevron_left),
//                                     onPressed: currentPage > 1
//                                         ? () => setState(() => currentPage--)
//                                         : null,
//                                   ),
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       color: currentPage == 1 ? Colors.blue : Colors.transparent,
//                                       borderRadius: BorderRadius.circular(4),
//                                     ),
//                                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                                     child: Text(
//                                       '1',
//                                       style: TextStyle(
//                                         color: currentPage == 1 ? Colors.white : Colors.black,
//                                       ),
//                                     ),
//                                   ),
//                                   TextButton(
//                                     onPressed: () => setState(() => currentPage = 2),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         color: currentPage == 2 ? Colors.blue : Colors.transparent,
//                                         borderRadius: BorderRadius.circular(4),
//                                       ),
//                                       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                                       child: Text(
//                                         '2',
//                                         style: TextStyle(
//                                           color: currentPage == 2 ? Colors.white : Colors.black,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   IconButton(
//                                     icon: Icon(Icons.chevron_right),
//                                     onPressed: currentPage < (transactionData.length / itemsPerPage).ceil()
//                                         ? () => setState(() => currentPage++)
//                                         : null,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Card(
//                 color: Colors.white,
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(Icons.info, size: 25, color: Colors.black),
//                           SizedBox(width: 8),
//                           Text(
//                             'Wallet informative notes',
//                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 8),
//                       ...[
//                         'Payments should be initiated only from the company\'s registered & authorized bank account.',
//                         'A wallet balance of at least Rs. 3000 is necessary.',
//                         'Access to services will be suspended if the wallet balance falls below Rs. 600 until the minimum amount is deposited.',
//                         'Amounts will be deducted based on the services used, and you have the flexibility to download the ledger as needed.',
//                         'Please provide the correct screenshot of the payment proof upon making the payment.',
//                         'Include the appropriate payment UTR No. in the transaction details.',
//                         'The beneficiary Account displayed on this platform is unique to you only and is not to be shared with anyone else.',
//                         'For any additional assistance, contact Chamber desk.',
//                       ].map((note) => Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 4.0),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Icon(Icons.info, size: 16, color: Colors.black54),
//                             SizedBox(width: 8),
//                             Expanded(
//                               child: Text(note, style: TextStyle(fontSize: 14)),
//                             ),
//                           ],
//                         ),
//                       )),
//                       SizedBox(height: 16),
//                       Row(
//                         children: [
//                           Icon(Icons.account_balance, size: 28),
//                           SizedBox(width: 8),
//                           Text(
//                             'Chamber Account Details',
//                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 8),
//                       Text('Account Name: Asian Exporters Chamber of Comm and Ind'),
//                       Text('Bank Name: YES Bank'),
//                       Text('A/C No: 02168 87000 00780 (Current Account)'),
//                       Text('Branch Name: CBD Belapur'),
//                       Text('IFSC Code: YESB0000216'),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:aecci/views/drawer/custom_drawer.dart';
import 'package:aecci/views/drawer/services/add_amount.dart';
import 'package:aecci/views/drawer/company_details.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(context: context),
      appBar: AppBar(
        title: Text(
          'Wallet',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF20533A),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
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
    child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Card(
    color: Colors.white,
    child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    children: [
    Icon(Icons.account_balance, size: 28),
    SizedBox(width: 8),
    Text(
    'Your Registered Bank\nAccount Details',
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    ],
    ),
    SizedBox(height: 4),
    Text(
    'Please ensure the bank details are accurate',
    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
    ),
    SizedBox(height: 10),
      Row(
        children: [
          Chip(
            label: Text('Verified', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.blue,
          ),
          SizedBox(width: 12), // Add spacing between the Chip and Icon
          GestureDetector(
            onTap: () {
              // Navigate to the CompanyDetailsScreen when the icon is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CompanyDetailsScreen()),
              );
            },
            child: Icon(Icons.edit, color: Colors.grey),
          ),
        ],
      ),

      SizedBox(height: 8),
    Text('Bank Name: IndusInd Bank Ltd', style: TextStyle(fontWeight: FontWeight.bold)),
    Text('IFSC Code: INDB0000599'),
    Text('Name: Excellency Legalisation Services Pvt. Ltd.'),
    Text('Account No.: 159920200996'),
    ],
    ),
    ),
    ),
    SizedBox(height: 5),

    Card(
    color: Colors.white,
    child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Row(
    children: [
    Text('Balance: ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    Text('₹ -229.00', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)),
    SizedBox(width: 5),
    Icon(Icons.refresh, color: Colors.grey),
    ],
    ),
    ElevatedButton(
    onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddAmountScreen()));
    },
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.green,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
    ),
    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
    ),
    child: Text('+ Add Balance', style: TextStyle(fontSize: 14, color: Colors.white)),
    ),
    ],
    ),
    SizedBox(height: 10),
    SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: DataTable(
    columnSpacing: 20.0,
    headingRowHeight: 36.0,
    dataRowHeight: 45.0,
    border: TableBorder.all(color: Colors.grey[300]!, width: 0.8),
    columns: [
    DataColumn(label: Text('SR. NO', style: TextStyle(fontWeight: FontWeight.bold))),
    DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
    DataColumn(label: Text('Particulars', style: TextStyle(fontWeight: FontWeight.bold))),
    DataColumn(label: Text('Amount', style: TextStyle(fontWeight: FontWeight.bold))),
    DataColumn(label: Text('Approved Date', style: TextStyle(fontWeight: FontWeight.bold))),
    ],
    rows: [
    // Sample rows
    DataRow(cells: [
    DataCell(Text('1')),
    DataCell(Text('08/07/2024')),
    DataCell(Text('Electronic Certificate')),
    DataCell(Text('-70', style: TextStyle(color: Colors.red))),
    DataCell(Text('07/08/2024, 12:40', style: TextStyle(color: Colors.green))),
    ]),
      DataRow(cells: [
        DataCell(Text('1')),
        DataCell(Text('08/07/2024')),
        DataCell(Text('Electronic Certificate')),
        DataCell(Text('-70', style: TextStyle(color: Colors.red))),
        DataCell(Text('07/08/2024, 12:40', style: TextStyle(color: Colors.green))),
      ]),
      DataRow(cells: [
        DataCell(Text('1')),
        DataCell(Text('08/07/2024')),
        DataCell(Text('Electronic Certificate')),
        DataCell(Text('-70', style: TextStyle(color: Colors.red))),
        DataCell(Text('07/08/2024, 12:40', style: TextStyle(color: Colors.green))),
      ]),
      DataRow(cells: [
        DataCell(Text('1')),
        DataCell(Text('08/07/2024')),
        DataCell(Text('Electronic Certificate')),
        DataCell(Text('-70', style: TextStyle(color: Colors.red))),
        DataCell(Text('07/08/2024, 12:40', style: TextStyle(color: Colors.green))),
      ]),
      DataRow(cells: [
        DataCell(Text('1')),
        DataCell(Text('08/07/2024')),
        DataCell(Text('Electronic Certificate')),
        DataCell(Text('-70', style: TextStyle(color: Colors.red))),
        DataCell(Text('07/08/2024, 12:40', style: TextStyle(color: Colors.green))),
      ]),
      DataRow(cells: [
        DataCell(Text('1')),
        DataCell(Text('08/07/2024')),
        DataCell(Text('Electronic Certificate')),
        DataCell(Text('-70', style: TextStyle(color: Colors.red))),
        DataCell(Text('07/08/2024, 12:40', style: TextStyle(color: Colors.green))),
      ]),
      DataRow(cells: [
        DataCell(Text('1')),
        DataCell(Text('08/07/2024')),
        DataCell(Text('Electronic Certificate')),
        DataCell(Text('-70', style: TextStyle(color: Colors.red))),
        DataCell(Text('07/08/2024, 12:40', style: TextStyle(color: Colors.green))),
      ]),
      DataRow(cells: [
        DataCell(Text('1')),
        DataCell(Text('08/07/2024')),
        DataCell(Text('Electronic Certificate')),
        DataCell(Text('-70', style: TextStyle(color: Colors.red))),
        DataCell(Text('07/08/2024, 12:40', style: TextStyle(color: Colors.green))),
      ]),
      DataRow(cells: [
        DataCell(Text('1')),
        DataCell(Text('08/07/2024')),
        DataCell(Text('Electronic Certificate')),
        DataCell(Text('-70', style: TextStyle(color: Colors.red))),
        DataCell(Text('07/08/2024, 12:40', style: TextStyle(color: Colors.green))),
      ]),
      DataRow(cells: [
        DataCell(Text('1')),
        DataCell(Text('08/07/2024')),
        DataCell(Text('Electronic Certificate')),
        DataCell(Text('-70', style: TextStyle(color: Colors.red))),
        DataCell(Text('07/08/2024, 12:40', style: TextStyle(color: Colors.green))),
      ]),

    ],
    ),
    ),
    ],
    ),
    ),
    ),
    SizedBox(height: 10),
    Card(
    color: Colors.white,
    child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    children: [
    Icon(Icons.info, size: 25, color: Colors.black),
    SizedBox(width: 8),
    Text('Wallet informative notes', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    ],
    ),
    SizedBox(height: 8),
    ...[
    'Payments should be initiated only from the company\'s registered & authorized bank account.',
    'A wallet balance of at least Rs. 3000 is necessary.',
    'Access to services will be suspended if the wallet balance falls below Rs. 600 until the minimum amount is deposited.',
    ].map((note) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Icon(Icons.info, size: 16, color: Colors.black54),
    SizedBox(width: 8),
    Expanded(
    child: Text(note, style: TextStyle(fontSize: 14)),
    ),
    ],
    ),
    )),
    SizedBox(height: 16),
    Row(
    children: [
    Icon(Icons.account_balance, size: 28),
    SizedBox(width: 8),
    Text('Chamber Account Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    ],
    ),
    SizedBox(height: 8),
    Text('Account Name: Asian Exporters Chamber of Comm and Ind'),
    Text('Bank Name: YES Bank'),
    Text('A/C No: 02168 87000 00780 (Current Account)'),
    Text('Branch Name: CBD Belapur'),
    Text('IFSC Code: YESB0000216'),
    ],
    ),
    ),
    ),
    ],
    ),
    ),
    ),
    );
  }
}