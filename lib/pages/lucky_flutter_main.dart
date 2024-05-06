import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

    return Scaffold(
      body: Stack(
        children: [
          const LuckyFlutterBg(),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    ref.read(luckyFlutterRouletteStateProvider.notifier).spin();
                  },
                  child: LuckyFlutterHeader()
                ),
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
