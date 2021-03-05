import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivara_app/Controllers/EBooksController.dart';
import 'package:ivara_app/students_app/EBooks/EBooksHome.dart';
import 'package:ivara_app/students_app/layout/sidebar.dart';
import 'package:ivara_app/students_app/notification.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class EBooks extends StatefulWidget {
  @override
  _EBooksState createState() => _EBooksState();
}

class _EBooksState extends State<EBooks> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!Get.find<EBooksController>().classAndSubjectsLoaded.value) {
      Get.find<EBooksController>().loadClassAndSubjectFromServer();
    }
  }

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
        title: Text(
          'E Books',
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
      drawer: MyDrawer(
        onTap: (ctx, i) {
          setState(() {
            index = i;
            Navigator.pop(ctx);
          });
        },
      ),
      body: Obx(() => Get.find<EBooksController>().classAndSubjectsLoaded.value
          ? Container(
              child: ListView.builder(
              itemCount: Get.find<EBooksController>().classList.length,
              itemBuilder: (context, index) {
                return classTile(
                  screenHeight,
                  screenWidth,
                  Get.find<EBooksController>().classList[index],
                );
              },
            ))
          : Container(
              child: Center(child: CircularProgressIndicator()),
            )),
    );
  }

  Widget classTile(screenHeight, screenWidth, int studentClass) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.05,
        left: screenWidth * 0.06,
        right: screenWidth * 0.06,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EBooksHome(studentClass),
          ));
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
                    'Class $studentClass',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
