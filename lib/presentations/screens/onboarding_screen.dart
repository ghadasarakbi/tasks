import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'package:tasks/presentations/widgets/onboarding_item.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() {
    return OnboardingScreenState();
  }
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;

  void onPageChanged(int page) {
    setState(() {
      currentPage = page;
    });
  }

  void _nextPage() {
    if (currentPage < 2) {
      pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void skip() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainPage()));
  }

  void login() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: onPageChanged,
            children: const [
              OnboardingItem(
                description: "اسهل طريقة للبحث عن اخصائيين التفصيل",
                imagePath: 'assets/photos/photo1.jpeg',
                index: 0,
              ),
              OnboardingItem(
                description: "فصل او خذ المقاسات وانت في مكانك",
                imagePath: 'assets/photos/photo2.jpeg',
                index: 1,
              ),
              OnboardingItem(
                description: "امان تام ، ثقة وتعامل مضمون",
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
                  onPressed: currentPage == 2 ? login : _nextPage,
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
                    shadowColor: WidgetStateProperty.all<Color>(Colors.black.withOpacity(0.5)),
                  ),
                  child: Container(
                    width: 120,
                    height: 30,
                    alignment: Alignment.center,
                    child: Text(
                      currentPage == 2 ? 'تسجيل الدخول' : 'استمرار',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'CoHeadline',
                          fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                if (currentPage != 2)
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: TextButton(
                      onPressed: skip,
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
                  ),
              ],
            ),
          ),
          Positioned(
            bottom: 150,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                    (index) => buildDot(index, currentPage),
              ),
            ),
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
