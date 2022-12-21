import 'package:shared_preferences/shared_preferences.dart';

class GetLocalDatas {
  static Future<String?> getToken() async {
    var prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString("api_token");
    return token;
  }
}
