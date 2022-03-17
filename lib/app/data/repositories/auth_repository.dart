import 'dart:convert';
import 'dart:io';

import 'package:gym_app/app/config/constants.dart';
import 'package:gym_app/app/data/network/network_helper.dart';

import 'session_repository.dart';

class AuthRepository {
  static Future<bool> verifyLogin(String email, String password) async {
    const url = '$baseUrl/accounts/auth/jwt/create/';
    final body = jsonEncode({'email': email, 'password': password});
    try {
      final response = await NetworkHelper().postRequest(url, data: body);
      print("Status code is ${response.statusCode}");
      if (response.statusCode == 200) {
        final token = response.data['access'];
        SessionRepository.instance.setAccessToken(token);
        return true;
      } else if (response.statusCode == 401) {
        return Future.error('Invalid credentials. Please check your credentials.');
      } else {
        return Future.error(response.data['detail']);
      }
    } on SocketException {
      return Future.error(
          'Please check your internet connection and try again.');
    } catch (e) {
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
