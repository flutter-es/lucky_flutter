import 'package:flutter/material.dart';

class LuckyFlutterRouletteContainer extends StatelessWidget {
  final Widget child;
  const LuckyFlutterRouletteContainer({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      width: 810,
      height: 610,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
  }
}
