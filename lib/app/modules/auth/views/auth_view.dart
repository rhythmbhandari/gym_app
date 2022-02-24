import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gym_app/app/config/theme_colors.dart';
import 'package:gym_app/app/widgets/custom_button.dart';
import 'package:gym_app/app/widgets/email_input_textfield.dart';
import 'package:gym_app/app/widgets/password_input_textfield.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  final FocusNode usernameNode = FocusNode();
  final FocusNode passwordNode = FocusNode();

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: Get.height * 0.1),
                    Text(
                      'Sign In',
                      style: Get.textTheme.headline5.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 28),
                    ),
                    SizedBox(height: Get.height * 0.055),
                    Text(
                      'Enter your Username and Password',
                      style: Get.textTheme.headline5.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 13),
                    ),
                    SizedBox(height: Get.height * 0.14),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Username',
                          style: Get.textTheme.headline5.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        SizedBox(width: 20),
                        Flexible(
                          child: ConstrainedBox(
                            constraints: BoxConstraints.tightFor(height: 30),
                            child: EmailInputField(
                              focusNode: usernameNode,
                              hintText: 'Enter your username'.tr,
                              labelText: 'Username'.tr,
                              icon: Icons.email,
                              textInputType: TextInputType.emailAddress,
                              onChanged: (_) {
                                controller.setUsernameError(null);
                                controller.checkLoginButtonEnabled();
                              },
                              onSubmit: (_) => node.requestFocus(passwordNode),
                              errorText: controller.usernameError.value,
                              controller: controller.usernameInputController,
                              inputColor: Color(0xffC4C4C4),
                              radius: 0,
                              focusedRadius: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.05),
                    Row(
                      children: [
                        Text(
                          'Password',
                          style: Get.textTheme.headline5.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        SizedBox(width: 20),
                        Flexible(
                          child: ConstrainedBox(
                            constraints: BoxConstraints.tightFor(height: 30),
                            child: Obx(() => PasswordTextField(
                                  textInputType: TextInputType.visiblePassword,
                                  labelText: 'Password'.tr,
                                  hintText: 'Enter password'.tr,
                                  focusNode: passwordNode,
                                  onChanged: (_) {
                                    controller.checkLoginButtonEnabled();
                                    controller.setPasswordError(null);
                                  },
                                  onSubmit: (_) => node.unfocus(),
                                  suffix: IconButton(
                                      icon: Icon(
                                        controller.passwordInvisible.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        size: 18,
                                      ),
                                      color: passwordNode.hasFocus
                                          ? primaryColor
                                          : passwordNode.hasFocus &&
                                                  controller.passwordError !=
                                                      null
                                              ? Colors.red
                                              : Colors.grey,
                                      onPressed: () => controller
                                          .changePasswordVisibility(!controller
                                              .passwordInvisible.value)),
                                  obscureText:
                                      controller.passwordInvisible.value,
                                  errorText: controller.passwordError.value,
                                  controller:
                                      controller.passwordInputController,
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.05),
                    Container(
                      width: 150,
                      child: Obx(() => CustomButton(
                            radius: 10,
                            onPressed: controller.loginButtonEnabled.value
                                ? () async {
                                    controller.loginButtonEnabled.value = false;
                                    if (controller.validate()) {
                                      final status =
                                          await controller.loginUser();
                                      if (status) {
                                        // await profileController
                                        //     .getUserDetails()
                                        //     .then((_) => profileController
                                        //     .updateUserData());
                                        Navigator.pop(context, true);
                                        controller.loginButtonEnabled.value =
                                            true;
                                      } else {
                                        // CustomSnackbar.showCustomSnackBar(
                                        // message: 'Login Failed!');
                                        controller.loginButtonEnabled.value =
                                            true;
                                      }
                                    } else {}
                                  }
                                : null,
                            text: 'Login',
                            backgroundColor: controller.loginButtonEnabled.value
                                ? Color(0xff6779BA)
                                : Colors.grey,
                          )),
                    ),
                    SizedBox(height: Get.height * 0.05),
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        Text(
                          "Don't have an account Yet? signup",
                          style: Get.textTheme.headline5.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
