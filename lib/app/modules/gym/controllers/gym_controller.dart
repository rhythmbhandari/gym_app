import 'package:get/get.dart';

class GymController extends GetxController {
  //TODO: Implement GymController

  final List name = ["Fitness Corner", "Fitness Arena", "Sweat Arena", "Sweat Corner"];
  final List location = ["Balaju", "Tokha", "New Road", "Kakani"];
  final List phone = ["98********", "98********", "98********", "98********"];

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
