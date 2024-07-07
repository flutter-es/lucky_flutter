import 'package:flutter/material.dart';
import 'package:lucky_flutter/helpers/constants.dart';
import 'package:rive/rive.dart';

class LuckyFlutterLights extends StatefulWidget {
  const LuckyFlutterLights({super.key});

  @override
  State<LuckyFlutterLights> createState() => _LuckyFlutterLightsState();
}

class _LuckyFlutterLightsState extends State<LuckyFlutterLights> {

  late RiveAnimation anim;
  late StateMachineController ctrl;

  @override
  void initState() {
    super.initState();

    anim = RiveAnimation.asset(Constants.animationsRoot,
      artboard: 'luckylights',
      onInit: onRiveInit,
      fit: BoxFit.contain,
    );
  }

  void onRiveInit(Artboard ab) {
    ctrl = StateMachineController.fromArtboard(ab, 'luckylights')!;
    ab.addController(ctrl);
  }

  @override
  Widget build(BuildContext context) {
    return anim;
  }
}