import 'package:flutter/material.dart';

import '../widgets/lucky_flutter_bg.dart';

class LuckyFlutterLever extends StatefulWidget {
  const LuckyFlutterLever({super.key});

  @override
  State<LuckyFlutterLever> createState() => _LuckyFlutterLeverState();
}

class _LuckyFlutterLeverState extends State<LuckyFlutterLever> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          LuckyFlutterBg(),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //TODO Containers holding the lever
              ],
            ),
          ),

          // LuckyFlutterResetPanel(),
          // LuckyFlutterResultPanel(),
        ],
      ),
    );
  }
}
