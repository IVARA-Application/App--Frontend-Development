import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ivara_app/Parents_app/Parents_homepage.dart';
import 'package:ivara_app/students_app/academics/academics.dart';
import 'package:ivara_app/students_app/attendance/attendance.dart';
import 'package:ivara_app/students_app/dashboard/dashboard.dart';
import 'package:ivara_app/students_app/layout/main_drawer.dart';
import 'package:ivara_app/students_app/notification.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';


class SkilldevelopmentPage extends StatefulWidget{

  static String id = 'skilldevelopmentPage';

  @override
  _SkilldevelopmentPageState  createState() => _SkilldevelopmentPageState();

}

class _SkilldevelopmentPageState extends State<SkilldevelopmentPage> {

  @override
  Widget build(BuildContext context) {
    int index = 0;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0772a0),
        centerTitle: true,
        elevation: 1.0,
        title: Text('COURSES',
        style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(LineAwesomeIcons.bell),
            color: Colors.white,
            highlightColor: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, NotificationPage.id);
            },
          )
        ],
      ),

        body: Container(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.08,
                  left: screenWidth * 0.06,
                  right: screenWidth * 0.06,
                ),
                child: GestureDetector(
                  onTap: () => {
                  },
                  child: Container(
                      width: screenWidth,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xff0772a0),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                            spreadRadius: 6.0,
                          )
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top:screenHeight*0.056),
                            child: Text(
                              'TECH COURSES',
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          )
                        ],
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.08,
                  left: screenWidth * 0.06,
                  right: screenWidth * 0.06,
                ),
                child: GestureDetector(
                  onTap: () => {
                  },
                  child: Container(
                      width: screenWidth,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xff0772a0),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                            spreadRadius: 6.0,
                          )
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top:screenHeight*0.056),
                            child: Text(
                              'NON TECH COURSES',
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          )
                        ],
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.08,
                  left: screenWidth * 0.06,
                  right: screenWidth * 0.06,
                ),
                child: GestureDetector(
                  onTap: () => {
                  },
                  child: Container(
                      width: screenWidth,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xff0772a0),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                            spreadRadius: 6.0,
                          )
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top:screenHeight*0.056),
                            child: Text(
                              'MANAGEMENT COURSES',
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          )
                        ],
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.08,
                  left: screenWidth * 0.06,
                  right: screenWidth * 0.06,
                ),
                child: GestureDetector(
                  onTap: () => {
                  },
                  child: Container(
                      width: screenWidth,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xff0772a0),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                            spreadRadius: 6.0,
                          )
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top:screenHeight*0.056),
                            child: Text(
                              'ACTIVITIES',
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          )
                        ],
                      )),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],


          ),
        )
    );



  }
}