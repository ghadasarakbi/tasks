import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/splash_controller.dart';
import '../widgets/dot_indicator.dart';

class SplashScreen extends StatelessWidget {
  final PageController _controller = PageController();
  final Duration _duration = const Duration(milliseconds: 500);
  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (splashController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Stack(
            children: [
              PageView.builder(
                controller: _controller,
                itemCount: splashController.splashData.length,
                onPageChanged: splashController.updateIndex,
                itemBuilder: (context, index) {
                  final item = splashController.splashData[index];
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        item.image,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFFC5A687).withOpacity(1),
                              const Color(0xFFF2EFDC).withOpacity(0),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: const [0, 1],
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 500),
                            Text(
                              item.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              item.description,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              Positioned(
                bottom: 70,
                left: 30,
                child: Obx(() => ElevatedButton(
                  onPressed: () => splashController.navigateNextPage(_controller, _duration),
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
                    child: Text(
                      splashController.currentIndex.value == splashController.splashData.length - 1
                          ? 'تسجيل الدخول'
                          : 'استمرار',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'CoHeadline',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                )),
              ),
              Positioned(
                bottom: 70,
                right: 30,
                child: Obx(() => splashController.currentIndex.value == splashController.splashData.length - 1
                    ? const SizedBox.shrink()
                    : Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: TextButton(
                    onPressed: splashController.skipToOnboarding,
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
                )),
              ),
              Positioned(
                bottom: 140,
                left: 0,
                right: 0,
                child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    splashController.splashData.length,
                        (index) => DotIndicator(isActive: splashController.currentIndex.value == index),
                  ),
                )),
              ),
            ],
          );
        }
      }),
    );
  }
}
