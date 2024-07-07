import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_flutter/pages/lucky_flutter_lever.dart';
import 'package:lucky_flutter/pages/lucky_flutter_main.dart';
import 'package:lucky_flutter/providers/lucky_roulette_providers.dart';

class LuckyFlutterApp extends ConsumerStatefulWidget {
  const LuckyFlutterApp({super.key});

  @override
  ConsumerState<LuckyFlutterApp> createState() => _LuckyFlutterAppState();
}

class _LuckyFlutterAppState extends ConsumerState<LuckyFlutterApp> {

  @override
  void initState() {
    super.initState();

    ref.read(luckyFlutterTriggerServiceProvider).bootstrapLuckyFlutterTrigger();
    ref.read(soundServiceProvider).initializeSounds();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'ctrl',
      routes: {
        'ctrl': (context) => const LuckyFlutterLeverPage(),
        'main': (context) => const LuckyFlutterMain()
      },
    );
  }
}
