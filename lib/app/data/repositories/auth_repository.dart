import 'dart:convert';
import 'dart:io';

import 'package:gym_app/app/config/constants.dart';

import 'session_repository.dart';

class AuthRepository {
  static Future<bool> verifyLogin(String email, String password) async {
    const url = '$baseUrl/api/login';
    final body = jsonEncode({'email': email, 'password': password});

    try {
      final response = await NetworkHelper.postRequest(url, body);
      if (response['message'].toString() == 'success') {
        final token = response['token'];
        SessionRepository.instance.setAccessToken(token);
        return true;
      } else {
        return Future.error(response['message']);
      }
    } on SocketException {
      return Future.error(
          'Please check your internet connection and try again.');
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}