import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'package:tasks/presentations/widgets/onboarding_item.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _skip() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainPage()));
  }

  void _login() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: [
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
            bottom: 20,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _currentPage == 2 ? _login : _nextPage,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
                    foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    padding: WidgetStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                    ),
                    elevation: WidgetStateProperty.all<double>(5),
                    shadowColor: WidgetStateProperty.all<Color>(Colors.black.withOpacity(0.5)),
                  ),
                  child: Text(
                    _currentPage == 2 ? 'تسجيل الدخول' : 'استمرار',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                if (_currentPage != 2)
                  TextButton(
                    onPressed: _skip,
                    child: const Text(
                      'تخطي',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                    (index) => _buildDot(index, _currentPage),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index, int currentIndex) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? Colors.white : Colors.grey,
      ),
    );
  }
}
