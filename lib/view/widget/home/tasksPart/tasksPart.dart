import 'package:TaskPulse/core/constant/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:TaskPulse/controller/home/homeController.dart';
import 'package:TaskPulse/view/widget/home/tasksPart/taskItem.dart';

import '../../../../core/constant/routes.dart';



class TasksPart extends GetView<HomeController> {
  const TasksPart({super.key});




  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return SizedBox(
        height: 68.h,
        child: StreamBuilder(
            builder: (context, snapshot) {
              // if ( snapshot.data == null) {
              //   return  Center(child: SizedBox(width:10.w,height:5.h, child:const CircularProgressIndicator(color: AppColor.primaryColor,)));
              // }
              // else
               if ( !snapshot.hasData||snapshot.data == null) {
                return  const Center();
              }
              else {
                final proccessingDocs = snapshot.data!.docs
                    .where((doc) =>
                doc['isDone'] == 'false').toList();
                final doneDocs = snapshot.data!.docs.where((
                    doc) =>
                doc['isDone'] == 'true').toList();
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: controller.filterId == 1 ? snapshot
                      .data
                  !.docs
                      .length :
                  controller.filterId == 2 ? proccessingDocs
                      .length :
                  doneDocs.length,
                  itemBuilder: (context, index) {
                    return controller.isNeedUpdate==false?Dismissible(
                      key:  UniqueKey(),
    
                      background: Container(
                        alignment: Alignment.centerRight,
                      ),
                      child: InkWell(
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),topLeft: Radius.circular(20)),
                        onTap: () {
                          Get.toNamed(AppRoute.updateTask,
                            arguments: [
                              {
                                'title': controller.filterId ==
                                    1 ? '${(snapshot.data!
                                    .docs[index].data() as Map<
                                    String,
                                    dynamic>)['title']}' :
                                controller.filterId == 2
                                    ? '${(proccessingDocs[index]
                                    .data() as Map<
                                    String,
                                    dynamic>)['title']}'
                                    :
                                '${(doneDocs[index]
                                    .data() as Map<
                                    String,
                                    dynamic>)['title']}',
    
                                'description': controller
                                    .filterId == 1
                                    ? '${(snapshot.data!
                                    .docs[index].data() as Map<
                                    String,
                                    dynamic>)['description']}'
                                    :
                                controller.filterId == 2
                                    ? '${(proccessingDocs[index]
                                    .data() as Map<
                                    String,
                                    dynamic>)['description']}'
                                    :
                                '${(doneDocs[index]
                                    .data() as Map<
                                    String,
                                    dynamic>)['description']}',
    
                                'categoryId': controller
                                    .filterId == 1
                                    ? '${(snapshot.data!
                                    .docs[index].data() as Map<
                                    String,
                                    dynamic>)['categoryId']}'
                                    :
                                controller.filterId == 2
                                    ? '${(proccessingDocs[index]
                                    .data() as Map<
                                    String,
                                    dynamic>)['categoryId']}'
                                    :
                                '${(doneDocs[index]
                                    .data() as Map<
                                    String,
                                    dynamic>)['categoryId']}',
                                'date': controller.filterId == 1
                                    ? '${(snapshot.data!
                                    .docs[index].data() as Map<
                                    String,
                                    dynamic>)['date']}'
                                    :
                                controller.filterId == 2
                                    ? '${(proccessingDocs[index]
                                    .data() as Map<
                                    String,
                                    dynamic>)['date']}'
                                    :
                                '${(doneDocs[index]
                                    .data() as Map<
                                    String,
                                    dynamic>)['date']}',
                                'time': controller.filterId == 1
                                    ? '${(snapshot.data!
                                    .docs[index].data() as Map<
                                    String,
                                    dynamic>)['time']}'
                                    :
                                controller.filterId == 2
                                    ? '${(proccessingDocs[index]
                                    .data() as Map<
                                    String,
                                    dynamic>)['time']}'
                                    :
                                '${(doneDocs[index]
                                    .data() as Map<
                                    String,
                                    dynamic>)['time']}',
                                'index': index,
                                'snapshot': snapshot,
    
                              }
                            ],);
                        },
                        child: TaskItem(
                          title: controller.filterId == 1
                              ? '${(snapshot.data!.docs[index]
                              .data() as Map<String,
                              dynamic>)['title']}'
                              :
                          controller.filterId == 2
                              ? '${(proccessingDocs[index]
                              .data() as Map<String,
                              dynamic>)['title']}'
                              :
                          '${(doneDocs[index].data() as Map<
                              String,
                              dynamic>)['title']}',
    
                          description: controller.filterId ==
                              1 ? '${(snapshot.data!
                              .docs[index].data() as Map<
                              String,
                              dynamic>)['description']}' :
                          controller.filterId == 2
                              ? '${(proccessingDocs[index]
                              .data() as Map<String,
                              dynamic>)['description']}'
                              :
                          '${(doneDocs[index].data() as Map<
                              String,
                              dynamic>)['description']}',
                          time:  controller.filterId == 1
                              ? '${(snapshot.data!.docs[index]
                              .data() as Map<String,
                              dynamic>)['time']}'
                              :
                          controller.filterId == 2
                              ? '${(proccessingDocs[index]
                              .data() as Map<String,
                              dynamic>)['time']}'
                              :
                          '${(doneDocs[index].data() as Map<
                              String,
                              dynamic>)['time']}',
    
                          date: controller.filterId == 1
                              ? '${(snapshot.data!.docs[index]
                              .data() as Map<String,
                              dynamic>)['date']}'
                              :
                          controller.filterId == 2
                              ? '${(proccessingDocs[index]
                              .data() as Map<String,
                              dynamic>)['date']}'
                              :
                          '${(doneDocs[index].data() as Map<
                              String,
                              dynamic>)['date']}',
    
                          colorNumber: 1,
    
                          isDone: controller.filterId == 1
                              ? '${(snapshot.data!.docs[index]
                              .data() as Map<String,
                              dynamic>)['isDone']}'
                              :
                          controller.filterId == 2
                              ? '${(proccessingDocs[index]
                              .data() as Map<String,
                              dynamic>)['isDone']}'
                              :
                          '${(doneDocs[index].data() as Map<
                              String,
                              dynamic>)['isDone']}',
                          categoryId: controller.filterId == 1
                              ? '${(snapshot.data!.docs[index]
                              .data() as Map<String,
                              dynamic>)['categoryId']}'
                              :
                          controller.filterId == 2
                              ? '${(proccessingDocs[index]
                              .data() as Map<String,
                              dynamic>)['categoryId']}'
                              :
                          '${(doneDocs[index].data() as Map<
                              String,
                              dynamic>)['categoryId']}',
                          onTap: () {
                            controller.checkBox(
                                snapshot, index);
                          },
                        ),
                      ),
                      onDismissed: (direction) async {
                        controller.Dismissed(snapshot,proccessingDocs,doneDocs,index);
    
                      },
                    ):Container();
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 2
                        .h,); // Customize the separator here
                  },
                );
              }
    
            },
            // stream: controller.notesRef.orderBy('now', descending: true).snapshots()
            //     .where((QuerySnapshot<Object?> snapshot) {
            //   return snapshot.docs.any((doc) =>
            //   doc['UserId'] == FirebaseAuth.instance.currentUser!.uid);
              stream: controller.notesRef
                        .where('UserId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
            
    
    
        ),
    
    
      );
    },);
  }
}