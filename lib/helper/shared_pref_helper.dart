import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static Future<void> saveUserData(Map<String, dynamic> info, Map<String, dynamic> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('userId', info['_id']);
    await prefs.setString('companyName', info['companyName']);
    await prefs.setString('gstNo', info['gstNo']);
    await prefs.setString('email', info['email']);
    await prefs.setString('phoneNo', info['phoneNo'].toString()); // Ensure string format
    await prefs.setString('membershipNo', info['memberShipNo']);
    await prefs.setDouble('balance', info['balance'].toDouble());
    await prefs.setString('validUpTo', info['validUpTo']);
    await prefs.setString('token', data['token']);

    print('✅ User data stored successfully in SharedPreferences!');
  }

  // Method to retrieve stored data
  static Future<Map<String, String?>> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'userId': prefs.getString('userId'),
      'companyName': prefs.getString('companyName'),
      'gstNo': prefs.getString('gstNo'),
      'email': prefs.getString('email'),
      'phoneNo': prefs.getString('phoneNo'),
      'membershipNo': prefs.getString('membershipNo'),
      'balance': prefs.getDouble('balance')?.toString(),
      'validUpTo': prefs.getString('validUpTo'),
      'token': prefs.getString('token'),
    };
  }

  // Method to clear stored data
  static Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print('🗑️ User data cleared from SharedPreferences!');
  }
}
