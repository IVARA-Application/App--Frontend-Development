import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ivara_app/Parents_app/Parents_homepage.dart';
import 'package:ivara_app/homepage.dart';
import 'package:ivara_app/students_app/student_homepage.dart';
import 'package:ivara_app/teachers_app/dashboard.dart';

class FirebaseController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>();

  String get user => _firebaseUser.value?.email;
  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());

    print(" Auth Change :   ${_auth.currentUser}");
  }

  // function to createuser, login and sign out user

  void createUser(
      String user_name, String email, String password, String role) async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection("Users");

    Map<String, String> userdata = {
      "User Name": user_name,
      "Email": email,
      "Role": role
    };
    Widget next_page(String role) {
      if (role == 'Parent') {
        return ParentsHomePage();
      } else if (role == 'Student') {
        return StudentHomePage();
      } else {
        return TeacherDashboard();
      }
    }

    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      reference.add(userdata).then((value) => Get.offAll(next_page(role)));
    }).catchError(
      (onError) =>
          Get.snackbar("Error while creating account ", onError.message),
    );
  }

  void login(String email, String password,String role) async {

    Widget next_page(String role) {
      if (role == 'Parent') {
        return ParentsHomePage();
      } else if (role == 'Student') {
        return StudentHomePage();
      } else {
        return TeacherDashboard();
      }
    }
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Get.offAll(next_page(role)))
        .catchError(
            (onError) => Get.snackbar("Error while sign in ", onError.message));
  }

  void signout() async {
    await _auth.signOut().then((value) => Get.offAll(HomePage()));
  }

}
