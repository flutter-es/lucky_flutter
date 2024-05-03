import 'dart:math';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_flutter/helpers/enums.dart';
import 'package:lucky_flutter/models/luckywheel_metadata.dart';

final luckyWheelProvider = StateProvider<LuckyFlutterWheelMetadata>((ref) {
  return const LuckyFlutterWheelMetadata(index: -1, result: LuckyRouletteResults.none);
});

final luckyRouletteStateProvider = StateProvider<LuckyRouletteState>((ref) => LuckyRouletteState.none);

// for testing only
final luckyRouletteStateListenerProvider = Provider((ref) async {

  List<int> randomValues = [];
  int randomValue = Random().nextInt(3);
  randomValues.add(randomValue);
  
  while(randomValues.length <= 3 || !randomValues.contains(randomValue)) {
    randomValues.add(randomValue);
    randomValue = Random().nextInt(3);
  }

  await Future.delayed(1.seconds);
  ref.read(luckyWheelProvider.notifier).state = LuckyFlutterWheelMetadata(
    index: 0, result: LuckyRouletteResults.values.firstWhere((v) => v.index == randomValues[0])
  );

  
  await Future.delayed(1.seconds);
  ref.read(luckyWheelProvider.notifier).state = LuckyFlutterWheelMetadata(
    index: 1, result: LuckyRouletteResults.values.firstWhere((v) => v.index == randomValues[1])
  );

  
  await Future.delayed(1.seconds);
  ref.read(luckyWheelProvider.notifier).state = LuckyFlutterWheelMetadata(
    index: 2, result: LuckyRouletteResults.values.firstWhere((v) => v.index == randomValues[2])
  );

});