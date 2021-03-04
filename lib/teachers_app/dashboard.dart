import 'package:flutter/material.dart';
import 'package:ivara_app/teachers_app/attendance.dart';
import 'package:ivara_app/teachers_app/classroom.dart';
import 'package:ivara_app/teachers_app/doubtPortal.dart';
import 'package:ivara_app/teachers_app/doubtPortalClassList.dart';
import 'package:ivara_app/teachers_app/entermarks.dart';
import 'package:ivara_app/teachers_app/profile.dart';

class TeacherDashboard extends StatefulWidget {
  static String id = 'TeacherDashboard';
  @override
  _TeacherDashboardState createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  Color blue = Color(0xFF076FA0);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: blue,
      appBar: AppBar(
        elevation: 0,
        title: Center(child: Text('IVARA')),
        backgroundColor: blue,
        leading: Container(),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('TapNotification');
            },
            icon: Stack(
              children: <Widget>[
                Icon(Icons.notifications, color: Colors.white),
                Positioned(
                  left: 14.0,
                  child: Icon(
                    Icons.brightness_1,
                    color: Colors.white,
                    size: 9.0,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenHeight * 0.04,
                  vertical: screenHeight * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Text('Hello,',
                      style: TextStyle(
                          fontSize: screenHeight * 0.05,
                          color: Colors.white,
                          fontWeight: FontWeight.w300)),
                  Text('Hemanth',
                      style: TextStyle(
                          fontSize: screenHeight * 0.05,
                          color: Colors.white,
                          fontWeight: FontWeight.w300))
                ],
              ),
            ),
            Expanded(
              child: Hero(
                tag: "Container",
                //transitionOnUserGestures: true,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(screenHeight * 0.04),
                          topLeft: Radius.circular(screenHeight * 0.04)),
                      color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenHeight * 0.04,
                        vertical: screenHeight * 0.0),
                    child: ListView(
                      children: [
                        SizedBox(height: screenHeight * 0.04),
                        RaisedButton(
                            color: blue,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(
                                    screenHeight * 0.035)),
                            onPressed: () {
                              Navigator.pushNamed(context, TeacherClassroom.id);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.1),
                              child: Text('MY CLASS ROOMS',
                                  style: TextStyle(
                                      fontSize: screenHeight * 0.03,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white)),
                            )),
                        SizedBox(height: screenHeight * 0.04),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: RaisedButton(
                                  color: blue,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(
                                          screenHeight * 0.015)),
                                  onPressed: () {
                                    Navigator.pushNamed(context, EnterMarks.id);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: screenHeight * 0.04),
                                    child: Text('ENTER MARKS',
                                        style: TextStyle(
                                            fontSize: screenHeight * 0.02,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white)),
                                  )),
                            ),
                            SizedBox(width: screenHeight * 0.04),
                            Expanded(
                              child: RaisedButton(
                                  color: blue,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(
                                          screenHeight * 0.015)),
                                  onPressed: () {
                                    Navigator.pushNamed(context, Attendance.id);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: screenHeight * 0.04),
                                    child: Text('ATTENDANCE',
                                        style: TextStyle(
                                            fontSize: screenHeight * 0.02,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white)),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.04),
                        RaisedButton(
                            color: blue,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(
                                    screenHeight * 0.015)),
                            onPressed: () {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.05),
                              child: Text('VIRTUAL TUTIONS',
                                  style: TextStyle(
                                      fontSize: screenHeight * 0.03,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white)),
                            )),
                        SizedBox(height: screenHeight * 0.04),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: RaisedButton(
                                  color: blue,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(
                                          screenHeight * 0.015)),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DoubtPortalClassList(),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: screenHeight * 0.04),
                                    child: Text('DOUBT PORTAL',
                                        style: TextStyle(
                                            fontSize: screenHeight * 0.02,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white)),
                                  )),
                            ),
                            SizedBox(width: screenHeight * 0.04),
                            Expanded(
                              child: RaisedButton(
                                  color: blue,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(
                                          screenHeight * 0.015)),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, TeacherProfile.id);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: screenHeight * 0.04),
                                    child: Text('MY PROFILE',
                                        style: TextStyle(
                                            fontSize: screenHeight * 0.02,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white)),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.04,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            RaisedButton(
                onPressed: () {},
                color: blue,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  child: Center(
                    child: Text('POST AN ANNOUNCEMENT',
                        style: TextStyle(
                            fontSize: screenHeight * 0.025,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
