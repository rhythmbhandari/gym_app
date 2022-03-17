import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gym_app/app/config/theme_colors.dart';
import 'package:gym_app/app/data/repositories/session_repository.dart';
import 'package:gym_app/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'USER PROFILE',
          style: Get.textTheme.headline5.copyWith(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Obx(() => !controller.refreshValue.value
            ? Column(
                children: [
                  Row(
                    children: [
                      const Expanded(child: SizedBox(width: 16)),
                      GestureDetector(
                          onTap: () async {
                            controller.refreshValue.value = true;
                            await Future.wait([
                              controller.getUserDetails(),
                              controller.getCustomerDetails(),
                            ]);
                            await controller.updateUserData();
                            controller.refreshValue.value = false;
                          },
                          child: const Icon(Icons.refresh,
                              color: Color(0xff667C8A))),
                      const SizedBox(width: 23)
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/profile.png',
                      height: Get.width * 0.4,
                      width: Get.width * 0.5,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 22),
                    padding: EdgeInsets.symmetric(vertical: 31),
                    decoration: BoxDecoration(
                        color: Color(0xffE5E5E5).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(0)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'User Name:',
                                textAlign: TextAlign.center,
                                style: Get.textTheme.headline5.copyWith(
                                    color: Color(0xff435D6B),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            ),
                            Expanded(
                              child: Obx(() => Text(
                                    controller.name.value == null
                                        ? 'XX'
                                        : controller.name.value == ''
                                            ? 'XX'
                                            : controller.name.value,
                                    style: Get.textTheme.headline5.copyWith(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Subscription:',
                                textAlign: TextAlign.center,
                                style: Get.textTheme.headline5.copyWith(
                                    color: Color(0xff435D6B),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            ),
                            Expanded(
                              child: Obx(() => Text(
                                    controller.subscription.value == null
                                        ? 'XX'
                                        : controller.subscription.value == ''
                                            ? 'XX'
                                            : controller.subscription.value,
                                    style: Get.textTheme.headline5.copyWith(
                                        color: Color(0xff000000),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Remaining \nCheck-Ins:',
                                textAlign: TextAlign.center,
                                style: Get.textTheme.headline5.copyWith(
                                    color: Color(0xff435D6B),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            ),
                            Expanded(
                              child: Obx(() => Text(
                                    controller.remainingCheckIns.value == null
                                        ? 'XX'
                                        : controller.remainingCheckIns.value ==
                                                ''
                                            ? 'XX'
                                            : controller
                                                .remainingCheckIns.value,
                                    style: Get.textTheme.headline5.copyWith(
                                        color: Color(0xff000000),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              'Total \nCheck-Ins:',
                              textAlign: TextAlign.center,
                              style: Get.textTheme.headline5.copyWith(
                                  color: Color(0xff435D6B),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            )),
                            Expanded(
                              child: Obx(() => Text(
                                    controller.totalCheckIns.value == null
                                        ? 'XX'
                                        : controller.totalCheckIns.value == ''
                                            ? 'XX'
                                            : controller.totalCheckIns.value,
                                    style: Get.textTheme.headline5.copyWith(
                                        color: Color(0xff000000),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Center(
                child: Container(
                  height: Get.height,
                  width: Get.width,
                  color: Colors.white.withOpacity(0.4),
                  child: const Center(
                    child: SizedBox(
                      height: 75,
                      width: 75,
                      child: CircularProgressIndicator(
                          strokeWidth: 8,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              primaryColor)),
                    ),
                  ),
                ),
              )),
      ),
    );
  }
}
