// import 'package:shared_preferences/shared_preferences.dart';
//
// // Method to save user data to SharedPreferences
// void saveUserData(Map<String, dynamic> userData) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//
//   // Saving the gstNo and email to SharedPreferences
//   prefs.setString('gstNo', userData['gstNo']);
//   prefs.setString('email', userData['email']);
// }

//
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../helper/shared_pref_helper.dart';
//
//
// // Method to fetch wallet history data from the API and store in SharedPreferences
// Future<void> fetchAndSaveWalletHistory(String userId) async {
//   final url = 'https://e-platapi.aecci.org.in/getWalletHistory/$userId';
//   print('Fetching data from: $url'); // Logging API URL
//
//   try {
//     final response = await http.get(Uri.parse(url));
//
//     print('Response Status Code: ${response.statusCode}'); // Logging status code
//     print('Response Body: ${response.body}'); // Logging API response
//
//     if (response.statusCode == 200) {
//       Map<String, dynamic> responseData = jsonDecode(response.body);
//
//       if (responseData['status'] == true) {
//         Map<String, dynamic> info = responseData['info'];
//         Map<String, dynamic> data = responseData['data'];
//
//         // Save user data using SharedPrefHelper class
//         await SharedPrefHelper.saveUserData(info, data);
//       } else {
//         print('Error: ${responseData['message']}'); // Logging API error message
//       }
//     } else {
//       print('Failed to load wallet history ❌');
//     }
//   } catch (e) {
//     print('Error: $e'); // Logging exception
//   }
// }
//
// // Example usage
// void main() async {
//   await fetchAndSaveWalletHistory('65d8a1553de8ca643de1d1c0'); // Replace with dynamic userId
//
//   // Fetch stored data
//   Map<String, String?> userData = await SharedPrefHelper.getUserData();
//   print('🔍 Retrieved User Data: $userData');
// }


import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> fetchAndSaveWalletHistory(String userId) async {
  final url = 'https://e-platapi.aecci.org.in/getWalletHistory/$userId';
  print('Fetching Wallet Data from: $url');

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);

      if (responseData['status'] == true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('walletData', jsonEncode(responseData['info']));
        print('✅ Wallet data saved successfully!');
      } else {
        print('⚠️ Error: ${responseData['message']}');
      }
    } else {
      print('❌ Failed to load wallet history');
    }
  } catch (e) {
    print('❌ Error: $e');
  }
}

