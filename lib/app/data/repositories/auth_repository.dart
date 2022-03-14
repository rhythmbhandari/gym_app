import 'dart:convert';
import 'dart:io';

import 'package:gym_app/app/config/constants.dart';
import 'package:gym_app/app/data/network/network_helper.dart';
import 'package:gym_app/app/modules/auth/models/login.dart';

import 'session_repository.dart';

class AuthRepository {
  static Future<bool> verifyLogin(String username, String password) async {
    const url = '$baseUrl/accounts/auth/jwt/create/';
    final Login login = Login(
        email: username,
        password: password);
    // final body = {'email': username, 'password': password};
    // print(url);
    // print(body);
    try {
      final response = await NetworkHelper().postRequest(url, data: json.encode(login));
      print("Response is ${response.statusCode}");
      if (response.statusCode == 200) {
        final token = response.data['access'];
        SessionRepository.instance.setAccessToken(token);
        return true;
      } else {
        // print('Error');
        return Future.error(response.statusMessage);
      }
    } on SocketException {
      // print('Socket');
      return Future.error(
          'Please check your internet connection and try again.');
    } catch (e) {
      // print('Exception');
      print(e.toString());
      return Future.error(e.toString());
    }

  }

  static Future<bool> registerUser(String username, String email,
      String password, String confirmPassword) async {
    const url = '$baseUrl/api/login';
    final body = jsonEncode({
      'username': username,
      'email': email,
      'password': password,
      'password2': confirmPassword
    });

    try {
      final response = await NetworkHelper().postRequest(url, data: body);
      if (response.statusCode == 200) {
        final token = response.data['token'];
        SessionRepository.instance.setAccessToken(token);
        return true;
      } else {
        return Future.error(response.statusMessage);
      }
    } on SocketException {
      return Future.error(
          'Please check your internet connection and try again.');
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
