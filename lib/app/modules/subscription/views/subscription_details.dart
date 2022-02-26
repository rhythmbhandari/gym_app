import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/app/config/theme_colors.dart';
import 'package:gym_app/app/modules/subscription/controllers/subscription_controller.dart';
import 'package:gym_app/app/modules/subscription/views/subscription_payment.dart';

class SubscriptionDetails extends GetView<SubscriptionController> {
  static String id = '/detail';

  const SubscriptionDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 4,
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 12, top: 8, bottom: 8, right: 6),
                                child: const Center(
                                    child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                  size: 18,
                                )),
                              )),
                        ),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                    const SizedBox(height: 37),
                    Text(
                      "${controller.months[controller.selectedIndex.value]} Month",
                      style: Get.textTheme.headline5.copyWith(
                          color: const Color(0xff000000),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Text(
                        "${controller.days[controller.selectedIndex.value]} days check-in will be added to your account when you buy this item.",
                        textAlign: TextAlign.center,
                        style: Get.textTheme.headline5.copyWith(
                            color: const Color(0xff435D6B),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                    const Expanded(flex: 2, child: SizedBox()),
                    Center(
                      child: Image.asset(
                        'assets/dumb.png',
                        height: Get.width * 0.5,
                        width: Get.width * 1,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const Expanded(flex: 3, child: SizedBox()),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, bottom: 16),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: Get.textTheme.headline5.copyWith(
                            color: const Color(0xff435D6B),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                      Text(
                        'Rs. ${controller.price[controller.selectedIndex.value]}',
                        style: Get.textTheme.headline5.copyWith(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 24),
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(SubscriptionPayment.id, preventDuplicates: true);
                    },
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 19, vertical: 22),
                      decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10))),
                      child: Row(
                        children: [
                          const Icon(Icons.shopping_bag, color: Colors.white),
                          const SizedBox(width: 13),
                          Text(
                            'Buy Now',
                            style: Get.textTheme.headline5.copyWith(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
