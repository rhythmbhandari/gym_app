import 'package:get/get.dart';
import 'package:gym_app/app/modules/auth/views/auth_customer_view.dart';
import 'package:gym_app/app/modules/auth/views/auth_gym_view.dart';
import 'package:gym_app/app/modules/gym/views/gym_details.dart';
import 'package:gym_app/app/modules/subscription/views/subscription_details.dart';
import 'package:gym_app/app/modules/subscription/views/subscription_payment.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/check_in/bindings/check_in_binding.dart';
import '../modules/check_in/views/check_in_view.dart';
import '../modules/gym/bindings/gym_binding.dart';
import '../modules/gym/views/gym_view.dart';
import '../modules/gym_map/bindings/gym_map_binding.dart';
import '../modules/gym_map/views/gym_map_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/subscription/bindings/subscription_binding.dart';
import '../modules/subscription/views/subscription_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),

    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.GYM_MAP,
      page: () => GymMapView(),
      binding: GymMapBinding(),
    ),
    GetPage(
      name: _Paths.GYM,
      page: () => GymView(),
      binding: GymBinding(),
    ),
    GetPage(
      name: _Paths.SUBSCRIPTION,
      page: () => SubscriptionView(),
      binding: SubscriptionBinding(),
    ),
    GetPage(
      name: _Paths.CHECK_IN,
      page: () => CheckInView(),
      binding: CheckInBinding(),
    ),
    GetPage(
      name: SubscriptionDetails.id,
      page: () => const SubscriptionDetails(),
    ),
    GetPage(
      name: SubscriptionPayment.id,
      page: () => const SubscriptionPayment(),
    ),
    GetPage(
      name: GymDetails.id,
      page: () => const GymDetails(),
    ),
    GetPage(
      name: AuthCustomerView.id,
      page: () => AuthCustomerView(),
      binding: AuthBinding(),

    ),
    GetPage(
      name: AuthGymView.id,
      page: () =>  AuthGymView(),
      binding: AuthBinding(),

    ),
  ];
}
