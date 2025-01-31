import 'package:shared_preferences/shared_preferences.dart';

// Method to retrieve user data from SharedPreferences
Future<Map<String, String>> getUserData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String gstNo = prefs.getString('gstNo') ?? 'Not Available';
  String email = prefs.getString('email') ?? 'Not Available';

  return {'gstNo': gstNo, 'email': email};
}
