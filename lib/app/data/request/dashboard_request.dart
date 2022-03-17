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