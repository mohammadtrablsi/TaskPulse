import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:TaskPulse/core/class/statusrequest.dart';
import 'package:TaskPulse/core/constant/imageassets.dart';
import 'package:TaskPulse/core/constant/routes.dart';

import '../../../../../core/constant/color.dart';
import '../../../controller/Auth/loginController.dart';
import '../../../core/functions/validator.dart';
import '../../widget/in common/appButton.dart';
import '../../widget/in common/appTextField.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      body: GetBuilder<LoginController>(builder: (controller){
       return Container(
         child: SingleChildScrollView(
           padding: EdgeInsets.zero,
           child: Column(
             children: [
               Container(
                 height: 30.h,
                 decoration: const BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage(AppImageAsset.toDo2),
                     fit: BoxFit.cover,
                   ),
                 ),
               ),
               SizedBox(
                 height: 3.h,
               ),
               Text(
                 "Welcom back!",
                 style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
               ),
               SizedBox(
                 height: 1.sp,
               ),
               Text(
                 "Login to your existing account of Snapenotes",
                 style: TextStyle(fontSize: 12.sp, color: Colors.grey),
               ),
               SizedBox(
                 height: 6.h,
               ),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 5.w),
                 child: Form(
                   key: controller.formstate,
                   child: Column(
                     children: [
                       AppTextField(
                         controller: controller.email,
                         label: 'enter your email',
                         preIcon: Icons.email,
                         vaildator: (val) {
                           return vaildator(val!, 8, 50, 'email');
                         },
                         obscureText: false,
                         suffixIcon: null,
                         suffixIconOnPressed: () {  },
                       ),
                       SizedBox(height: 4.h,),
                       AppTextField(
                         controller: controller.password,
                         label: 'enter your password',
                         preIcon: Icons.password,
                         vaildator: (val) {
                           return vaildator(val!, 5, 15, 'password');                    },
                         obscureText: controller.isPassword,
                         suffixIcon: controller.isPassword
                             ? Icons.visibility
                             : Icons.visibility_off,
                         suffixIconOnPressed: () {
                           controller.revPassword();
                         },
                       ),
                       SizedBox(height: 10.h,),
                       AppButton(widget: controller.statusRequest==StatusRequest.loading?SizedBox(height: 3.h,width: 6.w,child: CircularProgressIndicator(color: Colors.white,)):Text("LOG IN",style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold,color: Colors.white),), radius: 13.sp, paddinghorizontal: 7.h, paddingvertical: 2.h, onpressed: () {
                         controller.LoginFireBase();
                         // Get.offNamed(AppRoute.home);
                       },),
                       SizedBox(height: 1.h,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                         Text("Don't have an account?",style: TextStyle(color: Colors.grey),),
                         TextButton(onPressed: (){
                           Get.offNamed(AppRoute.register);
                         }, child: const Text("Sign Up",style: TextStyle(color: AppColor.primaryColor),))
                       ],),
                     ],
                   ),
                 ),
               ),
             ],
           ),
         ),
       );
      },),
    );
  }
}
