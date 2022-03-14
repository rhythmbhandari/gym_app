import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:get/get.dart';
import 'package:gym_app/app/config/theme_colors.dart';
import 'package:gym_app/app/data/repositories/session_repository.dart';
import 'package:gym_app/app/data/repositories/user_repository.dart';
import 'package:gym_app/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/check_in_controller.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class CheckInView extends StatefulWidget {
  const CheckInView({Key key}) : super(key: key);

  @override
  _CheckInViewState createState() => _CheckInViewState();
}

class _CheckInViewState extends State<CheckInView> {
  final CheckInController controller = Get.find();

  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Check-In',
            style: Get.textTheme.headline5.copyWith(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 16),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color(0xffE5E5E5).withOpacity(0.0),
        ),
        backgroundColor: const Color(0xffE5E5E5).withOpacity(0.5),
        body: SafeArea(
            child: Column(children: [
          Row(
            children: [
              const Expanded(child: SizedBox(width: 16)),
              GestureDetector(
                  onTap: () async {
                    // Get.toNamed(Routes.PROFILE, preventDuplicates: true);
                    UserRepository repository = UserRepository(
                        prefs: await SharedPreferences.getInstance());
                    await repository.logout();
                    SessionRepository.instance.setAccessToken(null);
                    Get.offAllNamed(Routes.AUTH);
                  },
                  child: const Icon(Icons.logout,
                      color: Color(0xff667C8A))),
              const SizedBox(width: 23)
            ],
          ),
          Image.asset(
            'assets/logo.png',
            height: Get.width * 0.6,
            width: Get.width * 0.8,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 37),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              "Click the Check-In button to open QR scanner.",
              textAlign: TextAlign.center,
              style: Get.textTheme.headline5.copyWith(
                  color: const Color(0xff435D6B),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
          ),
          const SizedBox(height: 37),
          GestureDetector(
            onTap: () {
              scanQR();
            },
            child: Container(
              width: Get.width * 0.43,
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 22),
              margin: const EdgeInsets.symmetric(horizontal: 19, vertical: 22),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(Icons.qr_code_scanner_rounded,
                      color: Colors.white),
                  const SizedBox(width: 13),
                  Text(
                    'Check-In',
                    style: Get.textTheme.headline5.copyWith(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                ],
              ),
            ),
          ),
        ])));
  }
}
