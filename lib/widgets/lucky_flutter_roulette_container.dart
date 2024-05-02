import 'package:flutter/material.dart';

class LuckyFlutterRouletteContainer extends StatelessWidget {

  final Widget child;
  const LuckyFlutterRouletteContainer({
    required this.child,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      width: 800,
      height: 600,
      child: child,
    );
  }
}