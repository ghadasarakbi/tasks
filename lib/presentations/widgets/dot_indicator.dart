import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final bool isActive;

  const DotIndicator({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: isActive ? 31 : 5,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
        color: isActive ? Colors.white : const Color(0x80F6FAFD),
      ),
    );
  }
}
