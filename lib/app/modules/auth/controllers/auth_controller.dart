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
  TextEditingController passwordInputController = TextEditingController();

  String username, password;
  String authError = '';
  final usernameError = ''.obs;
  final passwordError = ''.obs;
  final passwordInvisible = true.obs;
  final loginButtonEnabled = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    initializeData();
  }

  initializeData() async{
    _sharedPreferences = await SharedPreferences.getInstance();
    _userRepository = UserRepository(prefs: _sharedPreferences);
  }

  setUsernameError(String error) => usernameError.value = error;

  void setPasswordError(String error) => passwordError.value = error;

  void changePasswordVisibility(bool status) =>
      passwordInvisible.value = status;


  bool validate() {
    bool isValid = false;
    username = usernameInputController.text;
    password = passwordInputController.text;
    if (username.isEmpty) {
      setUsernameError('Username cannot be empty.');
    } else if (password.length < 8) {
      setPasswordError('Password must contain at least 8 characters.');
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

  Future<bool> loginUser() async {
    showProgressBar();
    print('here');
    final status =
    await AuthRepository.verifyLogin(username, password).catchError((error) {
      if(error.contains('full header')){
        authError = 'Internet failed to establish proper connection. Try again.';
      }else{
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



  Future<void> saveToken() async{
    await _userRepository.login(SessionRepository.instance.accessToken);
  }

  @override
  void onClose() {}
}
