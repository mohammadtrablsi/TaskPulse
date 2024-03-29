import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class CircleWithRive extends StatelessWidget {
  const CircleWithRive({super.key,required this.riveArtboard, required this.treeWidth});
  final riveArtboard;
  final double treeWidth;


  @override
  Widget build(BuildContext context) {
    return Center(
                child: riveArtboard == null ? const SizedBox() :
                Container(
                  width: treeWidth,
                  height: treeWidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(treeWidth / 2),
                      border: Border.all(
                        color: Colors.grey.shade200, 
                      width: 10)),
                  child: Rive(alignment: Alignment.center,artboard: riveArtboard!),
                ),
              );
  }
}