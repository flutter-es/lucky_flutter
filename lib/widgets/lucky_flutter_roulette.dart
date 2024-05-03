import 'package:flutter/material.dart';
import 'package:lucky_flutter/widgets/lucky_flutter_marker.dart';
import 'package:lucky_flutter/widgets/lucky_flutter_roulette_container.dart';
import 'package:lucky_flutter/widgets/lucky_flutter_roulette_wheels.dart';

class LuckyFlutterRoulette extends StatelessWidget {
  const LuckyFlutterRoulette({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,
      children: [
        LuckyFlutterRouletteContainer(
          child: LuckyFlutterRouletteWheels(),
        ),
        LuckyFlutterMarker(),
      ],
    );
  }
}
