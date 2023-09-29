import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


import '../../../screen/new/createNewTask.dart';
import '../../in common/appButton.dart';

class NewTaskPart extends StatelessWidget {
  const NewTaskPart({super.key});




  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("My Tasks",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w900),),
        AppButton(widget: Row(children: [
          const Icon(Icons.add,color: Colors.white,),
          Text("New Task",style: TextStyle(fontSize: 14.sp,color: Colors.white),)
        ],), onpressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6.w),
                topRight: Radius.circular(6.w),
              ),
            ),
            builder: (context)=>
            const CreateNewTask(),
            context: context,
          );
        }, radius: 6.sp, paddinghorizontal: 4.w, paddingvertical: 1.h)
      ],);
  }
}
