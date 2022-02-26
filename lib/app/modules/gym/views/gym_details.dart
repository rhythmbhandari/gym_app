import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/app/config/theme_colors.dart';
import 'package:gym_app/app/modules/gym/controllers/gym_controller.dart';

class GymDetails extends GetView<GymController> {
  static String id = '/gym_detail';

  const GymDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 4,
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 12, top: 8, bottom: 8, right: 6),
                                child: const Center(
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.black,
                                      size: 18,
                                    )),
                              )),
                        ),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                    const SizedBox(height: 37),
                    Text(
                      "${controller.name[controller.selectedIndex.value]}",
                      style: Get.textTheme.headline5.copyWith(
                          color: const Color(0xff000000),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Text(
                        "We are located in ${controller.location[controller.selectedIndex.value]}. Our services are cardio, weightlifting, sauna etc.",
                        textAlign: TextAlign.center,
                        style: Get.textTheme.headline5.copyWith(
                            color: const Color(0xff435D6B),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                    const Expanded(flex: 2, child: SizedBox()),
                    Center(
                      child: Image.asset(
                        'assets/dumb.png',
                        height: Get.width * 0.5,
                        width: Get.width * 1,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const Expanded(flex: 3, child: SizedBox()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}