
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  SharedPreferences prefs;

  UserRepository({this.prefs});

  static const String _isLoggedIn = "is_logged_in";
  static const String _accessToken = "accessToken";
  static const String _refreshToken = "refreshToken";
  static const String _appLaunchedPreviously = "is_app_launched_previously";
  static const String _isCustomerLogin = "is_customer_login";
  static const String _customerLogin = "false";


  appLaunched() async {
    await prefs.setBool(_appLaunchedPreviously, false);
  }
  //
  // loginType() async {
  //   await prefs.setBool(_isCustomerLogin, false);
  // }

  Future<void> setCustomerLogin(bool status) async {
    await prefs.setBool(_customerLogin, status);
  }

  Future<bool> isCustomerLogin() async {
    return prefs.containsKey(_customerLogin);
  }

  Future<void> login(String accessToken, String refreshToken) async {
    await prefs.setBool(_isLoggedIn, true);
    await prefs.setString(_accessToken, accessToken);
    await prefs.setString(_refreshToken, refreshToken);
  }

  Future<bool> isLoggedIn() async {
    return prefs.containsKey(_isLoggedIn);
  }

  Future<bool> isAppLaunchedPreviously() async {
    return prefs.containsKey(_appLaunchedPreviously);
  }

  Future<bool> getloginType() async {
    return prefs.containsKey(_isCustomerLogin);
  }

  Future<String> getAccessToken() async {
    return prefs.getString(_accessToken);
  }

  Future<String> getRefreshToken() async {
    return prefs.getString(_refreshToken);
  }

  Future logout() async {
    await prefs.remove(_accessToken);
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
    await prefs.remove(_refreshToken).then((value) {
      if (value) {
        status = true;
      }
    });
    return status;
  }

}