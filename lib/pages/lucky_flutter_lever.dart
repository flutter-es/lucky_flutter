import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_flutter/helpers/enums.dart';
import 'package:lucky_flutter/providers/lucky_roulette_providers.dart';
import 'package:lucky_flutter/widgets/lucky_flutter_bg.dart';
import 'package:lucky_flutter/widgets/lucky_flutter_lever.dart';

class LuckyFlutterLeverPage extends ConsumerStatefulWidget {
  const LuckyFlutterLeverPage({super.key});

  @override
  ConsumerState<LuckyFlutterLeverPage> createState() => _LuckyFlutterLeverPageState();
}

class _LuckyFlutterLeverPageState extends ConsumerState<LuckyFlutterLeverPage> {

  double lastDraggedValue = 0;

  @override 
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          const LuckyFlutterBg(),

          Center(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.85,
              child: Consumer(
                builder: (context, ref, child) {

                  final leverValue = ref.watch(leverValueProvider);
                  return Stack(
                    children: [
                      LuckyFlutterLever(
                        leverValue: leverValue,
                      ),
                      GestureDetector(
                        onVerticalDragUpdate: (details) {
                          lastDraggedValue = details.localPosition.dy * 0.15;
                          ref.read(leverValueProvider.notifier).state = lastDraggedValue;
                        },
                        onVerticalDragEnd: (details) {

                          if (lastDraggedValue > 50) {
                            ref.read(luckyFlutterTriggerServiceProvider).remoteSpin();
                          }
                          
                          Timer.periodic(0.000125.seconds, (timer) {
                            lastDraggedValue -= 1;
                            ref.read(leverValueProvider.notifier).state = lastDraggedValue;

                            if (lastDraggedValue <= 0) {
                              timer.cancel();
                              lastDraggedValue = 0;
                            }
                          });
                        },
                        child: Container(
                          color: Colors.transparent,
                        ),
                      )
                    ],
                  );
                }
              )
            ),
          ),

          // LuckyFlutterResetPanel(),
          // LuckyFlutterResultPanel(),
        ],
      ),
    );
  }
}
