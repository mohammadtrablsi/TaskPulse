import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:TaskPulse/core/constant/color.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.title, required this.description, required this.date, required this.colorNumber, required this.isDone,required this.categoryId,required this.onTap, required this.time});
  final String title;
  final String description;
  final String time;
  final String date;
  final int colorNumber;
  final  isDone;
  final categoryId;
  final void Function()? onTap;




  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width:5.w,
          height: 13.h,
          decoration: BoxDecoration(
            color: categoryId=="1"?Colors.greenAccent:
                   categoryId=="2"?Colors.blueAccent:
                   Colors.amberAccent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.sp), // Adjust the value for the top-left radius
              bottomLeft: Radius.circular(10.sp), // Adjust the value for the bottom-left radius
            ),),
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 1.h),
          width: 85.w,
          height: 13.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      constraints: BoxConstraints(
                        maxWidth: 60.w, // Set your desired maximum width here
                      ),
                      child: Text(title,maxLines: 1,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold),)),
                  SizedBox(height:1.h),
                  Container(
                      constraints: BoxConstraints(
                        maxWidth: 57.w, // Set your desired maximum width here
                      ),
                      child: Text(description,maxLines: 1,style: TextStyle(fontSize: 11.sp,color: Colors.grey),)),
                  SizedBox(height:2.h),
                  Container(
                      constraints: BoxConstraints(
                        maxWidth: 60.w, // Set your desired maximum width here
                      ),
                      child: Text('$date  $time',maxLines: 1,style: TextStyle(fontSize: 11.sp,color: Colors.grey),)),
                ],),
              const Spacer(),
              Padding(
                padding: EdgeInsets.all(1.w),
                child: InkWell(
                  onTap:onTap,
                  child: Container(
                    width: 7.w, // Set the desired width
                    height: 7.w, // Set the desired height
                    decoration: BoxDecoration(
                      color: isDone=="true"?AppColor.primaryColor:Colors.transparent,
                      shape: BoxShape.circle, // Make it a circle
                      border: Border.all(
                        color: isDone=="true"?AppColor.primaryColor:Colors.grey, // Border color
                        width: 2.0, // Border width
                      ),
                      // You can also add a background color if needed
                      // color: Colors.blue, // Background color
                    ),
                    child: isDone=="true"?Center(child:  Icon(Icons.check,color: Colors.white,size: 5.w,)):Container(),
                  ),
                ),
              ),

            ],),)
      ],);
  }
}
