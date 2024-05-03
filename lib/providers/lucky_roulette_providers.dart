import 'dart:math';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_flutter/helpers/constants.dart';
import 'package:lucky_flutter/helpers/enums.dart';
import 'package:lucky_flutter/models/luckywheel_metadata.dart';

final luckyWheelProvider = StateProvider<LuckyFlutterWheelMetadata>((ref) {
  return const LuckyFlutterWheelMetadata(index: -1, result: LuckyRouletteResults.none);
});

final luckyRouletteStateProvider = StateProvider<LuckyRouletteState>((ref) => LuckyRouletteState.none);

// for testing only
final luckyRouletteStateListenerProvider = Provider((ref) async {

  int potentialResults = LuckyRouletteResults.values.length - 1;
  List<int> randomValues = [];
  int randomValue = Random().nextInt(potentialResults);
  randomValues.add(randomValue);
  
  while(randomValues.length <= Constants.numberOfRoulettes || !randomValues.contains(randomValue)) {
    randomValues.add(randomValue);
    randomValue = Random().nextInt(potentialResults);
  }

  for(var (index, randomValue) in randomValues.indexed) {

    await Future.delayed(1.seconds);
    ref.read(luckyWheelProvider.notifier).state = LuckyFlutterWheelMetadata(
      index: index, result: LuckyRouletteResults.values.firstWhere((v) => v.index == randomValue)
    );
  }

});