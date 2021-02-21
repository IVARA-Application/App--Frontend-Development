import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ivara_app/students_app/drawer_part/Student_abroad/Courses_available.dart';
import 'package:ivara_app/students_app/notification.dart';

import 'package:ivara_app/students_app/drawer_part/Student_abroad/Scholarships.dart';
import 'package:ivara_app/students_app/drawer_part/Student_abroad/news_and_blogs.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:ivara_app/students_app/layout/sidebar.dart';
import 'package:ivara_app/students_app/drawer_part/Doubt_portal/doubt_help.dart';
import 'package:ivara_app/students_app/drawer_part/Entrance_preparation/Entrance_exams.dart';
import 'package:ivara_app/students_app/drawer_part/Skill_development/skilldevelopment.dart';
import 'package:ivara_app/students_app/drawer_part/Student_abroad/Study_abroad_help.dart';
import 'package:ivara_app/students_app/drawer_part/Student_personal_details/studentpersonal.dart';
import 'package:ivara_app/students_app/drawer_part/Healmymind/schedule_a_call.dart';
import 'package:ivara_app/students_app/drawer_part/Student_abroad/Courses_available.dart';
import 'package:ivara_app/students_app/drawer_part/Student_abroad/Scholarships.dart';
import 'package:ivara_app/students_app/drawer_part/Student_abroad/news_and_blogs.dart';
import 'package:ivara_app/students_app/drawer_part/Healmymind/Heal_my_mind.dart';
import 'package:ivara_app/students_app/drawer_part/Healmymind/chat_to_counsellor.dart';
import 'package:ivara_app/students_app/drawer_part/Healmymind/heal_my_mind_videos.dart';
import 'package:ivara_app/Parents_app/Parents_attendance/p_attendance.dart';
import 'package:ivara_app/Parents_app/Parents_homepage.dart';

import 'Courses_available.dart';
import 'Scholarships.dart';
import 'news_and_blogs.dart';



class StudyAbroadHelpPage extends StatefulWidget{

  static String id = 'StudyAbroadHelpPage';

  @override
  _StudyAbroadHelpPageState  createState() => _StudyAbroadHelpPageState();

}

class _StudyAbroadHelpPageState extends State<StudyAbroadHelpPage> {

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
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text('STUDY ABROAD PROGRAM',
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
      drawer: MyDrawer(
        onTap: (ctx, i) {
          setState(() {
            index = i;
            Navigator.pop(ctx);
          });
        },
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CoursesAvailablePage()))
                  },
                  child: Container(
                      width: screenWidth,
                      height: 120,
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
                            padding: EdgeInsets.only(top:screenHeight*0.068),
                            child: Text(
                              'COURSES',
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ScholarshipsPage()))
                  },
                  child: Container(
                      width: screenWidth,
                      height: 120,
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
                            padding: EdgeInsets.only(top:screenHeight*0.068),
                            child: Text(
                              'SCHOLARSHIPS',
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NewsandblogsPage()))
                  },
                  child: Container(
                      width: screenWidth,
                      height: 120,
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
                            padding: EdgeInsets.only(top:screenHeight*0.068),
                            child: Text(
                              'NEWS AND BLOGS',
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          )
                        ],
                      )),
                ),
              ),
            ],


          ),
        )
    );



  }
}




