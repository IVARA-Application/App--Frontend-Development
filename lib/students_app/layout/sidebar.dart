import 'package:flutter/material.dart';
import 'package:ivara_app/students_app/drawer_part/Doubt_portal/doubt_help.dart';
import 'package:ivara_app/students_app/drawer_part/Entrance_preparation/Entrance_exams.dart';
import 'package:ivara_app/students_app/drawer_part/Healmymind/Heal_my_mind.dart';
import 'package:ivara_app/students_app/drawer_part/Skill_development/skilldevelopment.dart';
import 'package:ivara_app/students_app/drawer_part/Student_abroad/Study_abroad_help.dart';
import 'package:ivara_app/students_app/drawer_part/Student_personal_details/studentpersonal.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

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

import '../drawer_part/Doubt_portal/doubt_help.dart';
import '../drawer_part/Entrance_preparation/Entrance_exams.dart';
import '../drawer_part/Healmymind/Heal_my_mind.dart';
import '../drawer_part/Student_abroad/Study_abroad_help.dart';
import '../drawer_part/Student_personal_details/studentpersonal.dart';

class MyDrawer extends StatelessWidget {
  final Function onTap;
  MyDrawer({this.onTap});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.78,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: screenHeight*0.371,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenHeight*0.0
                        ),
                        child: Container(
                          height: screenHeight*0.29,
                          width: screenHeight*0.29,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icon/logo_small.png'),
                              fit: BoxFit.fill
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Text(
                        'Aman, B.Tech Third Year',
                        style: TextStyle(color: Color(0xff0772a0), fontSize: 15),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(color: Color(0xff0772a0),height: 3,),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CustomListTile(
              LineAwesomeIcons.home, 'HealMymind', () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HealMyMindPage()))
              },),
            CustomListTile(
                LineAwesomeIcons.rocket_chat, 'Study Abroad Support', () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => StudyAbroadHelpPage()))
                }),
            CustomListTile(
                LineAwesomeIcons.ios_app_store, 'Skill Development', () => {
                }),
            CustomListTile(
                LineAwesomeIcons.comment_dollar, 'Entrance Preparation', () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EntranceExamsPage()))
                }),
            CustomListTile(LineAwesomeIcons.question, '24 X 7 Doubt Portal', () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoubtHelpPage()))
                }),
            CustomListTile(LineAwesomeIcons.question, 'Student Personal Details', () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => StudentPersonalPage()))
                }),
            CustomListTile(LineAwesomeIcons.question, 'Virtual Tutions', () => {
                }),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;
  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xff0772a0)))
        ),
        child: InkWell(
          splashColor: Color(0xff0772a0),
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 21,color: Color(0xff0772a0)),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
