import 'dart:convert';
import 'dart:io';

import 'package:gym_app/app/config/constants.dart';
import 'package:gym_app/app/data/model/gym.dart';
import 'package:gym_app/app/data/model/subscription.dart';
import 'package:gym_app/app/data/network/network_helper.dart';
import 'package:gym_app/app/data/repositories/session_repository.dart';

class DashboardRequest {
  static final  headersWithToken = {
    'Content-Type': 'application/json',
    "Accept": "application/json",
    "Authorization": "JWT ${SessionRepository.instance.accessToken}"
  };

  static Future<bool> serverVerification(String token, int price) async {
    const url = '$baseUrl/payment/confirm-payment/';
    final body = jsonEncode({'token': token, 'amount': price});
    try {
      final response = await NetworkHelper().postRequest(url, data: body, contentType: headersWithToken);
      print("Status code is ${response.statusCode}");
      print("Response ${response}");
      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 400) {
        return Future.error('Server verification failed.');
      } else {
        return Future.error(response.data['message']);
      }
    } on SocketException {
      return Future.error(
          'Please check your internet connection and try again.');
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<bool> buySubscription(String subscriptionId) async {
    final url = '$baseUrl/customers/subscribe/$subscriptionId/';
    print('Subscription $subscriptionId');
    try {
      final response = await NetworkHelper().getRequest(url, contentType: headersWithToken);
      print("Response is $response");
      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 400) {
        return Future.error('Could not complete transaction.');
      } else {
        return Future.error("Server failed. Please try again.");
      }
    } on SocketException {
      return Future.error(
          'Please check your internet connection and try again.');
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<List<Subscription>> getSubscription() async {
    String url = '$baseUrl/subscriptions/subscription/';
    try {
      final response =
      await NetworkHelper().getRequest(url, contentType:
      headersWithToken);
      print(response);
      if (response.statusCode == 200) {
        List<Subscription> subscriptionList = (response.data as List)
            .map((i) => Subscription.fromJson(i))
            .toList();
        return subscriptionList;
      } else if (response.statusCode == 404) {
        return [];
      }else {
        return Future.error(response.statusMessage);
      }
    } on SocketException {
      return Future.error(
          'Please check your internet connection and try again.');
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<List<Gym>> getGym() async {
    String url = '$baseUrl/gym/all-gyms/';
    try {
      final response =
      await NetworkHelper().getRequest(url, contentType:
      headersWithToken);
      print(response);
      if (response.statusCode == 200) {
        List<Gym> gymList = (response.data as List)
            .map((i) => Gym.fromJson(i))
            .toList();
        return gymList;
      } else if (response.statusCode == 404) {
        return [];
      }else {
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