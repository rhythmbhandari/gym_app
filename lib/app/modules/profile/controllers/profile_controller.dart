import 'package:get/get.dart';
import 'package:gym_app/app/data/repositories/session_repository.dart';
import 'package:gym_app/app/data/request/profile_request.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;
  final authError = ''.obs;
  final name = ''.obs;
  final subscription = ''.obs;
  final remainingCheckIns = ''.obs;
  final totalCheckIns = ''.obs;
  final email = ''.obs;
  final phone = ''.obs;
  final profilePic = ''.obs;
  final refreshValue = false.obs;

  @override
  void onInit() {

    super.onInit();
  }

  updateUserData() {
    if (SessionRepository.instance.user != null) {
      name.value = SessionRepository.instance.user.name;
      email.value = SessionRepository.instance.user.email ?? '';
      phone.value = SessionRepository.instance.user.phone;
    }
    if(SessionRepository.instance.customer != null){
      subscription.value = SessionRepository.instance.customer.subscription.toString();
      remainingCheckIns.value = SessionRepository.instance.customer.remainingCheckIns.toString();
      totalCheckIns.value = SessionRepository.instance.customer.totalCheckIns.toString();
    }

    // profilePic.value = SessionRepository.instance.user.;
  }

  Future<bool> getUserDetails() async {
    var response = await ProfileRequest.getUserDetail().catchError((error) {
      if (error.contains('full header')) {
        authError.value =
            'Internet failed to establish proper connection. Try again.';
      } else {
        authError.value = error;
      }
    });
    print('get user profile $response');
    if (response == null) {
      return false;
    }
    return true;
  }

  Future<bool> getCustomerDetails() async {
    var response =
        await ProfileRequest.getCustomerDetails().catchError((error) {
      if (error.contains('full header')) {
        authError.value =
            'Internet failed to establish proper connection. Try again.';
      } else {
        authError.value = error;
      }
    });
    print('get customer profile $response');
    if (response == null) {
      return false;
    }
    return true;
  }
}
