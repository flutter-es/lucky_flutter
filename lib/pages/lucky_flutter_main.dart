import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_flutter/helpers/enums.dart';
import 'package:lucky_flutter/providers/lucky_roulette_providers.dart';
import 'package:lucky_flutter/widgets/coin_rain_screen.dart';
import 'package:lucky_flutter/widgets/lucky_flutter_bg.dart';
import 'package:lucky_flutter/widgets/lucky_flutter_header.dart';
import 'package:lucky_flutter/widgets/lucky_flutter_lights.dart';
import 'package:lucky_flutter/widgets/lucky_flutter_result_panel.dart';
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
              final luckyWheelMetadata = ref.watch(luckyWheelMatchProvider);

              if (result == LuckyRouletteState.win) {
                return Positioned.fill(
                  child: Stack(
                    children: [
                      CoinRainScreen(key: ValueKey(result.hashCode)),

                      if (luckyWheelMetadata.result != LuckyRouletteResults.none)
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.75,
                            height: MediaQuery.sizeOf(context).height * 0.75,
                            child: LuckyFlutterResultPanel(
                              metadata: luckyWheelMetadata
                            ),
                          ),
                        ),
                    ]
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          )
        ],
      ),
    );
  }
}
