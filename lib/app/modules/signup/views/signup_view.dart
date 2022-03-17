import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gym_app/app/config/theme_colors.dart';
import 'package:gym_app/app/routes/app_pages.dart';
import 'package:gym_app/app/widgets/custom_button.dart';
import 'package:gym_app/app/widgets/email_input_textfield.dart';
import 'package:gym_app/app/widgets/password_input_textfield.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final FocusNode usernameNode = FocusNode();
  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final FocusNode confirmPasswordNode = FocusNode();

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
                        SizedBox(height: Get.height * 0.08),
                        Text(
                          'Create An \nAccount',
                          style: Get.textTheme.headline5.copyWith(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 28),
                        ),
                        SizedBox(height: Get.height * 0.04),
                        Text(
                          'Enter your Username and Password',
                          style: Get.textTheme.headline5.copyWith(
                              color: Colors.white,
                              fontFamily: 'Poppins',
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
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                            SizedBox(width: 20),
                            Flexible(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints.tightFor(height: 30),
                                child: EmailInputField(
                                  focusNode: usernameNode,
                                  hintText: 'Enter your username'.tr,
                                  labelText: 'Username'.tr,
                                  icon: Icons.email,
                                  textInputType: TextInputType.name,
                                  onChanged: (_) {
                                    controller.setUsernameError(null);
                                    controller.checkSignUpButtonEnabled();
                                  },
                                  onSubmit: (_) => node.requestFocus(emailNode),
                                  errorText: controller.usernameError.value,
                                  controller: controller.usernameInputController,
                                  inputColor: const Color(0xffC4C4C4),
                                  radius: 0,
                                  focusedRadius: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.05),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Email          ',

                              textAlign: TextAlign.right,
                              style: Get.textTheme.headline5.copyWith(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                            const SizedBox(width: 20),
                            Flexible(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints.tightFor(height: 30),
                                child: EmailInputField(
                                  focusNode: emailNode,
                                  hintText: 'Enter your email'.tr,
                                  labelText: 'Email'.tr,
                                  icon: Icons.email,
                                  textInputType: TextInputType.emailAddress,
                                  onChanged: (_) {
                                    controller.setEmailError(null);
                                    controller.checkSignUpButtonEnabled();
                                  },
                                  onSubmit: (_) => node.requestFocus(passwordNode),
                                  errorText: controller.emailError.value,
                                  controller: controller.emailInputController,
                                  inputColor: const Color(0xffC4C4C4),
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
                              'Password ',
                              textAlign: TextAlign.right,
                              style: Get.textTheme.headline5.copyWith(
                                  color: Colors.white,

                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                            const SizedBox(width: 20),
                            Flexible(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints.tightFor(height: 30),
                                child: Obx(() => PasswordTextField(
                                  textInputType: TextInputType.visiblePassword,
                                  labelText: 'Password'.tr,
                                  hintText: 'Enter password'.tr,
                                  focusNode: passwordNode,
                                  onChanged: (_) {
                                    controller.checkSignUpButtonEnabled();
                                    controller.setPasswordError(null);
                                  },
                                  onSubmit: (_) => node.requestFocus(confirmPasswordNode),
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
                        Row(
                          children: [
                            Text(
                              'Re-Enter \nPassword',
                              style: Get.textTheme.headline5.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  fontSize: 16),
                            ),
                            const SizedBox(width: 20),
                            Flexible(
                              child: ConstrainedBox(
                                constraints: BoxConstraints.tightFor(height: 30),
                                child: Obx(() => PasswordTextField(
                                  textInputType: TextInputType.visiblePassword,
                                  labelText: 'Re-Enter Password'.tr,
                                  hintText: 'Enter password'.tr,
                                  focusNode: confirmPasswordNode,
                                  onChanged: (_) {
                                    controller.checkSignUpButtonEnabled();
                                    controller.setConfirmPasswordError(null);
                                  },
                                  onSubmit: (_) => node.unfocus(),
                                  suffix: IconButton(
                                      icon: Icon(
                                        controller.confirmPasswordInvisible.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        size: 18,
                                      ),
                                      color: confirmPasswordNode.hasFocus
                                          ? primaryColor
                                          : confirmPasswordNode.hasFocus &&
                                          controller.confirmPasswordError !=
                                              null
                                          ? Colors.red
                                          : Colors.grey,
                                      onPressed: () => controller
                                          .changeConfirmPasswordVisibility(!controller
                                          .confirmPasswordInvisible.value)),
                                  obscureText:
                                  controller.confirmPasswordInvisible.value,
                                  errorText: controller.confirmPasswordError.value,
                                  controller:
                                  controller.confirmInputController,
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.05),
                        SizedBox(
                          width: 150,
                          child: Obx(() => CustomButton(
                            radius: 10,
                            onPressed: controller.signUpButtonEnabled.value
                                ? () async {
                              controller.signUpButtonEnabled.value = false;
                              if (controller.validate()) {
                                final status =
                                await controller.signUpUser();
                                if (status) {
                                  // await profileController
                                  //     .getUserDetails()
                                  //     .then((_) => profileController
                                  //     .updateUserData());
                                  Get.offAllNamed(Routes.HOME);
                                  controller.signUpButtonEnabled.value =
                                  true;
                                } else {
                                  // CustomSnackbar.showCustomSnackBar(
                                  // message: 'Login Failed!');
                                  controller.signUpButtonEnabled.value =
                                  true;
                                }
                              } else {}
                            }
                                : null,
                            text: 'Sign Up',
                            backgroundColor: controller.signUpButtonEnabled.value
                                ? const Color(0xff6779BA)
                                : Colors.grey,
                          )),
                        ),
                        SizedBox(height: Get.height * 0.05),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
