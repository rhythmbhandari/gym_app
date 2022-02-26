import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gym_app/app/config/theme_colors.dart';

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
        child: Column(
          children: [
            SizedBox(
              height: 70,
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
              padding: EdgeInsets.symmetric( vertical: 31),
              decoration: BoxDecoration(
                  color: Color(0xffE5E5E5).withOpacity(0.4), borderRadius: BorderRadius.circular(0)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'User Name: ',
                          textAlign: TextAlign.center,
                          style: Get.textTheme.headline5.copyWith(
                              color: Color(0xff435D6B),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Test User',
                          style: Get.textTheme.headline5.copyWith(
                              color: Color(0xff000000),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32,),
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
                      ),Expanded(
                        child: Text(
                          'XX',
                          style: Get.textTheme.headline5.copyWith(
                              color: Color(0xff000000),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32,),
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
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'XX',
                          style: Get.textTheme.headline5.copyWith(
                              color: Color(0xff000000),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32,),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Total \nGym Visited:',
                          textAlign: TextAlign.center,
                          style: Get.textTheme.headline5.copyWith(
                              color: Color(0xff435D6B),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ),Expanded(
                        child: Text(
                          'XX',
                          style: Get.textTheme.headline5.copyWith(
                              color: Color(0xff000000),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ),
                    ],
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
