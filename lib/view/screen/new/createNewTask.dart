import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:TaskPulse/view/widget/newAndUpdate/taskLastPart.dart';
import 'package:TaskPulse/view/widget/newAndUpdate/taskTextField.dart';


import '../../../controller/new/newTaskController.dart';
import '../../../core/constant/color.dart';
import '../../widget/newAndUpdate/categoryItem.dart';

class CreateNewTask extends StatelessWidget{
  const CreateNewTask(
      {super.key});


  @override
  Widget build(BuildContext context) {
    Get.put(NewTaskController());
    return GetBuilder<NewTaskController>(builder: (controller){
      return Padding(
        padding:
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom / 2),
        child: Container(
          // Adjust the fraction as needed
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "New Task Todo",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
              ),
              Container(
                width: 70.w,
                height: 0.1.h,
                color: Colors.grey,
              ),
              SizedBox(
                height: 2.h,
              ),
              TaskTextField(
                onChange: (value){
                  controller.canCreateTask();
                },
                title: 'Title Task',
                controller: controller.titleController,
                text: 'Add Task Name',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                maxLines: 1,
                LabelSize: 12.sp,
                isUpdateTaskPage: false,
              ),
              SizedBox(
                height: 2.h,
              ),
              TaskTextField(
                onChange: (value){
                  controller.canCreateTask();
                },
                title: 'Description',
                controller: controller.descriptionController,
                text: 'Add Description',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                maxLines: 5,
                LabelSize: 15.sp,
                isUpdateTaskPage: false,
              ),
              SizedBox(
                height: 2.h,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TaskLastPart(
                    title: 'Date',
                    dateText: controller.picked!=null?"${controller.picked!.year}-${controller.picked!.month}-${controller.picked!.day}":"dd/mm/yy",
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
                      controller.cleanFromValue();
                    },
                    isUpdateTaskPage: false,
                    canCreate: true,
                  ),
                  TaskLastPart(
                    title: 'Time',
                    dateText: controller.timePicked!=null?"${controller.timePicked!.hour}:${controller.timePicked!.minute}":"hh:mm",
                    buttonColor: controller.canCreate?AppColor.primaryColor:Colors.grey,
                    buttonText: 'Create',
                    buttonTextColor: Colors.white,
                    icon: Icons.watch_later_outlined,
                    dateOnTap: (){
                      controller.pickTime(context);
                    },
                    horizontalButton: 10.w,
                    onPressedButton: (){
                      controller.addNotes();
                      controller.cleanFromValue();
                    },
                    isUpdateTaskPage: false,
                    canCreate: controller.canCreate,
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
