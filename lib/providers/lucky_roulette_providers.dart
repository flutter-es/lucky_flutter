
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_flutter/helpers/enums.dart';
import 'package:lucky_flutter/models/luckywheel_metadata.dart';
import 'package:lucky_flutter/viewmodels/luckyflutterroundstate_viewmodel.dart';

final luckyWheelProvider = StateProvider<LuckyFlutterWheelMetadata>((ref) {
  return const LuckyFlutterWheelMetadata(index: -1, result: LuckyRouletteResults.none);
});

final luckyFlutterRouletteStateProvider = StateNotifierProvider<LuckyFlutterTriggerViewModel, LuckyRouletteState>(
  (ref) => LuckyFlutterTriggerViewModel(LuckyRouletteState.none, ref)
);

final leverValueProvider = StateProvider<double>((ref) {
  return 0;
});