import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gym_app/app/config/theme_colors.dart';
import 'package:gym_app/app/routes/app_pages.dart';

import '../controllers/subscription_controller.dart';
import 'subscription_details.dart';

class SubscriptionView extends GetView<SubscriptionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Subscriptions',
          style: Get.textTheme.headline5.copyWith(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xffE5E5E5).withOpacity(0.0),
      ),
      backgroundColor: const Color(0xffE5E5E5).withOpacity(0.5),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(child: SizedBox(width: 16)),
                GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.PROFILE, preventDuplicates: true);
                    },
                    child: const Icon(Icons.perm_identity,
                        color: Color(0xff667C8A))),
                const SizedBox(width: 23)
              ],
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 60, top: 20, right: 60),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      controller.selectedIndex.value = index;
                      Get.toNamed(SubscriptionDetails.id, preventDuplicates: true);
                    },
                    child: SubscriptionWidget(
                      month: controller.months[index],
                      description: controller.days[index],
                      price: controller.price[index],
                    ),
                  );
                },
                itemCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubscriptionWidget extends StatelessWidget {
  const SubscriptionWidget(
      {Key key,
      @required this.month,
      @required this.description,
      @required this.price})
      : super(key: key);

  final String month;
  final String description;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 70),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
              height: 86,
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(15)),
              margin:
                  const EdgeInsets.symmetric(horizontal: 7.43, vertical: 6.42),
              child: Center(
                  child: Text(
                '$month Month',
                style: Get.textTheme.headline5.copyWith(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ))),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
                const SizedBox(width: 16),
                Expanded(
                  flex: 3,
                  child: Text(
                    "You get $description days as check-ins with this purchase",
                    style: Get.textTheme.headline5.copyWith(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ),
                const Expanded(flex: 1, child: SizedBox()),
                Text(
                  "Rs.\n$price ",
                  style: Get.textTheme.headline5.copyWith(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                const SizedBox(width: 6)
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
