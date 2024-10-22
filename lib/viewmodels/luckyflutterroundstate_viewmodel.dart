import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_flutter/helpers/constants.dart';
import 'package:lucky_flutter/helpers/enums.dart';
import 'package:lucky_flutter/models/luckywheel_metadata.dart';
import 'package:lucky_flutter/providers/lucky_roulette_providers.dart';

class LuckyFlutterTriggerViewModel extends StateNotifier<LuckyRouletteState> {

  final Ref ref;
  LuckyFlutterTriggerViewModel(super._state, this.ref);

  Future<void> spin() async {
    state = LuckyRouletteState.none;

    for(var i = 0; i < Constants.numberOfRoulettes; i++) {
      await Future.delayed(0.125.seconds);
      ref.read(luckyWheelProvider.notifier).state = LuckyFlutterWheelMetadata(
        index: i, result: LuckyRouletteResults.none
      );
    }

    await Future.delayed(2.seconds);
    await stop();
  }

  Future<void> stop() async {

    state = LuckyRouletteState.spin;
    int potentialResults = LuckyRouletteResults.values.length - 1;
    List<int> randomValues = await compute((results) {
      int randomValue = Random().nextInt(results);
      List<int> vals = [];
      vals.add(randomValue);
      
      while(vals.length < Constants.numberOfRoulettes || !vals.contains(randomValue)) {
        vals.add(randomValue);
        randomValue = Random().nextInt(results);
      }

      return vals;

    }, potentialResults);

    for(var (index, randomValue) in randomValues.indexed) { 

      await Future.delayed(1.seconds);
      ref.read(luckyWheelProvider.notifier).state = LuckyFlutterWheelMetadata(
        index: index, 
        result: LuckyRouletteResults.values.firstWhere((v) => v.index == randomValue)
      );
    }

    await Future.delayed(0.75.seconds);
    if ((randomValues[0] == randomValues[1] && randomValues[1] == randomValues[2])) {
        
        ref.read(luckyWheelMatchProvider.notifier).state = 
        LuckyFlutterWheelMetadata(index: randomValues[0], 
          result: LuckyRouletteResults.values.firstWhere((v) => v.index == randomValues[0]));

        state = LuckyRouletteState.win;
      }
      else {
        state = LuckyRouletteState.none;
      }
  }
}