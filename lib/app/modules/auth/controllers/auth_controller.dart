import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/app/data/repositories/auth_repository.dart';
import 'package:gym_app/app/data/repositories/session_repository.dart';
import 'package:gym_app/app/data/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final progressStatus = false.obs;

  showProgressBar() => progressStatus.value = true;

  hideProgressBar() => progressStatus.value = false;
  UserRepository _userRepository;
  SharedPreferences _sharedPreferences;

  TextEditingController usernameInputController = TextEditingController();
  TextEditingController emailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();

  String username, password, email;
  final authError = ''.obs;
  final usernameError = ''.obs;
  final forgotError = ''.obs;
  final passwordError = ''.obs;
  final passwordInvisible = true.obs;
  final loginButtonEnabled = false.obs;
  final forgetButtonEnabled = false.obs;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();

    initializeData();
  }

  initializeData() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _userRepository = UserRepository(prefs: _sharedPreferences);
  }

  setUsernameError(String error) => authError.value = error;

  void setPasswordError(String error) => authError.value = error;

  void changePasswordVisibility(bool status) =>
      passwordInvisible.value = status;

  bool validate() {
    bool isValid = false;
    username = usernameInputController.text;
    password = passwordInputController.text;
    if (username.isEmpty) {
      setUsernameError('Username cannot be empty.');
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(username)) {
      setUsernameError('Invalid Email Address');
    } else if (password.length < 6) {
      setPasswordError('Password must contain at least 8 characters.');
    } else {
      isValid = true;
    }
    return isValid;
  }

  bool validateForget() {
    bool isValid = false;
    email = emailInputController.text;
    if (email.isEmpty) {
      forgotError.value = 'Email cannot be empty.';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      forgotError.value = 'Invalid Email Address.';
    } else {
      isValid = true;
    }
    return isValid;
  }

  checkLoginButtonEnabled() {
    username = usernameInputController.text;
    password = passwordInputController.text;
    loginButtonEnabled.value = (username.length > 3 && password.length > 4)
        ? loginButtonEnabled.value = true
        : false;
  }

  checkForgetPasswordEnabled() {
    email = emailInputController.text;
    forgetButtonEnabled.value =
        (email.length > 3) ? forgetButtonEnabled.value = true : false;
  }

  Future<bool> loginUser() async {
    showProgressBar();
    final status = await AuthRepository.verifyLogin(username, password)
        .catchError((error) {
        authError.value = error;
    });
    if (status == null) {
      return false;
    }
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    UserRepository userRepository = UserRepository(prefs: sharedPreferences);
    userRepository.login();
    await userRepository.setCustomerLogin(true);
    hideProgressBar();
    return true;
  }

  Future<bool> loginGym() async {
    showProgressBar();
    final status = await AuthRepository.verifyGymLogin(username, password)
        .catchError((error) {
        authError.value = error;
    });
    if (status == null) {
      return false;
    }
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    UserRepository userRepository = UserRepository(prefs: sharedPreferences);
    userRepository.login();
    await userRepository.setCustomerLogin(false);
    hideProgressBar();
    return true;
  }

  Future<bool> forgetPassword() async {
    showProgressBar();
    final status =
        await AuthRepository.resetPassword(email).catchError((error) {
      forgotError.value = error;
    });
    if (status == null) {
      return false;
    }
    return true;
  }

  @override
  void onClose() {}
}
