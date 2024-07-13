import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'presentations/screens/splash_screen.dart';
import 'controllers/onboarding_controller.dart';
import 'controllers/splash_controller.dart';

void main() {
  Get.put(OnboardingController());
  Get.put(SplashController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Onboarding',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'CoHeadline',
      ),
      home: SplashScreen(),
    );
  }
}
