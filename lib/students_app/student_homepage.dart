import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ivara_app/students_app/ARLab/arLab.dart';
import 'package:ivara_app/students_app/academics/academics.dart';
import 'package:ivara_app/students_app/attendance/attendance.dart';
import 'package:ivara_app/students_app/dashboard/dashboard.dart';
import 'package:ivara_app/students_app/notification.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import './layout/sidebar.dart';


class StudentHomePage extends StatefulWidget{
  static String id = 'StudentHomePage';

  @override
  _StudentHomePageState  createState() => _StudentHomePageState();

}

class _StudentHomePageState extends State<StudentHomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff0772a0),
      
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
        title: Text('IVARA',
        style: TextStyle(color: Colors.white, fontSize: 25),
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

      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                width: screenWidth,
                height: 140,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(screenHeight*0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Text('Hello,',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                          ),
                          ),
                          Text('Aman',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white
                          ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight*0.03,
                        bottom: screenHeight*0.03,
                        left: screenWidth*0.35
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Image.asset('assets/icon/anime.png',width: screenWidth*0.19),
                      ),)
                  ],
                ),
            ),
              Container(
                width: screenWidth,
                height: screenHeight*0.72,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                      spreadRadius: 6.0,
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 0),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: screenHeight*0.02),
                      child: GestureDetector(
                        onTap: ()=>{
                          Navigator.pushNamed(context, DashboardPage.id)
                        },
                        child: Container(
                        width: screenWidth*0.8,
                        height: 140,
                        decoration: BoxDecoration(
                          color: Color(0xff0772a0),
                          borderRadius: BorderRadius.circular(20),
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
                                "STUDENT DASHBOARD",
                                style: TextStyle(fontSize: screenHeight*0.025, color: Colors.white),
                              ),
                            )
                          ],
                        )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: screenHeight*0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: GestureDetector(
                        onTap: ()=>{
                          Navigator.pushNamed(context, AcademicsPage.id)
                        },
                                                          child: Container(
                      width: screenWidth*0.38,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xff0772a0),
                        borderRadius: BorderRadius.circular(20),
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
                                padding: EdgeInsets.only(top:screenHeight*0.052),
                                child: Text(
                                  "ACADEMIC",
                                  style: TextStyle(fontSize: screenHeight*0.025, color: Colors.white),
                                ),
                              )
                        ],
                      )),
                            ),
                          ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: GestureDetector(
                        onTap: ()=>{
                          Navigator.pushNamed(context, AttendancePage.id)
                        },
                        child: Container(
                          width: screenWidth*0.38,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xff0772a0),
                            borderRadius: BorderRadius.circular(20),
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
                                padding: EdgeInsets.only(top:screenHeight*0.052),
                                child: Text(
                                  "ATTENDANCE",
                                  style: TextStyle(fontSize: screenHeight*0.025, color: Colors.white),
                                ),
                              )
                            ],
                          )),
                        ),
                      ),
                        ],
                      ),
                      ),
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight*0.02),
                      child: GestureDetector(
                        onTap: ()async{
                        //  Navigator.of(context).push(MaterialPageRoute(
                        //    builder: (context)=>ARLab()
                        //  ));
                        final channel = new MethodChannel("channel");
                        await channel.invokeMethod("openUnityClass6");
                        },
                        child: Container(
                        width: screenWidth*0.8,
                        height: 140,
                        decoration: BoxDecoration(
                          color: Color(0xff0772a0),
                          borderRadius: BorderRadius.circular(20),
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
                                padding: EdgeInsets.symmetric(vertical:screenHeight*0.068),
                              child: Text(
                                "AR LAB",
                                style: TextStyle(fontSize: screenHeight*0.025, color: Colors.white),
                              ),
                            )
                          ],
                        )),
                      ),
                    ),
                  ],
            ),
            ),
            ],)),
      )
    );
  }
}




