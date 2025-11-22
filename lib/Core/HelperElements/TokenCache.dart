import 'package:shared_preferences/shared_preferences.dart';

class Tokencache {
  static Future<String> GetToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("Token") ?? "";
  }

  static Future<void> SetToken(String Token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Token", Token);
  }
}
