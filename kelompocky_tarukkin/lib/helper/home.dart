import 'package:shared_preferences/shared_preferences.dart';

class HomeHelper {
  static String userLoggedInKey = "userLoggedInKey";
  static String userFullNameKey = "userFullNameKey";
  static String userNameKey = "userNameKey";
  static String userEmailKey = "userEmailKey";

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(userLoggedInKey);
  }

  static Future<String?> getUserEmailFromSF() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(userEmailKey);
  }

  static Future<String?> getUserFullNameFromSF() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(userFullNameKey);
  }

  static Future<String?> getUserNameFromSF() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(userNameKey);
  }
}
