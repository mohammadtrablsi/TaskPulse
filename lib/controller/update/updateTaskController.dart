import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';

class UpdateTaskController extends GetxController {
  CollectionReference Notes = FirebaseFirestore.instance.collection('Notes');
  TextEditingController? titleController;
  TextEditingController? descriptionController;
  GlobalKey<FormState>? formstate;
  int categoryId = 1;
  DateTime selectedDate = DateTime.now();
  DateTime? picked;
  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay? timePicked;
  String? initDate;
  String? initTime;
  var index;
  var snapshot;

  @override
  void onInit() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    formstate = GlobalKey<FormState>();
    titleController?.text = Get.arguments[0]['title'];
    descriptionController?.text = Get.arguments[0]['description'];
    // categoryId=Get.arguments[0]['categoryId'];
    initDate = Get.arguments[0]['date'];
    initTime = Get.arguments[0]['time'];
    categoryId = int.parse(Get.arguments[0]['categoryId']);
    index = Get.arguments[0]['index'];
    snapshot = Get.arguments[0]['snapshot'];
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
      confirmText: 'OK', // Optional confirm button text
      fieldLabelText: 'Date', // Optional field label text
      errorFormatText: 'Enter valid date', // Optional error format text
      errorInvalidText:
          'Enter date in valid range', // Optional error invalid text
      initialDatePickerMode: DatePickerMode.day, // Initial display mode
      // Customize the theme here
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColor.primaryColor, // Header color
            hintColor: AppColor.primaryColor, // Selection color
            colorScheme: ColorScheme.light(primary: AppColor.primaryColor),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked!;
      update();
    }
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
    if (timePicked != null && timePicked != selectedTime) {
      selectedTime != timePicked;
      update();
    }
  }

  Future<void> addNotes() {
    return Notes.add({
      'title': titleController!.text,
      'description': descriptionController!.text, // John Doe
      'categoryId': categoryId,
      'date': "${picked!.year}-${picked!.month}-${picked!.day}",
      'time': "${timePicked!.hour}:${timePicked!.minute}",
      'isDone': "false",
      'now': selectedDate,
      'UserId': FirebaseAuth.instance.currentUser!.uid,
    })
        .then((value) => Get.back())
        .catchError((error) => print("Failed to add user: $error"));
  }

  void updateTask() async {
    var documentId = snapshot.data!.docs[index].id;
    final DocumentReference<Object?> docRef =
        FirebaseFirestore.instance.collection('Notes').doc(documentId);
    try {
      await docRef.update({
        'title': titleController!.text,
        'description': descriptionController?.text,
        'categoryId': categoryId,
        'date': picked != null
            ? "${picked!.year}-${picked!.month}-${picked!.day}"
            : "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}",
        'time': timePicked != null
            ? "${timePicked!.hour}:${timePicked!.minute}"
            : "${selectedTime.hour}:${selectedTime.minute}",
      });
      print('Document successfully updated');
      Get.back();
    } catch (error) {
      print('Error updating document: ${error}');
    }
  }
}
