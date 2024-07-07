import 'package:flutter/material.dart';
import 'package:lucky_flutter/helpers/constants.dart';
import 'package:rive/rive.dart';

class CoinRainScreen extends StatefulWidget {
  const CoinRainScreen({super.key});

  @override
  State<CoinRainScreen> createState() => _CoinRainScreenState();
}

class _CoinRainScreenState extends State<CoinRainScreen> {

  late RiveAnimation anim;
  late StateMachineController ctrl;

  @override
  void initState() {
    super.initState();

    anim = RiveAnimation.asset(Constants.animationsRoot,
      artboard: 'coinrainscreen',
      onInit: onRiveInit,
      fit: BoxFit.contain,
    );
  }

  void onRiveInit(Artboard ab) {
    ctrl = StateMachineController.fromArtboard(ab, 'coinrainscreen')!;
    ab.addController(ctrl);
  }

  @override
  Widget build(BuildContext context) {
    return anim;
  }
}