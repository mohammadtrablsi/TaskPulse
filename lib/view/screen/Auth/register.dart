import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:TaskPulse/core/constant/color.dart';
import 'package:TaskPulse/core/constant/routes.dart';


import '../../../controller/Auth/registerController.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/functions/validator.dart';
import '../../widget/in common/appButton.dart';
import '../../widget/in common/appTextField.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterController controller = Get.put(RegisterController());
    return Scaffold(
      body: GetBuilder<RegisterController>(builder: (controller){
        return Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Let's get started!",
                  style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 2.sp,
                ),
                Text(
                  "Create an account to TaskPulse",
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
                          controller: controller.name,
                          label: 'enter your name',
                          preIcon: Icons.person,
                          vaildator: (val) {
                            return vaildator(val!, 2, 20, 'name');
                          },
                          obscureText: false,
                          suffixIcon: null,
                          suffixIconOnPressed: () {  },
                        ),
                        SizedBox(height: 4.h,),
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
                            controller.revPassword(1);
                          },
                        ),
                        SizedBox(height: 4.h,),
                        AppTextField(
                          controller: controller.repeatPassword,
                          label: 'repeat your password',
                          preIcon: Icons.password,
                          vaildator: (val) {
                            return vaildator(val!, 5, 15, 'password');                    },
                          obscureText: controller.isPassword2,
                          suffixIcon: controller.isPassword2
                              ? Icons.visibility
                              : Icons.visibility_off,
                          suffixIconOnPressed: () {
                            controller.revPassword(2);
                          },
                        ),
                        SizedBox(height: 8.h,),
                        AppButton(widget: controller.statusRequest==StatusRequest.loading?SizedBox(height: 3.h,width: 6.w,child: CircularProgressIndicator(color: Colors.white,)):Text("Create",style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold,color: Colors.white),), radius: 13.sp, paddinghorizontal: 7.h, paddingvertical: 2.h, onpressed: () {
                          controller.registerInFireBase();
                        },),
                        SizedBox(height: 1.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          const Text("Already have an account?"),
                          TextButton(onPressed: (){
                            Get.offNamed(AppRoute.login);
                          }, child: const Text("login here",style: TextStyle(color: AppColor.primaryColor),))
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
