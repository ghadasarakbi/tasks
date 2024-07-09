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
        child: Center(
          child: Image.asset(
            'photos/title.png',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
