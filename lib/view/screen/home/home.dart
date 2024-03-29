import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/home/homeController.dart';
import '../../widget/home/appBarPart/appBarPart.dart';
import '../../widget/home/filterPart/filter.dart';
import '../../widget/home/newTaskPart/newTaskPart.dart';
import '../../widget/home/tasksPart/tasksPart.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller=Get.put(HomeController());
    return ThemeSwitchingArea(
      child: Scaffold(
        // backgroundColor: const Color(0xFFEFEFEF),
        appBar: const AppBarPart(),
        body: GetBuilder<HomeController>(
          builder: (controller) {
            return Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                  child: Column(
                    children: [
                      const NewTaskPart(),
                      SizedBox(
                        height: 3.h,
                      ),

                      //filter part
                      StreamBuilder(
                        stream: controller.notesRef
                        .where('UserId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                          // stream: controller.notesRef
                          //     .snapshots()
                          //     .where((QuerySnapshot<Object?> snapshot) {
                          //   return snapshot.docs.any((doc) =>
                          //       doc['uniqueEmail'] ==
                          //       controller.myServices.sharedPreferences.getString("uniqueEmail"));
                          // }),
                          builder: (context, snapshot1) {
                            return controller.isNeedUpdate == false
                                ? FilterPart(
                                    numberOfAll:
                                        snapshot1.data?.docs.length == null
                                            ? "0"
                                            : '${snapshot1.data?.docs.length}',
                                    numberOfProccessing: snapshot1.data?.docs
                                                .where((doc) =>
                                                    doc['isDone'] == "false")
                                                .length ==
                                            null
                                        ? "0"
                                        : '${snapshot1.data?.docs.where((doc) => doc['isDone'] == "false").length}',
                                    numberOfDone: snapshot1.data?.docs
                                                .where((doc) =>
                                                    doc['isDone'] == "true")
                                                .length ==
                                            null
                                        ? "0"
                                        : '${snapshot1.data?.docs.where((doc) => doc['isDone'] == "true").length}',
                                    filterId: controller.filterId,
                                    onTap1: () {
                                      controller.getForFilter(1);
                                      print((controller.filterId));
                                    },
                                    onTap2: () {
                                      controller.getForFilter(2);
                                      print((controller.filterId));
                                    },
                                    onTap3: () {
                                      controller.getForFilter(3);
                                      print((controller.filterId));
                                    },
                                  )
                                : FilterPart(
                                    numberOfAll: "0",
                                    numberOfProccessing: "0",
                                    numberOfDone: "0",
                                    filterId: controller.filterId,
                                    onTap1: () {
                                      controller.getForFilter(1);

                                    },
                                    onTap2: () {
                                      controller.getForFilter(2);
                                    },
                                    onTap3: () {
                                      controller.getForFilter(3);
                                    },
                                  );
                          }),
                      //end filter part
                      SizedBox(
                        height: 3.h,
                      ),
                      const TasksPart(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
