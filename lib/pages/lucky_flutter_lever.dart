import 'package:flutter/material.dart';

class LuckyFlutterLevel extends StatefulWidget {
  const LuckyFlutterLevel({super.key});

  @override
  State<LuckyFlutterLevel> createState() => _LuckyFlutterLevelState();
}

class _LuckyFlutterLevelState extends State<LuckyFlutterLevel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('palanca')
      ),
    );
  }
}