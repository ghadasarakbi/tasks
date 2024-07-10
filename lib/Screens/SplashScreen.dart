import 'package:flutter/material.dart';
import 'dart:async';
import 'OnboardingScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => OnboardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('photos/photo0.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFC5A687).withOpacity(1),
                Color(0xFFC5A687).withOpacity(0.6),
                Colors.black.withOpacity(0.4),
                Color(0xFFF2EFDC).withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.0, 0.4, 0.6, 1],
            ),
          ),
          child: Center(
            child: Image.asset(
              'photos/title.png',
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
