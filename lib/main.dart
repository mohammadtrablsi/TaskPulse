
import 'package:TaskPulse/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'core/localization/translation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';



import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initialServices();
  runApp(
      MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('<<<<<<<<User is currently signed out!>>>>>>>>');
      } else {
        print('<<<<<<<<User is signed in!>>>>>>>>>>>>');
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //for language to
    // LocaleController controller = Get.put(LocaleController());
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        translations: MyTranslation(),
        debugShowCheckedModeBanner: false,
        // home: AnimatedSplashScreen(
        //   splash: Image.asset(
        //     AppImageAsset.applogo,
        //     width: 200,
        //     height: 200,
        //     scale: 1,
        //   ),
        //   nextScreen: tryo(),
        //   splashTransition: SplashTransition.fadeTransition,
        //   backgroundColor: AppColor.primaryColor,
        //   animationDuration: Duration(seconds: 3),
        // ),
        //  title: 'app',
        // locale: controller.language,
        // theme: controller.appTheme,
        /////for crud for now
        // initialBinding: InitialBindings(),

        getPages: routes,
        // home: const Login(),
      );
    });
  }
}
