import 'package:flutter/material.dart';
import 'package:ivara_app/teachers_app/previousAttendance.dart';

class Attendance extends StatefulWidget {
  static String id = 'Attendance';
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  Color blue = Color(0xFF076FA0);
  List<Map> attendanceList = [
    {'name': 'Hemanth', 'absent': true},
    {'name': 'Khushwant', 'absent': false},
    {'name': 'Tarun', 'absent': false},
    {'name': 'Hemanth', 'absent': true},
    {'name': 'Khushwant', 'absent': false},
    {'name': 'Tarun', 'absent': false},
  ];

  Widget getAttendanceList(screenHeight, screenWidth) {
    return ListView.builder(
      itemCount: attendanceList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: Row(children: [
            Text(attendanceList[index]['name'],
                style: TextStyle(
                    fontSize: screenHeight * 0.028,
                    fontWeight: FontWeight.w600)),
            Spacer(),
            SizedBox(
              height: screenHeight * 0.08,
              width: screenWidth * 0.1,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (attendanceList[index]['absent']) {
                      attendanceList[index]['absent'] = false;
                    } else {
                      attendanceList[index]['absent'] = true;
                    }
                  });
                },
                icon: Stack(
                  children: [
                    Icon(
                        attendanceList[index]['absent']
                            ? Icons.brightness_1
                            : Icons.radio_button_unchecked,
                        color: attendanceList[index]['absent']
                            ? Colors.red
                            : Colors.black),
                    Icon(Icons.radio_button_unchecked),
                  ],
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.05)
          ]),
        );
      },
    );
  }

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
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenHeight * 0.04,
                      vertical: screenHeight * 0.02),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Attendance List',
                            style: TextStyle(
                                fontSize: screenHeight * 0.05,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                        IconButton(
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>PreviousAttendance()));
                          },
                          icon: Icon(Icons.event,color: Colors.white,),
                          iconSize: screenHeight * 0.05,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Hero(
                    //transitionOnUserGestures: true,
                    tag: "Container",
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight:
                                      Radius.circular(screenHeight * 0.04),
                                  topLeft:
                                      Radius.circular(screenHeight * 0.04)),
                              color: Colors.white),
                          child: Column(
                            children: [
                              SizedBox(height: screenHeight * 0.05),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.05),
                                child: Row(
                                  children: [
                                    Text('STUDENT NAME',
                                        style: TextStyle(
                                            fontSize: screenHeight * 0.028,
                                            fontWeight: FontWeight.w800,
                                            color: blue)),
                                    Spacer(),
                                    Text('ATTENDANCE',
                                        style: TextStyle(
                                            fontSize: screenHeight * 0.028,
                                            fontWeight: FontWeight.w800,
                                            color: blue)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: getAttendanceList(
                                    screenHeight, screenWidth),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: screenWidth * 0.08,
              bottom: screenHeight * 0.05,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Material(
                    color: Colors.transparent,
                    shape: CircleBorder(),
                    child: Image.asset(
                      './assets/backbutton.png',
                      height: screenHeight * 0.1,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
