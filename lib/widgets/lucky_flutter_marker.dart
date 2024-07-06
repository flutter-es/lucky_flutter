import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../helpers/colors.dart';
import '../helpers/lucky_selectors.dart';

class LuckyFlutterMarker extends StatelessWidget {
  const LuckyFlutterMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Transform.translate(
            offset: const Offset(1, 30),
            child: Container(
              width: 885,
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: LuckyFlutterColors.shadowBox.withOpacity(0.3),
                  width: 19,
                ),
              ),
              alignment: Alignment.center,
            ),
          ),
        ),
        Center(
          child: Transform.translate(
            offset: const Offset(1, 25),
            child: LuckySelectors(
              color: LuckyFlutterColors.shadowBox.withOpacity(0.3),
              width: 614,
              height: 290,
            ),
          ),
        ),
        const LuckySelectors(
          color: LuckyFlutterColors.markerBox,
          width: 700,
          height: 280,
        ),
        Center(
          child: Container(
            width: 980,
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: LuckyFlutterColors.markerBox,
                width: 25.0,
              ),
            ),
            alignment: Alignment.center,
          ),
        ),
      ],
    );
  }
}
