import 'package:get/get.dart';
import 'package:gym_app/app/data/model/subscription.dart';
import 'package:gym_app/app/data/request/dashboard_request.dart';

class SubscriptionController extends GetxController {
  //TODO: Implement SubscriptionController

  final List months = ["One", "Six", "Twelve", "Eighteen"];
  final List days = ["30", "180", "365", "540"];
  final List price = ["1500", "9000", "18000", "25000"];

  String error = '';
  final subscriptionList = [].obs;

  final refreshValue = false.obs;

  final selectedIndex = 0.obs;

  List<Subscription> subscriptionListModel;

  final selectedSubscription = Subscription().obs;

  setSelectedSubscription(Subscription subscription) =>
      selectedSubscription.value = subscription;

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

  Future<List<Subscription>> getSubscriptionList() async {
    await DashboardRequest.getSubscription().catchError((error) {
      this.error = error;
    }).then((value) {
      if (value == null) {
        return [];
      }
      if (value.isEmpty) {
        return [];
      }
      subscriptionList.value = value;
      subscriptionListModel = value;
      setSelectedSubscription(subscriptionList[0]);

    });
    return subscriptionListModel;
  }
}
