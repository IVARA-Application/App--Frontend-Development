import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivara_app/Controllers/FirebaseController.dart';
import 'package:ivara_app/Login/login.dart';
import 'package:ivara_app/students_app/auth/login.dart';
import 'package:ivara_app/teachers_app/dashboard.dart';
import 'package:ivara_app/students_app/student_homepage.dart';

import 'Parents_app/Parents_homepage.dart';

class HomePage extends StatelessWidget {
  static String id = 'HomePage';

  const HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0),
              child: Center(
                child: Text(
                  'Welcome to IVentors Initiatives',
                ),
              ),
            ),
            Center(
              child: Text(
                'Please login or signup to continue using the app',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black45,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // createButton('Parents', Colors.black, Colors.white),
            Padding(
              padding: EdgeInsets.all(8),
              child: ButtonTheme(
                height: 60,
                minWidth: 200,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Loginpage2('Parent')));
                  },
                  color: Colors.black,
                  child: Text(
                    'Parents',
                    style: TextStyle(
                        color: Colors.white, fontSize: 30, letterSpacing: 1),
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 2),
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: ButtonTheme(
                height: 60,
                minWidth: 200,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Loginpage2('Teacher')));
                  },
                  color: Colors.white,
                  child: Text(
                    'Teacher',
                    style: TextStyle(
                        color: Colors.black, fontSize: 30, letterSpacing: 1),
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 2),
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: ButtonTheme(
                height: 60,
                minWidth: 200,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Loginpage2('Student')));
                  },
                  color: Colors.yellow,
                  child: Text(
                    'Student',
                    style: TextStyle(
                        color: Colors.black, fontSize: 30, letterSpacing: 1),
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 2),
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
