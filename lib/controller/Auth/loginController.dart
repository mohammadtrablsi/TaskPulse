import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/checkinternet.dart';
import '../../core/services/services.dart';

class LoginController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  TextEditingController? email;
  TextEditingController? password;
  GlobalKey<FormState>? formstate;
  bool isPassword = true;
  Map data = {};

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    formstate = GlobalKey<FormState>();
    super.onInit();
  }

  void revPassword() {
    isPassword = !isPassword;
    update();
  }

  void LoginFireBase() async {
    if (formstate!.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      if (await checkInternet()) {
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: email!.text, password: password!.text);
          statusRequest = StatusRequest.success;
          update();
          myServices.sharedPreferences.setString("uniqueEmail", email!.text);
          Get.offNamed(AppRoute.home);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            Get.snackbar("warning", "No user found for that email.");
            print('No user found for that email.');
            statusRequest = StatusRequest.failure;
            update();
          } else if (e.code == 'wrong-password') {
            Get.snackbar("warning", "Wrong password provided for that user.");
            print('Wrong password provided for that user.');
            statusRequest = StatusRequest.failure;
            update();
          }
        }
      } else {
        Get.snackbar("warning", "check on your connection with net");
        statusRequest = StatusRequest.offlinefailure;
        update();
      }
    }
  }
}
