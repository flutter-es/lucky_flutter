import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_flutter/helpers/enums.dart';
import 'package:lucky_flutter/providers/lucky_roulette_providers.dart';
import 'package:lucky_flutter/widgets/lucky_flutter_bg.dart';
import 'package:lucky_flutter/widgets/lucky_flutter_header.dart';
import 'package:lucky_flutter/widgets/lucky_flutter_roulette.dart';

class LuckyFlutterMain extends ConsumerWidget {
  const LuckyFlutterMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    Future.delayed(1.seconds, () {
      ref.read(luckyRouletteStateListenerProvider);
    });

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
                LuckyFlutterHeader(),
                LuckyFlutterRoulette(),
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
