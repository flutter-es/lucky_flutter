import 'package:flutter/material.dart';
import 'colors.dart';

class LuckyContainer extends StatelessWidget {
  const LuckyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            LuckyFlutterColors.topGradientColor,
            LuckyFlutterColors.intermediateGradient1,
            LuckyFlutterColors.intermediateGradient2,
            LuckyFlutterColors.bottomGradientColor,
          ],
          stops: [0.3, 0.5, 0.7, 0.9],
        ),
      ),
    );
  }
}
