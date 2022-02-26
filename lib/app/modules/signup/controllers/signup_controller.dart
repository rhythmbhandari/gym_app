import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/app/data/repositories/auth_repository.dart';
import 'package:gym_app/app/data/repositories/session_repository.dart';
import 'package:gym_app/app/data/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupController extends GetxController {
  final progressStatus = false.obs;

  showProgressBar() => progressStatus.value = true;

  hideProgressBar() => progressStatus.value = false;
  UserRepository _userRepository;
  SharedPreferences _sharedPreferences;

  TextEditingController usernameInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();
  TextEditingController emailInputController = TextEditingController();
  TextEditingController confirmInputController = TextEditingController();

  String username, password, confirmPassword, email;
  String authError = '';
  final usernameError = ''.obs;
  final emailError = ''.obs;
  final confirmPasswordError = ''.obs;
  final passwordError = ''.obs;
  final passwordInvisible = true.obs;
  final confirmPasswordInvisible = true.obs;
  final signUpButtonEnabled = false.obs;

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

  setUsernameError(String error) => usernameError.value = error;

  setEmailError(String error) => emailError.value = error;

  void setPasswordError(String error) => passwordError.value = error;

  void setConfirmPasswordError(String error) =>
      confirmPasswordError.value = error;

  void changePasswordVisibility(bool status) =>
      passwordInvisible.value = status;

  void changeConfirmPasswordVisibility(bool status) =>
      confirmPasswordInvisible.value = status;

  bool validate() {
    bool isValid = false;
    print('here');
    username = usernameInputController.text;
    email = emailInputController.text;
    password = passwordInputController.text;
    confirmPassword = confirmInputController.text;
    if (username.isEmpty) {
      print('Username cannot be empty.');
      setUsernameError('Username cannot be empty.');
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      print('Email format is not correct');
      setEmailError('Email format is not correct');
    } else if (password != confirmPassword) {
      print('Password and Re-enter password do not match.');
      setPasswordError('Password and Re-enter password do not match.');
    } else if (password.length < 8) {
      print('Password must contain at least 8 characters.');
      setPasswordError('Password must contain at least 8 characters.');
    } else if (confirmPassword.length < 8) {
      print('Re-enter Password must contain at least 8 characters.');
      setConfirmPasswordError(
          'Re-enter Password must contain at least 8 characters.');
    } else {
      isValid = true;
    }
    return isValid;
  }

  checkSignUpButtonEnabled() {
    username = usernameInputController.text;
    email = emailInputController.text;
    password = passwordInputController.text;
    confirmPassword = confirmInputController.text;
    signUpButtonEnabled.value = (username.length > 3 &&
            email.length > 4 &&
            password.length > 4 &&
            confirmPassword.length > 4)
        ? signUpButtonEnabled.value = true
        : false;
  }

  Future<bool> signUpUser() async {
    showProgressBar();
    final status = await AuthRepository.registerUser(
            username, email, password, confirmPassword)
        .catchError((error) {
      if (error.contains('full header')) {
        authError =
            'Internet failed to establish proper connection. Try again.';
      } else {
        authError = error;
      }
    });
    if (status == null) {
      return false;
    }
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    UserRepository userRepository = UserRepository(prefs: sharedPreferences);
    userRepository.login(SessionRepository.instance.accessToken);
    //final detailStatus = await getUserDetails();
    final detailStatus = true;
    hideProgressBar();
    if (detailStatus)
      return true;
    else
      return false;
  }

  Future<void> saveToken() async {
    await _userRepository.login(SessionRepository.instance.accessToken);
  }

  @override
  void onClose() {}
}
