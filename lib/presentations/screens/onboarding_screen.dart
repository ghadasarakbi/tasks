import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/onboarding_controller.dart';
import '../widgets/onboarding_item.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnboardingController onboardingController = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: onboardingController.pageController,
            onPageChanged: onboardingController.onPageChanged,
            children: const [
              OnboardingItem(
                description: "أسهل طريقة للبحث عن أخصائيين التفصيل",
                imagePath: 'assets/photos/photo1.jpeg',
                index: 0,
              ),
              OnboardingItem(
                description: "افصل أو خذ المقاسات وأنت في مكانك",
                imagePath: 'assets/photos/photo2.jpeg',
                index: 1,
              ),
              OnboardingItem(
                description: "أمان تام ، ثقة وتعامل مضمون",
                imagePath: 'assets/photos/photo3.jpeg',
                index: 2,
              ),
            ],
          ),
          Positioned(
            bottom: 70,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: onboardingController.currentPage.value == 2
                      ? onboardingController.login
                      : onboardingController.nextPage,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
                    foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    padding: WidgetStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                    ),
                    elevation: WidgetStateProperty.all<double>(5),
                    shadowColor: WidgetStateProperty.all<Color>(
                        Colors.black.withOpacity(0.5)),
                  ),
                  child: Container(
                    width: 120,
                    height: 30,
                    alignment: Alignment.center,
                    child: Obx(() => Text(
                      onboardingController.currentPage.value == 2
                          ? 'تسجيل الدخول'
                          : 'استمرار',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'CoHeadline',
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                  ),
                ),
                Obx(() {
                  if (onboardingController.currentPage.value != 2) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: TextButton(
                        onPressed: onboardingController.skip,
                        child: const Text(
                          'تخطي',
                          style: TextStyle(
                            fontFamily: 'CoHeadline',
                            color: Color(0x80FFFFFF),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
              ],
            ),
          ),
          Positioned(
            bottom: 150,
            left: 0,
            right: 0,
            child: Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                      (index) => buildDot(index, onboardingController.currentPage.value),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index, int currentIndex) {
    return Container(
      height: 5,
      width: currentIndex == index ? 31 : 5,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
        color: currentIndex == index ? Colors.white : const Color(0x80F6FAFD),
      ),
    );
  }
}
