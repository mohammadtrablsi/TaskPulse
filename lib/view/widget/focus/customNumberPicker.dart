import 'package:TaskPulse/controller/focus/focusController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class CustomNumberPicker extends StatelessWidget {
  const CustomNumberPicker({Key? key, required this.text, required this.currentValue, required this.maxValue, required this.onChangeFunction, required this.minValue}) : super(key: key);
  final String text;
  final int currentValue;
  final int maxValue;
  final int minValue;
  final void Function(int) onChangeFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 0.5.h,),
        Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.sp),),

        NumberPicker(
          value: currentValue,
          minValue: minValue,
          maxValue: maxValue,
          selectedTextStyle: const TextStyle(
            fontSize: 25,
            color: AppColor.primaryColor,
            fontWeight: FontWeight.w500,
          ),
          onChanged: onChangeFunction,
          
        ),
      ],
    );
  }
}
