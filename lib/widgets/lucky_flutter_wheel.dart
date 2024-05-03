import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_flutter/helpers/constants.dart';
import 'package:lucky_flutter/helpers/enums.dart';
import 'package:lucky_flutter/providers/lucky_roulette_providers.dart';
import 'package:rive/rive.dart';

class LuckyFlutterRouletteWheel extends ConsumerStatefulWidget {

  final int index;
  const LuckyFlutterRouletteWheel({
    required this.index,
    super.key
  });

  @override
  ConsumerState<LuckyFlutterRouletteWheel> createState() => _LuckyFlutterRouletteWheelState();
}

class _LuckyFlutterRouletteWheelState extends ConsumerState<LuckyFlutterRouletteWheel> {

  late RiveAnimation anim;
  late StateMachineController ctrl;
  Map<LuckyRouletteResults, SMITrigger> results = {};
  bool isInitialized = false;

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

    for(var result in LuckyRouletteResults.values) {
      results[result] = ctrl.findSMI(result.label) as SMITrigger;
    }

    setState(() {
      isInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    final wheelMetadata = ref.watch(luckyWheelProvider);

    if (isInitialized && wheelMetadata.index == widget.index) {
      results[wheelMetadata.result]!.fire();
    }

    return SizedBox(
      width: 250,
      height: 700,
      child: anim,
    );
  }
}