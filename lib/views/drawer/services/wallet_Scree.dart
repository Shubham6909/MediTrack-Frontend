import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../../Dashboard_Pages/multi_card/Profile/compnay_card.dart';

class WalletScreen extends StatefulWidget {
  final Map<String, dynamic> loginData;
  final Map<String, dynamic> getData;
  final String userId;
  final  String token;

  const WalletScreen({
    required this.userId,
    required this.token,
    required this.getData,
    required this.loginData,
    Key? key,
  }) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  String? companyName, IFSCCode, registeredBank, registeredAccountNo, accountName;
  bool isLoading = true, isExpanded = false;
  List<dynamic> walletHistory = [];

  late Timer _timer;
  final ScrollController _scrollController = ScrollController();

  late TextEditingController bankNameController, accountNoController, ifscCodeController, accountNameController;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _initializeData();
    fetchWalletHistory();
    _startAutoScroll();
  }

  void _initializeControllers() {
    bankNameController = TextEditingController();
    accountNoController = TextEditingController();
    ifscCodeController = TextEditingController();
    accountNameController = TextEditingController();
  }

  void _initializeData() {
    final info = widget.loginData['info'];
    if (info != null) {
      companyName = info['companyName'] ?? 'N/A';
      IFSCCode = info['IFSCCode'] ?? 'N/A';
      registeredBank = info['registeredBank'] ?? 'N/A';
      registeredAccountNo = info['registeredAccountNo'] ?? 'N/A';
      accountName = info['accountName'] ?? 'N/A';

      bankNameController.text = registeredBank!;
      accountNoController.text = registeredAccountNo!;
      ifscCodeController.text = IFSCCode!;
    }
    setState(() => isLoading = false);
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (_scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final currentScroll = _scrollController.position.pixels;
        final newScroll = currentScroll + 1.5;
        if (newScroll >= maxScroll) {
          _scrollController.jumpTo(0.0);
        } else {
          _scrollController.jumpTo(newScroll);
        }
      }
    });
  }

  @override
  void dispose() {
    bankNameController.dispose();
    accountNoController.dispose();
    ifscCodeController.dispose();
    accountNameController.dispose();
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchWalletHistory() async {
    final url = 'https://e-platapi.aecci.org.in/getWalletHistory/${widget.userId}';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer ${widget.token}'},
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          walletHistory = data['data'];
        });
      } else {
        throw Exception('Failed to load wallet history');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Wallet Overview',
            style: TextStyle(
              color: Color(0xFF1748F8),
              fontSize: 18,
              height: 1.2,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF1748F8),
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home, color: Color(0xFF1748F8)),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.lightbulb_outline, color: Color(0xFF1748F8)),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Card(
              color: Color(0xFF1748F8),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.account_balance,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Your Registered Bank\nAccount Details',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        height: 1.2,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 4),

                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF1748F8),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(
                                    minWidth: 40,
                                    minHeight: 40,
                                  ),
                                  icon: const Icon(Icons.edit, color: Colors.white),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CompnayCard(
                                          loginData: widget.loginData, // Access loginData passed to WalletScreen
                                          // Access token passed to WalletScreen
                                          getData: widget.getData, token: {}, // Access getData passed to WalletScreen
                                        ),
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
                    Text(
                      '              Please ensure the bank details\n             are accurate',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(

                      children: [
                        Chip(
                          label: const Text(
                            'Verified',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          backgroundColor: Color(0xFF1748F8),
                          padding: const EdgeInsets.symmetric(horizontal: 100),
                        ),
                      ],
                    ),
                    if (isExpanded) ...[
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bank Name',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '$registeredBank',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'IFSC Code',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '$IFSCCode',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Clipboard.setData(ClipboardData(text: 'INDB0000599'));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('IFSC Code copied to clipboard')),
                                  );
                                },
                                child: Icon(Icons.copy, size: 18, color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '$companyName',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Account No',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '$registeredAccountNo',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Clipboard.setData(ClipboardData(text: '159920200996'));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Account No. copied to clipboard')),
                                  );
                                },
                                child: Icon(Icons.copy, size: 18, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                    const SizedBox(height: 12),
                    Center(
                      child: TextButton(
                        onPressed: () => setState(() => isExpanded = !isExpanded),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              isExpanded ? "View Less Details" : "View More Details",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  border: TableBorder.all(color: Colors.grey), // Adding table borders
                  columns: [
                    DataColumn(label: Text('Particular', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Amount', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Balance', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Payment Type', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Remark', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  rows: walletHistory.map((entry) {
                    return DataRow(
                      cells: [
                        DataCell(Text(entry['Particular'] ?? 'N/A')),
                        DataCell(Text(entry['amount'].toString(), textAlign: TextAlign.right)),
                        DataCell(Text(entry['balance'].toString(), textAlign: TextAlign.right)),
                        DataCell(Text(entry['paymentType'] ?? 'N/A')),
                        DataCell(Text(entry['remark'] ?? 'N/A')),
                        DataCell(Text(entry['status'] ?? 'N/A', style: TextStyle(color: entry['status'] == 'Success' ? Colors.green : Colors.red))),
                        DataCell(Text(entry['createdAt'] ?? 'N/A')),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}





// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
//
// import '../../Dashboard_Pages/multi_card/Profile/compnay_card.dart';
//
// class WalletScreen extends StatefulWidget {
//   final Map<String, dynamic> loginData;
//   final Map<String, dynamic> getData;
//   final String userId;
//   final Map<String, dynamic> token;
//   // final String token;
//
//   const WalletScreen({required this.userId, required this.token, required this.getData, required this.loginData, Key? key}) : super(key: key);
//
//   @override
//   _WalletScreenState createState() => _WalletScreenState();
// }
//
// class _WalletScreenState extends State<WalletScreen> {
//   String? companyName, IFSCCode, registeredBank, registeredAccountNo, accountName;
//   bool isLoading = true, isVerified = false, isExpanded = false;
//   List<dynamic> walletHistory = [];
//
//   late Timer _timer;
//   final ScrollController _scrollController = ScrollController();
//
//   late TextEditingController
//   bankNameController,
//       accountNoController,
//       ifscCodeController,
//       accountStatusController,
//       accountNameController;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchWalletHistory();
//     _initializeControllers();
//     _initializeData();
//     _startAutoScroll();
//   }
//
//
//   void _initializeControllers() {
//     bankNameController = TextEditingController();
//     accountNoController = TextEditingController();
//     ifscCodeController = TextEditingController();
//     accountStatusController = TextEditingController();
//     accountNameController = TextEditingController();
//   }
//
//   void _initializeData() {
//     final info = widget.loginData['info'];
//     if (info != null) {
//       setState(() {
//         companyName = info['companyName'] ?? 'N/A';
//         IFSCCode = info['IFSCCode'] ?? 'N/A';
//         registeredBank = info['registeredBank'] ?? 'N/A';
//         registeredAccountNo = info['registeredAccountNo'] ?? 'N/A';
//         accountName = info['accountName'] ?? 'N/A';
//
//         bankNameController.text = registeredBank!;
//         accountNoController.text = registeredAccountNo!;
//         ifscCodeController.text = IFSCCode!;
//       });
//     }
//     setState(() => isLoading = false);
//   }
//
//   void _startAutoScroll() {
//     const double scrollSpeed = 80.0;
//     const int frameDuration = 8;
//     _timer = Timer.periodic(Duration(milliseconds: frameDuration), (timer) {
//       if (_scrollController.hasClients) {
//         final maxScrollExtent = _scrollController.position.maxScrollExtent;
//         final currentScrollPosition = _scrollController.position.pixels;
//         final newScrollPosition = currentScrollPosition + scrollSpeed;
//         if (newScrollPosition >= maxScrollExtent) {
//           _scrollController.jumpTo(0.0);
//         } else {
//           _scrollController.animateTo(
//             newScrollPosition,
//             duration: Duration(milliseconds: frameDuration),
//             curve: Curves.decelerate,
//           );
//         }
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     bankNameController.dispose();
//     accountNoController.dispose();
//     ifscCodeController.dispose();
//     accountStatusController.dispose();
//     accountNameController.dispose();
//     _timer.cancel();
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   Future<void> fetchWalletHistory() async {
//     final url = 'https://e-platapi.aecci.org.in/getWalletHistory/${widget.userId}';
//     try {
//       final response = await http.get(
//         Uri.parse(url),
//         headers: {'Authorization': 'Bearer ${widget.token}'},
//       );
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           walletHistory = data['data'];
//           isLoading = false;
//         });
//       } else {
//         throw Exception('Failed to load wallet history');
//       }
//     } catch (e) {
//       print('Error: $e');
//       setState(() => isLoading = false);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             'Wings Overview',
//             style: TextStyle(
//               color: Color(0xFF1748F8),
//               fontSize: 18,
//               height: 1.2,
//             ),
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         scrolledUnderElevation: 0,
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Color(0xFF1748F8),
//             size: 30,
//           ),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.home, color: Color(0xFF1748F8)),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Icon(Icons.lightbulb_outline, color: Color(0xFF1748F8)),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       backgroundColor: Colors.grey.shade200,
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Card(
//                 color: Color(0xFF1748F8),
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.all(8),
//                             decoration: BoxDecoration(
//                               color: Colors.blue.withOpacity(0.1),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: const Icon(
//                               Icons.account_balance,
//                               size: 28,
//                               color: Colors.white,
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       const Text(
//                                         'Your Registered Bank\nAccount Details',
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                           height: 1.2,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       const SizedBox(height: 4),
//
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     color: Color(0xFF1748F8),
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   child: IconButton(
//                                     padding: EdgeInsets.zero,
//                                     constraints: BoxConstraints(
//                                       minWidth: 40,
//                                       minHeight: 40,
//                                     ),
//                                     icon: const Icon(Icons.edit, color: Colors.white),
//                                     onPressed: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) => CompnayCard(
//                                             loginData: widget.loginData, // Access loginData passed to WalletScreen
//                                             token: widget.token, // Access token passed to WalletScreen
//                                             getData: widget.getData, // Access getData passed to WalletScreen
//                                           ),
//                                         ),
//                                       );
//                                     },
//
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       Text(
//                         '              Please ensure the bank details\n             are accurate',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       Row(
//
//                         children: [
//                           Chip(
//                             label: const Text(
//                               'Verified',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             backgroundColor: Color(0xFF1748F8),
//                             padding: const EdgeInsets.symmetric(horizontal: 100),
//                           ),
//                         ],
//                       ),
//                       if (isExpanded) ...[
//                         const SizedBox(height: 20),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Bank Name',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             Text(
//                               '$registeredBank',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'IFSC Code',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   '$IFSCCode',
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {
//                                     Clipboard.setData(ClipboardData(text: 'INDB0000599'));
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(content: Text('IFSC Code copied to clipboard')),
//                                     );
//                                   },
//                                   child: Icon(Icons.copy, size: 18, color: Colors.white),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'Name',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             Text(
//                               '$companyName',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'Account No',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   '$registeredAccountNo',
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {
//                                     Clipboard.setData(ClipboardData(text: '159920200996'));
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(content: Text('Account No. copied to clipboard')),
//                                     );
//                                   },
//                                   child: Icon(Icons.copy, size: 18, color: Colors.white),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                       const SizedBox(height: 12),
//                       Center(
//                         child: TextButton(
//                           onPressed: () => setState(() => isExpanded = !isExpanded),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Text(
//                                 isExpanded ? "View Less Details" : "View More Details",
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Icon(
//                                 isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
//                                 color: Colors.white,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         scrollDirection: Axis.horizontal,
//         child: DataTable(
//           border: TableBorder.all(color: Colors.grey), // Adding table borders
//           columns: [
//             DataColumn(label: Text('Particular', style: TextStyle(fontWeight: FontWeight.bold))),
//             DataColumn(label: Text('Amount', style: TextStyle(fontWeight: FontWeight.bold))),
//             DataColumn(label: Text('Balance', style: TextStyle(fontWeight: FontWeight.bold))),
//             DataColumn(label: Text('Payment Type', style: TextStyle(fontWeight: FontWeight.bold))),
//             DataColumn(label: Text('Remark', style: TextStyle(fontWeight: FontWeight.bold))),
//             DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
//             DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
//           ],
//           rows: walletHistory.map((entry) {
//             return DataRow(
//               cells: [
//                 DataCell(Text(entry['Particular'] ?? 'N/A')),
//                 DataCell(Text(entry['amount'].toString(), textAlign: TextAlign.right)),
//                 DataCell(Text(entry['balance'].toString(), textAlign: TextAlign.right)),
//                 DataCell(Text(entry['paymentType'] ?? 'N/A')),
//                 DataCell(Text(entry['remark'] ?? 'N/A')),
//                 DataCell(Text(entry['status'] ?? 'N/A', style: TextStyle(color: entry['status'] == 'Success' ? Colors.green : Colors.red))),
//                 DataCell(Text(entry['createdAt'] ?? 'N/A')),
//               ],
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }

