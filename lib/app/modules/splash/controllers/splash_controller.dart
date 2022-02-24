import 'package:get/get.dart';
import 'package:gym_app/app/routes/app_pages.dart';

class SplashController extends GetxController with StateMixin<dynamic>{
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    loader();
    super.onInit();
  }

  loader() async {

    Future.delayed(const Duration(seconds: 3)).then((value) async{

      change(value, status: RxStatus.success());
    });
  }


  @override
  void onClose() {}
  void increment() => count.value++;
}
