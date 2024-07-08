import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_flutter/helpers/enums.dart';
import 'package:lucky_flutter/providers/lucky_roulette_providers.dart';
import 'package:lucky_flutter/widgets/coin_rain_screen.dart';
import 'package:lucky_flutter/widgets/lucky_flutter_bg.dart';
import 'package:lucky_flutter/widgets/lucky_flutter_header.dart';
import 'package:lucky_flutter/widgets/lucky_flutter_lights.dart';
import 'package:lucky_flutter/widgets/lucky_flutter_roulette.dart';

class LuckyFlutterMain extends ConsumerWidget {
  const LuckyFlutterMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          const LuckyFlutterBg(),
          
          
          const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 300,
                    height: 900,
                    child: LuckyFlutterLights())
                ),
                SizedBox(
                  width: 1200,
                  height: 1000,
                  child: LuckyFlutterRoulette()
                ),
            
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 300,
                    height: 900,
                    child: LuckyFlutterLights())
                ),
              ],
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
                ref.read(luckyFlutterRouletteStateProvider.notifier)
                    .spin();
              },
              child: const LuckyFlutterHeader()
            ),
          ),

          

          Consumer(
            builder:(context, ref, child) {
              
              final result = ref.watch(luckyFlutterRouletteStateProvider);

              if (result == LuckyRouletteState.win) {
                return CoinRainScreen(key: ValueKey(result.hashCode),);
              }

              return const SizedBox.shrink();
            },
          )
          // LuckyFlutterResetPanel(),
          // LuckyFlutterResultPanel(),
        ],
      ),
    );
  }
}
