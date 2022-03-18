import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    KhaltiScope(
        publicKey: "test_public_key_076c0fa9e4294cd8b5eddc3033bf1081",
        builder: (context, navigatorKey) {
          return GetMaterialApp(
            title: "Application",
            navigatorKey: navigatorKey,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ne', 'NP'),
            ],
            localizationsDelegates: const [
              KhaltiLocalizations.delegate
            ],
            debugShowCheckedModeBanner: false,
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          );
        }
    ),
  );
}
