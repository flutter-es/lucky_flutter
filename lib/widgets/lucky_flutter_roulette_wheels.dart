import 'package:flutter/material.dart';
import 'package:lucky_flutter/widgets/lucky_flutter_wheel.dart';

class LuckyFlutterRouletteWheels extends StatelessWidget {
  const LuckyFlutterRouletteWheels({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(3, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: LuckyFlutterRouletteWheel(index: index)
        );
      })
    );
  }
}