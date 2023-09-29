import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:TaskPulse/core/class/statusrequest.dart';

import '../../core/constant/routes.dart';

class HomeController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  CollectionReference usersRef = FirebaseFirestore.instance.collection('users');
  CollectionReference notesRef = FirebaseFirestore.instance.collection('Notes');
  int filterId = 1;
  var fbm = FirebaseMessaging.instance;
  bool isNeedUpdate = false;

  @override
  void onInit() {
    fbm.getToken().then((value) => print(value));
    super.onInit();
  }

  void getForFilter(id) {
    if (id == 1) {
      filterId = 1;
      update();
    } else if (id == 2) {
      filterId = 2;
      update();
    } else {
      filterId = 3;
      update();
    }
  }

  void checkBox(snapshot, index) async {
    var documentId = snapshot.data!.docs[index].id;
    final DocumentReference<Object?> docRef =
        FirebaseFirestore.instance.collection('Notes').doc(documentId);
    if ('${(snapshot.data!.docs[index].data() as Map<String, dynamic>)['isDone']}' ==
        "false") {
      try {
        await docRef.update({
          'isDone': "true",
        });
        print('Document successfully updated');
      } catch (error) {
        print('Error updating document: ');
      }
    } else {
      try {
        await docRef.update({
          'isDone': "false",
        });
        print('Document successfully updated');
      } catch (error) {
        print('Error updating document: ');
      }
    }
  }

  void deleteTask(snapshot, index, doneDocs) async {
    await FirebaseFirestore.instance
        .collection('Notes')
        .doc(snapshot.data!.docs[index].id)
        .delete();
  }

  logout(value) async {
    try {
      await FirebaseAuth.instance.signOut();
      print('User signed out successfully.');
      Get.offAllNamed(AppRoute.login);
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  void needUpdate(Id) {
    if (Id == 1) {
      isNeedUpdate = true;
      update();
    } else {
      isNeedUpdate = false;
      update();
    }
  }

  void Dismissed(snapshot, proccessingDocs, doneDocs, index) async {
    await FirebaseFirestore.instance
        .collection('Notes')
        .doc(snapshot.data!.docs[index].id)
        .delete();
    if (filterId == 1) {
      if (snapshot.data!.docs.length <= 1 &&
          proccessingDocs.length <= 1 &&
          doneDocs.length <= 1) {
        needUpdate(1);
        update();
      } else {
        needUpdate(2);
        update();
      }
    } else if (filterId == 2) {
      if (snapshot.data!.docs.length <= 1 &&
          proccessingDocs.length <= 1 &&
          doneDocs.length <= 1) {
        needUpdate(1);
        update();
      } else {
        needUpdate(2);
        update();
      }
    } else if (filterId == 3) {
      if (snapshot.data!.docs.length <= 1 &&
          proccessingDocs.length <= 1 &&
          doneDocs.length <= 1) {
        needUpdate(1);
        update();
      } else {
        needUpdate(2);
        update();
      }
    }
  }
}
