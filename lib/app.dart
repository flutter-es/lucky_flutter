import 'package:flutter/material.dart';
import 'package:lucky_flutter/pages/lucky_flutter_lever.dart';
import 'package:lucky_flutter/pages/lucky_flutter_main.dart';

class LuckyFlutterApp extends StatelessWidget {
  const LuckyFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'main',
      routes: {
        'ctrl': (context) => const LuckyFlutterLever(),
        'main': (context) => const LuckyFlutterMain()
      },
    );
  }
}
