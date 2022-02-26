import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/app/modules/check_in/views/check_in_view.dart';
import 'package:gym_app/app/modules/gym/views/gym_view.dart';
import 'package:gym_app/app/modules/gym_map/views/gym_map_view.dart';
import 'package:gym_app/app/modules/profile/views/profile_view.dart';
import 'package:gym_app/app/modules/subscription/views/subscription_view.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController



  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
