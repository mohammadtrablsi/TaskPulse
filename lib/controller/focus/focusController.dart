import 'dart:async';

import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/imageassets.dart';
import '../../core/services/services.dart';

class FocusController extends GetxController {
  Artboard? riveArtboard;
  StateMachineController? controller;
  SMIInput<double>? progress;
  String plantButtonText = "";

  late Timer timer;
  int treeProgress = 0;
  // int minutesNumber=29;
  int treeMaxProgress = 0;
  double riveTimer=0;
  bool isAddTime=false;
  bool isShowAddTime=false;
  List<int> timeSelected=[25,0];

  @override
  void onInit() {
    treeMaxProgress =60*timeSelected[0];
    plantButtonText = "Plant";
    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load(AppImageAsset.planet).then(
          (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        var controller = StateMachineController.fromArtboard(artboard, 'Grow');
        if (controller != null) {
          artboard.addController(controller);
          progress = controller.findInput('input');
        }
        riveArtboard = artboard;
        update();
      },
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
          (Timer timer)  async {
        if (treeProgress == treeMaxProgress) {
          await Alarm.set(alarmSettings: alarmSettings);
          stopTimer();
          // timer.cancel();
          plantButtonText = "Plant";
          treeProgress = 0;
          treeMaxProgress = 60*timeSelected[0];
        } else {
            treeProgress+=1;
            riveTimer+=1/timeSelected[0];
            progress?.value = riveTimer;
            update();
        }
      },
    );
  }

  void stopTimer() {
      timer.cancel();
      onInit();
      riveTimer=0;
      treeProgress = 0;
      update();
  }
  void needToAddTime(){
    isAddTime=!isAddTime;
    if(isShowAddTime==false) {
      isShowAddTime = !isShowAddTime;
    }
    update();
  }




  // class HexColor extends Color {
  // static int _getColorFromHex(String hexColor) {
  // hexColor = hexColor.toUpperCase().replaceAll("#", "");
  // if (hexColor.length == 6) {
  // hexColor = "FF" + hexColor;
  // }
  // return int.parse(hexColor, radix: 16);
  // }
  //
  // HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
  // }

  void setCurrentValue(int value,int index){
     timeSelected[index]=value;
    update();
  }
    void onPressedPlanetButton() {
    if (treeProgress > 0) {
      stopTimer();
      plantButtonText = "Plant";
      treeProgress = 0;
      treeMaxProgress = 60 *timeSelected[0];
    }else if(isAddTime){
      plantButtonText = "start";
      isAddTime=!isAddTime;
      treeMaxProgress = 60 *timeSelected[0];
       startTimer();
      // minutesNumber=timeSelected[0];
      update();
      print("hiiiii");

    }else {
      plantButtonText = "Surrender";
      startTimer();
    }
     
  }
  
  late  AlarmSettings  alarmSettings = AlarmSettings(
  id: 42,
  dateTime: DateTime.now(),
  assetAudioPath: 'assets/audio/kma_20230920_162339.m4a',
  loopAudio: false,
  vibrate: true,
  volume: 1,
  fadeDuration: 3.0,
  notificationTitle: 'congratulations',
  notificationBody: 'you must finish your task',
  enableNotificationOnKill: true,
);
}
