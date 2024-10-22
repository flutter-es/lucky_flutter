import 'package:flutter/material.dart';
import 'package:lucky_flutter/helpers/enums.dart';
import 'package:rive/rive.dart';

class LuckyFlutterResultAnimation extends StatefulWidget {

  final LuckyRouletteResults result;
  const LuckyFlutterResultAnimation({
    required this.result,
    super.key
  });

  @override
  State<LuckyFlutterResultAnimation> createState() => _LuckyFlutterResultAnimationState();
}

class _LuckyFlutterResultAnimationState extends State<LuckyFlutterResultAnimation> {

  late RiveAnimation anim;
  late StateMachineController ctrl;

  @override 
  void initState() {
    super.initState();

    anim = RiveAnimation.asset('./assets/anims/flutterdash.riv',
      fit: BoxFit.contain,
      onInit: onRiveInit,
      artboard: '${widget.result.name}confetti',
    );
  }

  void onRiveInit(Artboard ab) {
    ctrl = StateMachineController.fromArtboard(ab, '${widget.result.name}confetti')!;
    ab.addController(ctrl);
  }

  @override
  Widget build(BuildContext context) {
    return anim;
  }
}