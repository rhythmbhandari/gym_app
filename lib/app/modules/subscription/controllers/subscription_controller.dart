import 'package:get/get.dart';

class SubscriptionController extends GetxController {
  //TODO: Implement SubscriptionController
  final List months = ["One", "Six", "Twelve", "Eighteen"];
  final List days = ["30", "180", "365", "540"];
  final List price = ["1500", "9000", "18000", "25000"];

  final selectedIndex = 0.obs;

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
