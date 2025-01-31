import 'package:shared_preferences/shared_preferences.dart';

// Method to save user data to SharedPreferences
void saveUserData(Map<String, dynamic> userData) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Saving the gstNo and email to SharedPreferences
  prefs.setString('gstNo', userData['gstNo']);
  prefs.setString('email', userData['email']);
}
