import 'package:flutter/material.dart';
import 'package:lucky_flutter/helpers/constants.dart';
import 'package:rive/rive.dart';

class LuckyFlutterHeader extends StatefulWidget {
  const LuckyFlutterHeader({super.key});

  @override
  State<LuckyFlutterHeader> createState() => _LuckyFlutterHeaderState();
}

class _LuckyFlutterHeaderState extends State<LuckyFlutterHeader> {

  late RiveAnimation anim;
  late StateMachineController ctrl;

  @override
  void initState() {
    super.initState();

    anim = RiveAnimation.asset(Constants.animationsRoot,
      artboard: 'luckyflutterbanner',
      onInit: onRiveInit,
      fit: BoxFit.contain,
    );
  }

  void onRiveInit(Artboard ab) {
    ctrl = StateMachineController.fromArtboard(ab, 'luckyflutterbanner')!;
    ab.addController(ctrl);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 700,
      height: 200,
      child: anim,
    );
  }
}