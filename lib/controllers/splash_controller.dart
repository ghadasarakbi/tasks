import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/splash_data.dart';
import '../presentations/screens/main_screen.dart';

class SplashController extends GetxController {
  var splashData = <SplashData>[].obs;
  var isLoading = true.obs;
  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSplashData();
  }

  void fetchSplashData() async {
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse('https://admin.housemadecom.com/api/mobile/splash'),
        headers: {'Accept-Language': 'ar'},
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body)['data'] as List;
        splashData.value = data.map((item) => SplashData.fromJson(item)).toList();
      } else {
        Get.snackbar('Error', 'Failed to load data');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load data');
    } finally {
      isLoading.value = false;
    }
  }

  void updateIndex(int index) {
    currentIndex.value = index;
  }

  void navigateNextPage(PageController controller, Duration duration) {
    if (currentIndex.value == splashData.length - 1) {
      Get.to(() => MainPage());
    } else {
      controller.nextPage(duration: duration, curve: Curves.ease);
    }
  }

  void skipToOnboarding() {
    Get.to(() => MainPage());
  }
}
