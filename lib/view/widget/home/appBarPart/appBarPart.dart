import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:TaskPulse/controller/home/homeController.dart';



class AppBarPart extends GetView<HomeController> {
  const AppBarPart({super.key});




  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          Row(
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
                        // Check if there is any document in the snapshot
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
                        return const Center();
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
          PopupMenuButton<String>(
            onSelected: (value) async{
              controller.logout(value);
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'logout',
                child: Center(child: Text('logout')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}