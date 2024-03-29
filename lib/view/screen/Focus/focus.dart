

import 'package:TaskPulse/core/constant/color.dart';
import 'package:TaskPulse/view/widget/focus/buttonInFocus.dart';
import 'package:TaskPulse/view/widget/focus/circleWithRive.dart';
import 'package:TaskPulse/view/widget/focus/timerPicker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/focus/focusController.dart';
import '../../widget/focus/customNumberPicker.dart';
import '../../widget/focus/timer.dart';


class Focus extends StatelessWidget {
  const Focus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FocusController());
    double treeWidth = MediaQuery.of(context).size.width - 40;
    return GetBuilder<FocusController>(builder: (controller){
      return Scaffold(
        // backgroundColor: Colors.grey.shade400,
        body: Column(
          children: [
            const SizedBox(height: 60,),
            Row(children: [
              SizedBox(width: 3.w,),
              IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_outlined,size: 22.sp,color: AppColor.primaryColor,))
            ],),
            const Text(
              "Stay Focused",
              style: TextStyle(
                  // color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child:  CircleWithRive(riveArtboard: controller.riveArtboard, treeWidth: treeWidth,),
            ),
            Container(
               padding: const EdgeInsets.only(bottom: 10),
               margin: controller.isAddTime?EdgeInsetsDirectional.only(top: 2.h):EdgeInsets.zero,
              child: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: controller.isAddTime?1:0.5,
                child: InkWell(
                  child: controller.isAddTime?TimerPicker(timeSelected: controller.timeSelected):
                 Timer(treeMaxProgress: controller.treeMaxProgress, treeProgress: controller.treeProgress,),
                  onTap: (){
                    controller.needToAddTime();
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                "Time left to grow the plant",
                style: TextStyle(
                    // color: Colors.white60,
                    fontSize: 10,
                    fontWeight: FontWeight.normal),
              ),
            ),
            ButtonInFocus(plantButtonText: controller.plantButtonText,onPressedPlanetButton: ()=>controller.onPressedPlanetButton(),),
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 100),
            //   child: MaterialButton(
            //     height: 40.0,
            //     minWidth: 180.0,
            //     elevation: 8.0,
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(15.sp)),
            //     color: AppColor.primaryColor,
            //     textColor: Colors.white,
            //     child: Text(controller.plantButtonText),
            //     onPressed: () {
            //       controller.onPressedPlanetButton();
            //     },
            //   ),
            // ),
          ],
        ),
      );
    },);

  }
}

