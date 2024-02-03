import 'package:shared_preferences/shared_preferences.dart';

class LoginStorage {
  static final prefs = SharedPreferences.getInstance();
  static Future<void> setUserName(String userName) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user', userName);
  }

  static Future<void> setPassword(String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('password', password);
  }

  static Future<String?> getuserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user');
  }

  static Future<String?> getPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('password');
  }

  static Future<void> deleteAccount() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('password');
    prefs.remove('user');
  }
}
