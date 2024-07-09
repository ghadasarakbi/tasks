import 'package:flutter/material.dart';
import 'MainPage.dart';

class OnboardingScreen extends StatefulWidget {
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
        duration: Duration(milliseconds: 300),
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
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          OnboardingPage(
            description: "اسهل طريقة للبحث عن اخصائيين التفصيل",
            imagePath: 'photos/photo1.jpeg',
            onNext: _nextPage,
            onSkip: _skip,
            showButtons: true,
            showLoginButton: false,
          ),
          OnboardingPage(
            description: "فصل او خذ المقاسات وانت في مكانك",
            imagePath: 'photos/photo2.jpeg',
            onNext: _nextPage,
            onSkip: _skip,
            showButtons: true,
            showLoginButton: false,
          ),
          OnboardingPage(
            description: "امان تام ، ثقة وتعامل مضمون",
            imagePath: 'photos/photo3.jpeg',
            onNext: _nextPage,
            onSkip: _skip,
            showButtons: false,
            showLoginButton: true,
            onLogin: _login,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
                (index) => _buildDot(index, _currentPage),
          ),
        ),
      ),
    );
  }

  Widget _buildDot(int index, int currentIndex) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? Colors.orange[200] : Colors.grey,
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String description;
  final String imagePath;
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final VoidCallback? onLogin;
  final bool showButtons;
  final bool showLoginButton;

  OnboardingPage({
    required this.description,
    required this.imagePath,
    required this.onNext,
    required this.onSkip,
    this.onLogin,
    required this.showButtons,
    required this.showLoginButton,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xC5A687).withOpacity(1),
                Color(0xC5A687).withOpacity(0.6),
                Colors.black.withOpacity(0.4),
                Color(0xFFF2EFDC).withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.0, 0.4,0.6, 1],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 49),
              Center(
                child: Container(
                  width: 119,
                  height: 52.37,
                  child: Image.asset('photos/title.png'),
                ),
              ),
              Spacer(),
              Text(
                description,
                style: TextStyle(
                  fontFamily: 'Co Headline',
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  height: 52.35 / 30,
                  color: Colors.white,
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 50),
              if (showButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: onNext,
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
                        foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        padding: WidgetStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                        ),
                        elevation: WidgetStateProperty.all<double>(5),
                        shadowColor: WidgetStateProperty.all<Color>(Colors.black.withOpacity(0.5)),
                      ),
                      child: Text('استمرار', style: TextStyle(color: Colors.black)),
                    ),
                    TextButton(
                      onPressed: onSkip,
                      child: Text(
                        'تخطي',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              if (showLoginButton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: onLogin,
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
                        foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        padding: WidgetStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                        ),
                        elevation: WidgetStateProperty.all<double>(5),
                        shadowColor: WidgetStateProperty.all<Color>(Colors.black.withOpacity(0.5)),
                      ),
                      child: Text('تسجيل الدخول', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
