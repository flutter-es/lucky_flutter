import 'package:flutter/material.dart';
import 'package:lucky_flutter/helpers/constants.dart';
import 'package:rive/rive.dart';

class LuckyFlutterRouletteWheel extends StatefulWidget {
  const LuckyFlutterRouletteWheel({super.key});

  @override
  State<LuckyFlutterRouletteWheel> createState() => _LuckyFlutterRouletteWheelState();
}

class _LuckyFlutterRouletteWheelState extends State<LuckyFlutterRouletteWheel> {

  late RiveAnimation anim;
  late StateMachineController ctrl;

  @override
  void initState() {
    super.initState();

    anim = RiveAnimation.asset(Constants.animationsRoot,
      artboard: 'mainwheel',
      onInit: onRiveInit,
      fit: BoxFit.contain,
    );
  }

  void onRiveInit(Artboard ab) {
    ctrl = StateMachineController.fromArtboard(ab, 'mainwheel')!;
    ab.addController(ctrl);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 700,
      child: anim,
    );
  }
}