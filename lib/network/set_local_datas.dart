import 'package:shared_preferences/shared_preferences.dart';
import 'api_constants/api_constants.dart';

class SetLocalDatas {
  static setToken(String value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString("api_token", value);
    ApiConstants.jwtToken = value;
  }

  static loginBool() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString("Login", "");
  }
}
