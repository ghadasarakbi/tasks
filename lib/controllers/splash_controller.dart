import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/splash_data.dart';
import '../presentations/screens/main_screen.dart';

class SplashController extends GetxController {
  var splashData = <SplashData>[].obs;
  var isLoading = true.obs;
  var hasError = false.obs;
  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSplashData();
  }

  void fetchSplashData() async {
    isLoading.value = true;
    hasError.value = false;
    try {
      final response = await http.get(
        Uri.parse('https://admin.housemadecom.com/api/mobile/splash'),
        headers: {
          'language': 'ar',
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body)['data'] as List;
        splashData.value = data.map((item) => SplashData.fromJson(item)).toList();
      } else {
        hasError.value = true;
        Get.snackbar('Error', 'Failed to load data');
      }
    } catch (e) {
      hasError.value = true;
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

  void skipToMain() {
    Get.to(() => MainPage());
  }

  void retryFetchingData() {
    fetchSplashData();
  }
}
