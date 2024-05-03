import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_flutter/pages/lucky_flutter_lever.dart';
import 'package:lucky_flutter/pages/lucky_flutter_main.dart';

void main() {
  runApp(const ProviderScope(child: LuckyFlutterApp()));
}

class LuckyFlutterApp extends StatelessWidget {
  const LuckyFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'main',
      routes: {
        'ctrl': (context) => const LuckyFlutterLevel(),
        'main': (context) => const LuckyFlutterMain()
      },
    );
  }
}

