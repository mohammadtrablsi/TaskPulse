import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:TaskPulse/controller/home/homeController.dart';



class AppBarPart extends GetView<HomeController> implements PreferredSizeWidget  {
  const AppBarPart();

   @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);





  @override
  Widget build(BuildContext context) {
    return AppBar(
          elevation: 0.4,
          centerTitle: true, 
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Hi",
                    style: TextStyle(
                        fontSize: 13.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  StreamBuilder<QuerySnapshot>(
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        final userData = snapshot.data!.docs.first.data() as Map<String, dynamic>;
                        final userName = userData['name'] as String;
                        return Text(
                          userName,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        );

                      } else {
                        return  Text(
                          "loading..",
                          style: TextStyle(
                            fontSize: 13.sp,
                          ),
                        );;
                      }
                    },
                    stream: controller.usersRef
                        .where('UserId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                  ),

                ],
              ),
            ],
          ), 
          leading: SizedBox(
            width: 15.w,
            child: ThemeSwitcher(
              clipper: const ThemeSwitcherCircleClipper(),
              builder: (BuildContext context) {
                return DayNightSwitcherIcon(
                  isDarkModeEnabled: controller.toggleModeValue,
                  onStateChanged: (isDarkModeEnabled) {
                    controller.changeMode(context);
                  },
                );
              },
            ),
          ),
           actions: [
            SizedBox(
              width: 15.w,
              child: PopupMenuButton<String>(
                onSelected: (value) async {
                  controller.logout(value);
                },
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem<String>(
                    value: 'logout',
                    child: Center(child: Text('logout')),
                  ),
                ],
              ),
            ),
          ],
          );
  }
  

}
