import 'package:flutter/material.dart';

import '../../../core/functions/intToTimeLeft.dart';

class Timer extends StatelessWidget {
  const Timer({super.key,required this.treeMaxProgress,required this.treeProgress});
  final treeMaxProgress;
  final treeProgress;

  @override
  Widget build(BuildContext context) {
    return Text(
      intToTimeLeft(treeMaxProgress - treeProgress).toString(),
      style: const TextStyle(
          // color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold),
    );
  }
}
