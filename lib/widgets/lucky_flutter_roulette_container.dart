import 'package:flutter/material.dart';

class LuckyFlutterRouletteContainer extends StatelessWidget {

  final Widget child;
  const LuckyFlutterRouletteContainer({
    required this.child,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}