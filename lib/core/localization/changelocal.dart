// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../constant/apptheme.dart';
// import '../services/services.dart';
//
// class LocaleController extends GetxController {
//   Locale? language;
//
//   MyServices myServices = Get.find();
//
//   ThemeData appTheme = lighttheme;
//
//   changeLang(String langcode) {
//     Locale locale = Locale(langcode);
//     myServices.sharedPreferences.setString("lang", langcode);
//     Get.updateLocale(locale);
//   }
//
//   changetheme(value) {
//     myServices.sharedPreferences.setBool("theme", value);
//     if (value == true) {
//       appTheme = darktheme;
//     }
//     if (value == false) {
//       appTheme = lighttheme;
//     }
//     Get.changeTheme(appTheme);
//   }
//
//   @override
//   void onInit() {
//     String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
//     if (sharedPrefLang == "ar") {
//       language = const Locale("ar");
//     } else if (sharedPrefLang == "en") {
//       language = const Locale("en");
//     } else {
//       language = Locale(Get.deviceLocale!.languageCode);
//     }
//     var theme = myServices.sharedPreferences.getBool("theme");
//     if (theme == true) {
//       appTheme = darktheme;
//       Get.changeTheme(appTheme);
//     } else if (theme == false) {
//       appTheme = lighttheme;
//       Get.changeTheme(appTheme);
//     }
//     super.onInit();
//   }
// }