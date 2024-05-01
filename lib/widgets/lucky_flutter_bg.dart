import 'package:flutter/material.dart';
import 'package:lucky_flutter/helpers/colors.dart';

class LuckyFlutterBg extends StatelessWidget {
  const LuckyFlutterBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: LuckyFlutterColors.bottomGradientColor
    );
  }
}