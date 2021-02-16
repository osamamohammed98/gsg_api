import 'package:shared_preferences/shared_preferences.dart';

class SPHelper {
  SPHelper._();
  static SPHelper spHelper = SPHelper._();
  SharedPreferences preferences;
  Future<SharedPreferences> initSp() async {
    if (preferences == null) {
      preferences = await SharedPreferences.getInstance();
    } else {
      return preferences;
    }
  }

  saveToken(String token) {
    preferences.setString('token', token);
  }

  String getToken() {
    return preferences.getString('token');
  }

  clearToken() {
    preferences.remove('token');
  }
}
