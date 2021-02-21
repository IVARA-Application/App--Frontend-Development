
import 'package:flutter/material.dart';
import 'package:ivara_app/Login/background.dart';
import 'package:ivara_app/Parents_app/Parents_homepage.dart';
import 'package:ivara_app/Signup/signup.dart';
import 'package:ivara_app/students_app/student_homepage.dart';
import 'package:ivara_app/teachers_app/dashboard.dart';
import 'package:ivara_app/useful_components/have_account.dart';
import 'package:ivara_app/useful_components/round_button.dart';
import 'package:ivara_app/useful_components/round_field.dart';
import 'package:ivara_app/useful_components/round_password.dart';
import 'package:ivara_app/Controllers/FirebaseController.dart';
import 'package:get/get.dart';
class Loginpage2 extends GetWidget<FirebaseController> {
  String page;
  Loginpage2(currentPage){
    page=currentPage;
  }

  var email;
  var password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
         //   SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/logo_small.png",
              height: size.height * 0.4,
              width: size.width * 1,
            ),
          //  SizedBox(height: size.height * 0.01),
            Text(
              "Please login or sign up to continue using the app",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.02),
            RoundedInputField(
              hintText: "Enter your email",
              onChanged: (value) {
                email=value;
              },
            ),
            RoundedPasswordField(
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(page)));

              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                if(page=='Parent'){
                  controller.login(email, password,"Parent");
                }
                else if(page=='Student'){
                  controller.login(email, password,"Student");
                }
                else{
                  controller.login(email, password,"Teacher");
                }
              },
            ),
          ],
        ),
      ),
    ),
    );
  }
}

