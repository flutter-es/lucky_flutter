import 'package:flutter/material.dart';

class LuckySelectors extends StatelessWidget {
  final dynamic color;
  final dynamic width;
  final dynamic height;

  const LuckySelectors(
      {super.key,
      required this.color,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.arrow_right,
          size: 200,
          color: color,
        ),
        SizedBox(
          width: width,
          height: height,
        ),
        Icon(
          Icons.arrow_left,
          size: 200,
          color: color,
        ),
      ],
    );
  }
}
