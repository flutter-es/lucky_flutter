import 'package:flutter/material.dart';
import 'colors.dart';

class AngelContainer extends StatelessWidget {
  const AngelContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 900,
        height: 700,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: LuckyFlutterColors.bgAngelContainer,
        ),
        alignment: Alignment.center,
      ),
    );
  }
}

class DevilContainer extends StatelessWidget {
  const DevilContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 920,
        height: 720,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: LuckyFlutterColors.bgDevilContainer,
        ),
        alignment: Alignment.center,
      ),
    );
  }
}

class LimboContainer extends StatelessWidget {
  const LimboContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 880,
        height: 680,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              LuckyFlutterColors.bgGoldContainer2,
              LuckyFlutterColors.bgGoldContainer3,
              LuckyFlutterColors.bgGoldContainer2,
              LuckyFlutterColors.bgGoldContainer3,
              LuckyFlutterColors.bgGoldContainer2,
              LuckyFlutterColors.bgGoldContainer3,
              LuckyFlutterColors.bgGoldContainer2,
            ],
            stops: [0.0, 0.2, 0.4, 0.6, 0.8, 0.9, 1.0],
          ),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
