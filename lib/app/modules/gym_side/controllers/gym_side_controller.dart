import 'package:get/get.dart';
import 'package:gym_app/app/data/repositories/session_repository.dart';
import 'package:gym_app/app/data/request/profile_request.dart';

class GymSideController extends GetxController {
  //TODO: Implement GymSideController
  final refreshValue = false.obs;
  final authError = ''.obs;

  final companyName = ''.obs;
  final description = ''.obs;
  final totalEarning = ''.obs;
  final totalEarningCurrency = ''.obs;
  final image = ''.obs;
  final qrCode = ''.obs;

  final count = 0.obs;

  @override
  void onInit() {
    callInitial();
    super.onInit();
  }

  callInitial() async {
    await getGymDetails();
    updateGymData();
  }

  updateGymData() {
    print('he');

    if (SessionRepository.instance.gymProfile != null) {
      companyName.value = SessionRepository.instance.gymProfile.companyName;
      description.value = SessionRepository.instance.gymProfile.description;
      totalEarning.value = SessionRepository.instance.gymProfile.totalEarning;
      totalEarningCurrency.value =
          SessionRepository.instance.gymProfile.totalEarningCurrency;
      image.value = SessionRepository.instance.gymProfile.image ?? '';
      qrCode.value = SessionRepository.instance.gymProfile.qrcode;
    }
  }

  Future<bool> getGymDetails() async {
    refreshValue.value = true;
    var response = await ProfileRequest.getGymProfile().catchError((error) {
      authError.value = error;
    });
    print('get user profile $response');
    if (response == null) {
      refreshValue.value = false;
      return false;
    }
    refreshValue.value = false;
    return true;
  }
}
