import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_flutter/helpers/enums.dart';
import 'package:lucky_flutter/models/luckywheel_metadata.dart';

final luckyWheelProvider = StateProvider<LuckyFlutterWheelMetadata>((ref) {
  return const LuckyFlutterWheelMetadata(index: -1, result: LuckyRouletteResults.none);
});


final luckyRouletteStateProvider = StateProvider<LuckyRouletteState>((ref) => LuckyRouletteState.none);

final luckyRouletteStateListenerProvider = Provider((ref) async {

  await Future.delayed(1.seconds);
  ref.read(luckyWheelProvider.notifier).state = const LuckyFlutterWheelMetadata(index: 0, result: LuckyRouletteResults.dash);

  await Future.delayed(1.seconds);
  ref.read(luckyWheelProvider.notifier).state = const LuckyFlutterWheelMetadata(index: 1, result: LuckyRouletteResults.android);

  await Future.delayed(1.seconds);
  ref.read(luckyWheelProvider.notifier).state = const LuckyFlutterWheelMetadata(index: 2, result: LuckyRouletteResults.sparky);

});