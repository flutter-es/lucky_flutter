import 'package:flutter/material.dart';
import '../helpers/colors.dart';
import '../helpers/styles.dart';

class LuckyFlutterMarker extends StatelessWidget {
  const LuckyFlutterMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const LuckySelectors(),
        Center(
          child: Container(
            width: 500,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: LuckyFlutterColors.markerBox,
                width: 6.0,
              ),
            ),
            alignment: Alignment.center,
          ),
        ),
      ],
    );
  }
}
