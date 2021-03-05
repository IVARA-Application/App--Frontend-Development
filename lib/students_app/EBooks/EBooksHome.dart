import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivara_app/Controllers/EBooksController.dart';
import 'package:ivara_app/students_app/EBooks/chaptersListPage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../notification.dart';

class EBooksHome extends StatefulWidget {
  int studentClass;
  EBooksHome(this.studentClass);
  @override
  _EBooksHomeState createState() => _EBooksHomeState();
}

class _EBooksHomeState extends State<EBooksHome> {
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
          title: Text(
            'Class ${widget.studentClass} E Books',
            style: TextStyle(color: Colors.white, fontSize: 15),
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
          child: ListView.builder(
              itemCount: Get.find<EBooksController>()
                  .subjects[widget.studentClass.toString()]
                  .length,
              itemBuilder: (context, index) {
                return subjectTile(
                    screenHeight,
                    screenWidth,
                    Get.find<EBooksController>()
                        .subjects[widget.studentClass.toString()][index]);
              }),
        ));
  }

  Widget subjectTile(screenHeight, screenWidth, String subject) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.05,
        left: screenWidth * 0.06,
        right: screenWidth * 0.06,
      ),
      child: GestureDetector(
        onTap: () {
          Get.to(ChaptersListPage(widget.studentClass,subject));
        },
        child: Container(
            width: screenWidth,
            height: 90,
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
                  padding: EdgeInsets.only(top: screenHeight * 0.048),
                  child: Text(
                    subject,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
