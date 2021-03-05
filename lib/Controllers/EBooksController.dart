import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ivara_app/Models/chaptersModel.dart';
import 'package:firebase_database/firebase_database.dart';

class EBooksController extends GetxController {
  RxBool classAndSubjectsLoaded = false.obs;
  
  var classList = [];
  var subjects = {};
  void loadClassAndSubjectFromServer() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("EBooks")
        .get()
        .then((QuerySnapshot querySnapshot) async {
      classList = [];
      //getting all class
      await Future.forEach(querySnapshot.docs, (doc) {
        classList.add(int.parse(doc.id));
      });
    });
    classList.sort();

    await Future.forEach(classList, (studentClass) async {
      var subjectsList = [];
      await FirebaseFirestore.instance
          .collection("EBooks")
          .doc(studentClass.toString())
          .collection(studentClass.toString())
          .get()
          .then((QuerySnapshot querySnapshot)async {
        await Future.forEach(
          querySnapshot.docs,
          (doc) {
            subjectsList.add(doc.id);
          },
        );
      });
      subjects[studentClass.toString()] = subjectsList;
    });

    print(subjects);

    classAndSubjectsLoaded.value = true;
  }
}
