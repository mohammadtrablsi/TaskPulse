
import 'package:TaskPulse/view/screen/Focus/focus.dart';
import 'package:get/get.dart';
import 'package:TaskPulse/view/screen/Auth/login.dart';
import 'package:TaskPulse/view/screen/Auth/register.dart';
import 'package:TaskPulse/view/screen/home/home.dart';
import 'package:TaskPulse/view/screen/update/updateTask.dart';

import 'core/middleware/mymiddleware.dart';

List<GetPage<dynamic>>? routes = [

  ////Auth
  //register
  GetPage(name: "/register", page: () =>   const Register()),
  //login
  GetPage(
   name: "/", page: () => const Login(), middlewares: [MyMiddleWare()]),//, middlewares: [MyMiddleWare()]
  GetPage(name: "/login", page: () =>   const Login()),
  ////home
  GetPage(name: "/home", page: () =>   const Home()),
  ////updateTask
  GetPage(name: "/updateTask", page: () =>   const UpdateTask()),
  //focus
  GetPage(name: "/focus", page: () =>   const Focus()),

];
