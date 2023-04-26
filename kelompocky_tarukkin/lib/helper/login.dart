import 'package:shared_preferences/shared_preferences.dart';

class LoginHelper {
  static String userLoggedInKey = "userLoggedInKey";
  static String userFullNameKey = "userFullNameKey";
  static String userNameKey = "userNameKey";
  static String userEmailKey = "userEmailKey";

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(userLoggedInKey);
  }

  static Future<bool> saveUserNameSF(String userName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userNameKey, userName);
  }

  static Future<bool> saveUserFullNameSF(String fullName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userFullNameKey, fullName);
  }

  static Future<bool> saveUserEmailSF(String email) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userEmailKey, email);
  }

  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setBool(userLoggedInKey, isUserLoggedIn);
  }
}
