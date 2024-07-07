
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_flutter/helpers/enums.dart';
import 'package:lucky_flutter/models/luckywheel_metadata.dart';
import 'package:lucky_flutter/services/lucky_flutter_trigger_service.dart';
import 'package:lucky_flutter/services/sound_notification_service.dart';
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

final fbInstanceProvider = Provider((ref) => FirebaseFirestore.instance);

final luckyFlutterTriggerServiceProvider = Provider((ref) {
  return LuckyFlutterTriggerService(ref);
});

final soundServiceProvider = Provider((ref) {
  return SoundNotificationService();
});