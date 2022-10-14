import 'package:shared_preferences/shared_preferences.dart';

class SetLocalDatas {
  static setToken(String value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString("api_token", value);
  }
}
