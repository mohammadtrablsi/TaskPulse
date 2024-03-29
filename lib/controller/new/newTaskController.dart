

import 'dart:math';

import 'package:TaskPulse/core/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:TaskPulse/controller/home/homeController.dart';

import '../../core/constant/color.dart';

class NewTaskController extends GetxController {
  HomeController homeController = Get.find();
  TextEditingController? titleController;
  TextEditingController? descriptionController;
  GlobalKey<FormState>? formstate;
  int categoryId = 1;
  DateTime selectedDate = DateTime.now();
  DateTime? picked;
  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay? timePicked;
  CollectionReference Notes = FirebaseFirestore.instance.collection('Notes');
  bool canCreate=false;
  MyServices myServices=Get.find();

  @override
  void onInit() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    formstate = GlobalKey<FormState>();
    super.onInit();
  }

  void changeCategory(Id) {
    categoryId = Id;
    update();
  }

  void pickDate(context) async {
    picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      helpText: 'Select a date',
      cancelText: 'Cancel',
      confirmText: 'OK',
      fieldLabelText: 'Date',
      errorFormatText: 'Enter valid date',
      errorInvalidText:
          'Enter date in valid range',
      initialDatePickerMode: DatePickerMode.day,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColor.primaryColor,
            hintColor: AppColor.primaryColor,
            colorScheme: const ColorScheme.light(primary: AppColor.primaryColor),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      selectedDate = picked!;
      update();
    }
    canCreateTask();
  }

  void pickTime(context) async {
    timePicked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            primarySwatch: Colors.lightBlue,
            hintColor: Colors.lightBlue,
          ),
          child: child!,
        );
      },
    );
    if (timePicked != null ) {
      selectedTime != timePicked;
      update();
    }
    canCreateTask();
  }


  Future<void> addNotes() async {
   Notes
        .add({
      'title': titleController!.text,
      'description':descriptionController!.text,
      'categoryId':categoryId,
      'date':"${picked!.year}-${picked!.month}-${picked!.day}",
      'time':"${timePicked!.hour}:${timePicked!.minute}",
      'isDone':"false",
      'now':DateTime.now(),
      'UserId':FirebaseAuth.instance.currentUser!.uid,
      'uniqueEmail':myServices.sharedPreferences.getString("uniqueEmail"),
    });

          Get.back();
          homeController.needUpdate(2);

  }
  cleanFromValue(){
    titleController?.clear();
    descriptionController?.clear();
    categoryId=1;
    picked=null;
    timePicked=null;
    canCreate=false;
  }

  canCreateTask(){
    if(descriptionController!.text.isNotEmpty&&titleController!.text.isNotEmpty&&picked!=null&&timePicked!=null){
      canCreate=true;
    }else{
      canCreate=false;
    }
  }
}
