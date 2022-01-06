import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static SharedPreferences? sharedPreferences;

  static setupSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static clearSharedPreferences() async {
    if (sharedPreferences != null) {
      await sharedPreferences?.clear();
    }
  }

  static setString(String data, String key) async {
    await sharedPreferences?.setString(key, data);
  }

  static String? getStringWithKey(String key) {
    return sharedPreferences?.getString(key);
  }

  static void setLang(String userData) {
    sharedPreferences?.setString('LANG', userData);
  }

  static String? getLang() {
    String? lang = sharedPreferences?.getString('LANG');
    return lang;
  }

  static Future<void> setToken(String token) async {
    await sharedPreferences?.setString('token', token);
  }

  static String? getToken() {
    String? token = sharedPreferences?.getString('token');
    return token ?? "";
  }

  static Future<bool?> removeToken() {
    Future<bool> removeToekn = sharedPreferences!.remove('token');
    return removeToekn;
  }
  static Future<bool?> removePhoneNumber() {
    Future<bool> phoneNumber = sharedPreferences!.remove('phoneNumber');
    return phoneNumber;
  }


 static Future<bool?> removeuserId() {
    Future<bool> userId = sharedPreferences!.remove('userId');
    return userId;
  }



  static String? userIsLogin() {
    String? logged =
        PreferencesManager.sharedPreferences?.getString("token") ?? "";
    return logged;
  }

  static void setUserEmail(String userEmail) {
    sharedPreferences?.setString('userEmail', userEmail);
  }

  static String? getUserEmail() {
    String? userEmail = sharedPreferences?.getString('userEmail');
    return userEmail;
  }

  static Future<void> setUserName(String userName) async {
    await sharedPreferences?.setString('userName', userName);
  }

  static String? getUserName() {
    String? userName = sharedPreferences?.getString('userName');
    return userName;
  }

  static Future<void> setPhonerNumber(String phoneNumber) async {
    await sharedPreferences?.setString('phoneNumber', phoneNumber);
  }

  static String? getPhoneNumber() {
    String? phoneNumber = sharedPreferences?.getString('phoneNumber');
    return phoneNumber;
  }

  static Future<void> setIdentityNumber(String identityNumber) async{
    await sharedPreferences?.setString('identityNumber', identityNumber);
  }

  static String? getIdentityNumber() {
    String? identityNumber = sharedPreferences?.getString('identityNumber');
    return identityNumber;
  }

  static Future<void> setUserId(String userId) async {
    await sharedPreferences?.setString('userId', userId);
  }

  static String? getUserId()   {
    String? userId = sharedPreferences?.getString('userId');
    return userId;
  }
}
