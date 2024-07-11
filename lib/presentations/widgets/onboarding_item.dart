import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  final String description;
  final String imagePath;
  final int index;

  const OnboardingItem({
    super.key,
    required this.description,
    required this.imagePath,
    required this.index,
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
                const Color(0xFFC5A687).withOpacity(1.0),
                const Color(0xFFF2EFDC).withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.0, 1.0],
            ),
          ),
        ),
        Positioned(
          child: Transform.translate(
            offset: const Offset(0, 40),
            child: Center(
              child: Image.asset(
                'assets/photos/title.png',
                width: 130,
                height: 150,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Spacer(flex: 4),
              Text(
                description,
                style: const TextStyle(
                  fontFamily: 'CoHeadline',
                  fontWeight: FontWeight.w400,
                  fontSize: 40,
                  height: 52.35 / 30,
                  color: Colors.white,
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 2),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ],
    );
  }
}
