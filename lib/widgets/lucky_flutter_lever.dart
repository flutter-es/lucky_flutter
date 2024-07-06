import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LuckyFlutterLever extends StatefulWidget {

  final double leverValue;
  const LuckyFlutterLever({
    required this.leverValue,
    super.key});

  @override
  State<LuckyFlutterLever> createState() => _LuckyFlutterLeverState();
}

class _LuckyFlutterLeverState extends State<LuckyFlutterLever> {

  late RiveAnimation anim;
  late StateMachineController ctrl;
  late SMINumber val;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();

    anim = RiveAnimation.asset('./assets/anims/luckyflutter.riv',
      onInit: onRiveInit,
      artboard: 'lever',
      fit: BoxFit.contain
    );
  }

  void onRiveInit(Artboard ab) {
    ctrl = StateMachineController.fromArtboard(ab, 'lever')!;
    ab.addController(ctrl);

    val = ctrl.findSMI<SMINumber>('leverValue')!;

    setState(() {
      isInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    if (isInitialized) {
      val.value = widget.leverValue;
    }
    return anim;
  }
}