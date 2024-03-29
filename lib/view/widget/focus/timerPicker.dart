import 'package:TaskPulse/controller/focus/focusController.dart';
import 'package:TaskPulse/view/widget/focus/customNumberPicker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TimerPicker extends GetView<FocusController> {
  const TimerPicker({super.key, required this.timeSelected});
  final List<int> timeSelected;


  @override
  Widget build(BuildContext context) {
    return Container(
                    decoration: BoxDecoration(
                      // color: Colors.white,  
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 2.0, // Border width
                    ),borderRadius: BorderRadius.circular(10.sp)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomNumberPicker(text: 'm', currentValue: timeSelected[0], maxValue: 59,minValue: 1, onChangeFunction: (int value ) { controller.setCurrentValue(value,0); },),
                        CustomNumberPicker(text: 's', currentValue: timeSelected[1], maxValue: 59,minValue: 0, onChangeFunction: (int value ) { controller.setCurrentValue(value,1); },),
            
                      ],
                    ),
                  );
  }
}