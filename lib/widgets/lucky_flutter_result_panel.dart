import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucky_flutter/models/luckywheel_metadata.dart';
import 'package:lucky_flutter/viewmodels/luckyflutterroundstate_viewmodel.dart';
import 'package:lucky_flutter/widgets/lucky_flutter_result_animation.dart';

class LuckyFlutterResultPanel extends StatelessWidget {

  final LuckyFlutterWheelMetadata metadata;
  const LuckyFlutterResultPanel({
    required this.metadata,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return LuckyFlutterResultAnimation(
      key: ValueKey(metadata.index),
      result: metadata.result,
    ).animate(
      delay: 0.5.seconds,
      onInit: (controller) {
        Future.delayed(4.seconds, () {
          if (context.mounted) {
            controller.reverse();
          }
        });
      },
    ).slideY(
      begin: 1, end: 0,
      curve: Curves.easeInOut,
      duration: 1.seconds,
    );
  }
}