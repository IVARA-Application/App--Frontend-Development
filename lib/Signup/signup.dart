import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivara_app/Controllers/FirebaseController.dart';
import 'package:ivara_app/Login/background.dart';
import 'package:ivara_app/Login/login.dart';
import 'package:ivara_app/Parents_app/Parents_homepage.dart';
import 'package:ivara_app/students_app/student_homepage.dart';
import 'package:ivara_app/teachers_app/dashboard.dart';
import 'package:ivara_app/useful_components/have_account2.dart';
import 'package:ivara_app/useful_components/round_button.dart';
import 'package:ivara_app/useful_components/round_field.dart';
import 'package:ivara_app/useful_components/round_password.dart';
import 'package:ivara_app/useful_components/round_password2.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SignUpScreen extends GetWidget<FirebaseController> {
  String page;

  SignUpScreen(currentPage) {
    page = currentPage;
  }

  // final TextEditingController user_name=TextEditingController();
  //  final TextEditingController email=TextEditingController();
  //  final TextEditingController phone_no=TextEditingController();
  //  final TextEditingController password=TextEditingController();
  var user_name;
  var email;
  var phone_no;
  var password;
  String role ;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //   SizedBox(height: size.height * 0.03),
              //  SizedBox(height: size.height * 0.01),
              RoundedInputField(
                hintText: "Enter your user name",
                onChanged: (value) {
                  user_name = value;
                },
              ),
              RoundedInputField(
                hintText: "Enter your Email",
                icon: Icons.email,
                onChanged: (value) {
                  email = value;
                },
              ),
              RoundedInputField(
                hintText: "Enter your Phone Number",
                icon: Icons.phone,
                onChanged: (value) {
                  phone_no = value;
                },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  password = value;
                },
              ),
              RoundedPasswordField2(
                onChanged: (value) {},
              ),
              SizedBox(height: size.height * 0.02),
              CheckboxListTile(
                  activeColor: Theme
                      .of(context)
                      .accentColor,
                  title: Text('   I agree with all terms and conditions'
                    , style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  value: false, onChanged: null),
              SizedBox(height: size.height * 0.02),
              AlreadyHaveAnAccountCheck2(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Loginpage2(page);
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * 0.02),
              RoundedButton(
                text: "REGISTER",
                press: () {
                  if (page == 'Parent') {
                    controller.createUser(user_name, email, password, "Parent");
                  }
                  else if (page == 'Student') {
                    controller.createUser(user_name, email, password, "Student");
                  }
                  else {
                    controller.createUser(user_name, email, password, "Teacher");
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
