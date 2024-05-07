import 'package:flutter/material.dart';

import 'colors.dart';

class LuckySelectors extends StatelessWidget {
  const LuckySelectors({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.arrow_right,
          size: 180,
          color: LuckyFlutterColors.markerBox,
        ),
        SizedBox(
          width: 565,
          height: 250,
        ),
        Icon(
          Icons.arrow_left,
          size: 180,
          color: LuckyFlutterColors.markerBox,
        ),
      ],
    );
  }
}
