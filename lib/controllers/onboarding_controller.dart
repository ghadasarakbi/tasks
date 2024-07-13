import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;
  PageController pageController = PageController();

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < 2) {
      pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  void skip() {
    pageController.animateToPage(2, duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  void login() {

  }
}
