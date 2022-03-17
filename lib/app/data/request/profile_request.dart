import 'dart:io';

import 'package:gym_app/app/config/constants.dart';
import 'package:gym_app/app/data/model/customer.dart';
import 'package:gym_app/app/data/model/user.dart';
import 'package:gym_app/app/data/network/network_helper.dart';
import 'package:gym_app/app/data/repositories/session_repository.dart';

class ProfileRequest {
  static Future<User> getUserDetail() async {
    final headersWithToken = {
      'Content-Type': 'application/json',
      "Accept": "application/json",
      "Authorization": "JWT ${SessionRepository.instance.accessToken}"
    };

    // headers["Authorization"] = 'Bearer ${userData.token}';

    String url = '$baseUrl/accounts/profile/';
    try {
      final response =
          await NetworkHelper().getRequest(url, contentType: headersWithToken);
      print('Response $response');
      if (response.statusCode == 200) {
        print(response.data);
        List<User> predictionList = (response.data as List)
            .map((i) => User.fromJson(i))
            .toList();
        User user = predictionList[0];
        print("success");
        SessionRepository.instance.setUser(user);
        return user;
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

  static Future<Customer> getCustomerDetails() async {
    final headersWithToken = {
      'Content-Type': 'application/json',
      "Accept": "application/json",
      "Authorization": "JWT ${SessionRepository.instance.accessToken}"
    };

    // headers["Authorization"] = 'Bearer ${userData.token}';

    String url = '$baseUrl/customers/profile/';
    try {
      final response =
      await NetworkHelper().getRequest(url, contentType: headersWithToken);
      print('Response $response');
      if (response.statusCode == 200) {
        print(response.data);
        List<Customer> predictionList = (response.data as List)
            .map((i) => Customer.fromJson(i))
            .toList();
        Customer customer = predictionList[0];
        print("success");
        SessionRepository.instance.setCustomer(customer);
        return customer;
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
