import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class ButtonInFocus extends StatelessWidget {
  const ButtonInFocus(
      {super.key, required this.plantButtonText, this.onPressedPlanetButton});
  final String plantButtonText;
  final void Function()? onPressedPlanetButton;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: MaterialButton(
        height: 40.0,
        minWidth: 180.0,
        elevation: 8.0,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.sp)),
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(plantButtonText),
        onPressed: onPressedPlanetButton,
      ),
    );
  }
}
