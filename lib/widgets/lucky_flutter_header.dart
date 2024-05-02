import 'package:flutter/material.dart';

class LuckyFlutterHeader extends StatelessWidget {
  const LuckyFlutterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: const Text(
        'Lucky Fluter',
        style: TextStyle(
          fontSize: 80,
        ),
      ),
    );
  }
}
