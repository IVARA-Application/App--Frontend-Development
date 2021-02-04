import 'package:flutter/material.dart';
import 'package:ivara_app/Starting_Animation/ui/views/home_view.dart';
import 'package:ivara_app/teachers_app/academics.dart';
import 'package:ivara_app/teachers_app/attendance.dart';
import 'package:ivara_app/teachers_app/attendanceDetail.dart';
import 'package:ivara_app/teachers_app/classroom.dart';
import 'package:ivara_app/teachers_app/dashboard.dart';
import 'package:ivara_app/teachers_app/doubtPortal.dart';
import 'package:ivara_app/teachers_app/enterSubjectMarks.dart';
import 'package:ivara_app/teachers_app/entermarks.dart';
import 'package:ivara_app/teachers_app/parentConnect.dart';
import 'package:ivara_app/teachers_app/profile.dart';
import 'package:ivara_app/teachers_app/studentAttendance.dart';
import 'homepage.dart';
import 'students_app/auth/login.dart';
import 'students_app/auth/signup.dart';
import 'students_app/notification.dart';
import 'students_app/attendance/attendance.dart';
import 'students_app/academics/academics.dart';
import 'students_app/academics/test.dart';
import 'students_app/dashboard/dashboard.dart';
import 'students_app/dashboard/subject_chatpage.dart';
import 'students_app/student_homepage.dart';
import 'package:provider/provider.dart';
import './Starting_Animation/core/viewmodels/home_model.dart';
import './Starting_Animation/ui/views/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:ivara_app/students_app/drawer_part/Healmymind/Heal_my_mind.dart';
import 'package:ivara_app/students_app/drawer_part/Healmymind/chat_to_counsellor.dart';
import 'package:ivara_app/students_app/drawer_part/Healmymind/heal_my_mind_videos.dart';
import 'package:ivara_app/Parents_app/Parents_attendance/p_attendance.dart';
import 'package:ivara_app/Parents_app/Parents_homepage.dart';
import 'package:ivara_app/homepage.dart';
import 'package:ivara_app/students_app/auth/login.dart';
import 'package:ivara_app/students_app/auth/signup.dart';
import 'package:ivara_app/students_app/notification.dart';
import 'package:ivara_app/students_app/attendance/attendance.dart';
import 'package:ivara_app/students_app/academics/academics.dart';
import 'package:ivara_app/students_app/academics/test.dart';
import 'package:ivara_app/students_app/dashboard/dashboard.dart';
import 'package:ivara_app/students_app/dashboard/subject_chatpage.dart';
import 'package:ivara_app/students_app/student_homepage.dart';
import 'package:ivara_app/students_app/layout/navbar.dart';
import 'package:ivara_app/students_app/drawer_part/Doubt_portal/doubt_help.dart';
import 'package:ivara_app/students_app/drawer_part/Entrance_preparation/Entrance_exams.dart';
import 'package:ivara_app/students_app/drawer_part/Skill_development/skilldevelopment.dart';
import 'package:ivara_app/students_app/drawer_part/Student_abroad/Study_abroad_help.dart';
import 'package:ivara_app/students_app/drawer_part/Student_personal_details/studentpersonal.dart';
import 'package:ivara_app/students_app/drawer_part/Healmymind/schedule_a_call.dart';
import 'package:ivara_app/students_app/drawer_part/Student_abroad/Courses_available.dart';
import 'package:ivara_app/students_app/drawer_part/Student_abroad/Scholarships.dart';
import 'package:ivara_app/students_app/drawer_part/Student_abroad/news_and_blogs.dart';
import 'package:get/get.dart';
import 'Binding.dart';
import 'package:firebase_core/firebase_core.dart';

import 'students_app/student_homepage.dart';
import 'students_app/student_homepage.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var home;

  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstTime = prefs.getBool('first_time');
    await new Future.delayed(const Duration(seconds : 5));
    if (firstTime != null && !firstTime) {// Not first time
      setState(() {
        home = HomePage();
      });
    } else {// First time
      prefs.setBool('first_time', false);
      setState(() {
        home = HomeView();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      title: 'Ivara App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: home==null?SplashScreen(
    seconds: 5,
    navigateAfterSeconds: HomePage(),
    title: Text(
      'IVentors Initiatives',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0,color:Colors.white),
    ),
    image: Image.asset(
        './assets/logo_small.png'),
    photoSize: 100.0,
    backgroundColor: Color(0xFF076FA0),
    loaderColor: Colors.white,
    ):home,
      routes: {
          HomePage.id: (context) => HomePage(),
          LoginPage.id: (context) => LoginPage(),
          SignUpPage.id: (context) => SignUpPage(),
          StudentHomePage.id:(context)=>StudentHomePage(),
          NotificationPage.id: (context) => NotificationPage(),
          AttendancePage.id: (context) => AttendancePage(),
          AcademicsPage.id: (context) => AcademicsPage(),
          TestPage.id: (context) => TestPage(),
          DashboardPage.id: (context) => DashboardPage(),
          SubjectChatPage.id: (context) => SubjectChatPage(),
          StudentHomePage.id: (context) => StudentHomePage(),
          TeacherDashboard.id: (context) => TeacherDashboard(),
          EnterMarks.id: (context) => EnterMarks(),
          SubjectMarks.id: (context) => SubjectMarks(),
          Attendance.id: (context) => Attendance(),
          DoubtPortal.id: (context) => DoubtPortal(),
          TeacherProfile.id: (context) => TeacherProfile(),
          TeacherClassroom.id: (context) => TeacherClassroom(),
          TeacherAcademicsPage.id: (context) => TeacherAcademicsPage(),
          StudentAttendanceViewPage.id: (context) => StudentAttendanceViewPage(),
          AttendanceDetail.id: (context) => AttendanceDetail(),
          ParentConnect.id: (context) => ParentConnect(),
          HomeView.id: (context) => HomeView(),
        }
    );
  }
}
