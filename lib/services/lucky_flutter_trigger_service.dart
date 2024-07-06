import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_flutter/providers/lucky_roulette_providers.dart';

class LuckyFlutterTriggerService {

  final Ref ref;
  const LuckyFlutterTriggerService(this.ref);

  void bootstrapLuckyFlutterTrigger() {

    ref.read(fbInstanceProvider).collection('lucky-flutter-trigger')
      .doc('lever').snapshots().listen((doc) {
      ref.read(luckyFlutterRouletteStateProvider.notifier).spin();
    });
  }

  void remoteSpin() {
    ref.read(fbInstanceProvider).collection('lucky-flutter-trigger').doc('lever').set({
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    }, SetOptions(merge: true));
  }
}