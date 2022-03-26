import 'dart:io';

import 'package:gym_app/app/config/constants.dart';
import 'package:gym_app/app/data/model/check_in_history.dart';
import 'package:gym_app/app/data/model/customer.dart' as c;
import 'package:gym_app/app/data/model/gym_profile.dart';
import 'package:gym_app/app/data/model/profile_update.dart';
import 'package:gym_app/app/data/model/user.dart';
import 'package:gym_app/app/data/network/network_helper.dart';
import 'package:gym_app/app/data/repositories/secure_storage.dart';
import 'package:gym_app/app/data/repositories/session_repository.dart';

import 'package:dio/dio.dart' as dio;
import 'package:gym_app/main.dart';

class ProfileRequest {




  static Future<GymProfile> getGymProfile() async {


    String url = '$baseUrl/gym/profile/';
    try {
      final response =
      await NetworkHelper().getRequest(url, contentType: await SecureStorage.returnHeaderToken());
      print('Response $response');
      if (response.statusCode == 200) {
        print(response.data);
        List<GymProfile> profileList =
        (response.data as List).map((i) => GymProfile.fromJson(i)).toList();
        GymProfile gym = profileList[0];
        print("success");
        SessionRepository.instance.setGymProfile(gym);
        return gym;
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

  static Future<User> getUserDetail() async {

    String url = '$baseUrl/accounts/profile/';
    try {
      final response =
          await NetworkHelper().getRequest(url, contentType: await SecureStorage.returnHeaderToken());
      print('Response $response');
      if (response.statusCode == 200) {
        print(response.data);
        List<User> userList =
            (response.data as List).map((i) => User.fromJson(i)).toList();
        User user = userList[0];
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

  static Future<c.Customer> getCustomerDetails() async {
    String url = '$baseUrl/customers/profile/';
    try {
      final response =
          await NetworkHelper().getRequest(url, contentType: await SecureStorage.returnHeaderToken());
      print('Response $response');
      if (response.statusCode == 200) {
        print(response.data);
        List<c.Customer> customerList =
            (response.data as List).map((i) => c.Customer.fromJson(i)).toList();
        c.Customer customer = customerList[0];
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

  static Future<String> getSubscriptionDetails() async {
    String url = '$baseUrl/customers/subscribe/';
    try {
      final response =
          await NetworkHelper().getRequest(url, contentType: await SecureStorage.returnHeaderToken());
      print('Response of subscription $response');
      print("response data is ${response.statusCode}");
      if (response.statusCode == 200) {
        final subscriptionName =
            response.data[0]["subscription_details"]["name"];
        SessionRepository.instance.setSubscribed(subscriptionName);
        // print(subscription);
        return subscriptionName;
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

  static Future<List<Subscribed>> getCheckInHistory() async {
    String url = '$baseUrl/gym/all-check-ins/';
    try {
      final response =
          await NetworkHelper().getRequest(url, contentType: await SecureStorage.returnHeaderToken());
      print('Response of subscription $response');
      print("response data is ${response.statusCode}");
      if (response.statusCode == 200) {
        List<Subscribed> subscribedList =
            (response.data as List).map((i) => Subscribed.fromJson(i)).toList();
        // print(subscribedList[0].gym.addressDetail.district);
        print(subscribedList);
        return subscribedList;
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

  static Future<bool> updateUserDetail(ProfileUpdateRequest user) async {
    final url =
        '$baseUrl/accounts/profile/${SessionRepository.instance.user.id}/';
    var formData = dio.FormData.fromMap({
      "name": user.name,
      "address": user.address,
      "image": user.image == null
          ? null
          : await dio.MultipartFile.fromFile(user.image.path),
    });
    try {
      final response = await NetworkHelper()
          .putRequest(url, data: formData, contentType: await SecureStorage.returnHeaderMultipartToken());
      if (response.statusCode == 200) {
        return true;
      } else {
        return Future.error('Profile cannot be updated.');
      }
    } on dio.DioError catch (e) {
      return Future.error(e.response.data.toString());
    } on SocketException {
      return Future.error(
          'Please check your internet connection and try again.');
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
