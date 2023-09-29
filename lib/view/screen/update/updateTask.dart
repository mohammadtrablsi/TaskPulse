import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:TaskPulse/view/widget/newAndUpdate/taskLastPart.dart';
import 'package:TaskPulse/view/widget/newAndUpdate/taskTextField.dart';

import '../../../controller/home/homeController.dart';
import '../../../controller/new/newTaskController.dart';
import '../../../controller/update/updateTaskController.dart';
import '../../../core/constant/color.dart';
import '../../widget/newAndUpdate/categoryItem.dart';


class UpdateTask extends StatelessWidget{
  const UpdateTask(
      {super.key});


  @override
  Widget build(BuildContext context) {
    UpdateTaskController controller = Get.put(UpdateTaskController());
    return GetBuilder<UpdateTaskController>(builder: (controller){
      return Scaffold(
        backgroundColor: const Color(0xFFEFEFEF),
        body: Padding(
          padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom / 2),
          child: Container(// Adjust the fraction as needed
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                    IconButton(onPressed: (){
                      controller.updateTask();
                    }, icon: Icon(Icons.arrow_back_outlined)),
                  ],),
                  SizedBox(
                    height: 2.h,
                  ),
                  TaskTextField(
                    title: 'Title Task',
                    controller: controller.titleController,
                    text: 'Add Task Name',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    maxLines: null,
                    LabelSize: 12.sp,
                    isUpdateTaskPage: true,
                    fontSize: 20.sp,
                    minLines: 1,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TaskTextField(
                    title: 'Description',
                    controller: controller.descriptionController,
                    text: 'Add Description',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    maxLines: null,
                    LabelSize: 15.sp,
                    isUpdateTaskPage: true,
                    fontSize: 16.sp,
                    minLines: 3,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Category",
                        style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryItem(text: 'Learning', color: Colors.greenAccent, categoryId: controller.categoryId, Id: 1, onTap: () {controller.changeCategory(1) ; },),
                      CategoryItem(text: 'Working', color: Colors.blueAccent, categoryId: controller.categoryId, Id: 2, onTap: () {controller.changeCategory(2) ; },),
                      CategoryItem(text: 'General', color: Colors.amberAccent, categoryId: controller.categoryId, Id: 3, onTap: () {controller.changeCategory(3) ; },),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  //
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Divider(),
                      TaskLastPart(
                        title: 'Date',
                        dateText: controller.picked!=null?"${controller.picked!.year}-${controller.picked!.month}-${controller.picked!.day}":"${controller.initDate}",
                        buttonColor: Colors.white,
                        buttonText: 'Cancel',
                        buttonTextColor: AppColor.primaryColor,
                        icon: Icons.date_range_outlined,
                        dateOnTap: (){
                          controller.pickDate(context);
                        },
                        horizontalButton: 12.w,
                        onPressedButton: (){
                          Get.back();
                        },
                        isUpdateTaskPage: true,
                        canCreate: true,
                      ),
                      Divider(),
                      TaskLastPart(
                        title: 'Time',
                        dateText: controller.timePicked!=null?"${controller.timePicked!.hour}:${controller.timePicked!.minute}":"${controller.initTime}",
                        buttonColor: AppColor.primaryColor,
                        buttonText: 'Create',
                        buttonTextColor: Colors.white,
                        icon: Icons.watch_later_outlined,
                        dateOnTap: (){
                          controller.pickTime(context);
                        },
                        horizontalButton: 10.w,
                        onPressedButton: (){
                          controller.addNotes();
                        },
                        isUpdateTaskPage: true,
                        canCreate: true,
                      ),
                      Divider(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
