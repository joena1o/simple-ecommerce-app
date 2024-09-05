import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static void saveItem(String key, String value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  static Future<dynamic> getItem(String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var result = preferences.getString(key);
    return result;
  }
}
