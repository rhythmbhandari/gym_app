
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  SharedPreferences prefs;

  UserRepository({this.prefs});

  static const String _isLoggedIn = "is_logged_in";
  static const String _accessToken = "accessToken";
  static const String _appLaunchedPreviously = "is_app_launched_previously";

  appLaunched() async {
    await prefs.setBool(_appLaunchedPreviously, false);
  }

  Future<void> login(String accessToken) async {
    await prefs.setBool(_isLoggedIn, true);
    await prefs.setString(_accessToken, accessToken);
  }

  Future<bool> isLoggedIn() async {
    return prefs.containsKey(_isLoggedIn);
  }

  Future<bool> isAppLaunchedPreviously() async {
    return prefs.containsKey(_appLaunchedPreviously);
  }

  Future<String> getAccessToken() async {
    return prefs.getString(_accessToken);
  }

  Future logout() async {
    bool status = false;
    await prefs.remove(_isLoggedIn).then((value) {
      if (value) {
        status = true;
      }
    });
    await prefs.remove(_accessToken).then((value) {
      if (value) {
        status = true;
      }
    });
    return status;
  }

}