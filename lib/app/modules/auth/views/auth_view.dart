import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gym_app/app/config/theme_colors.dart';
import 'package:gym_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:gym_app/app/routes/app_pages.dart';
import 'package:gym_app/app/widgets/custom_button.dart';
import 'package:gym_app/app/widgets/custom_snackbar.dart';
import 'package:gym_app/app/widgets/custom_input_textfield.dart';
import 'package:gym_app/app/widgets/password_input_textfield.dart';
import 'package:gym_app/app/widgets/top_snack_bar.dart';

import '../controllers/auth_controller.dart';
import 'auth_customer_view.dart';
import 'auth_gym_view.dart';

class AuthView extends GetView {

  const AuthView({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.height * 0.1),
                    Text(
                      'Sign In',
                      style: Get.textTheme.headline5.copyWith(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 28),
                    ),SizedBox(height: Get.height * 0.055),
                    Text(
                      'Welcome to gym app.',
                      style: Get.textTheme.headline5.copyWith(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 13),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Text(
                      'Please choose your sign in type.',
                      style: Get.textTheme.headline5.copyWith(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 13),
                    ),
                    SizedBox(height: Get.height * 0.1),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: CustomButton(
                                  radius: 10,
                                  onPressed: () {
                                    Get.toNamed(AuthGymView.id, preventDuplicates: true);                                  },
                                  text: 'Gym',
                                  backgroundColor:  Color(0xff6779BA),
                                ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: SizedBox(
                            child: CustomButton(
                              radius: 10,
                              onPressed: () {
                                Get.toNamed(AuthCustomerView.id, preventDuplicates: true);                              },
                              text: 'Customer',
                              backgroundColor: const Color(0xff6779BA),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.1),
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
