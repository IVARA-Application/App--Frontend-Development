import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ivara_app/Models/chaptersModel.dart';
import 'package:ivara_app/students_app/EBooks/pdfViewer.dart';
import 'package:ivara_app/students_app/notification.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:get/get.dart';
class ChaptersListPage extends StatefulWidget {
  int studentClass;
  String subjectName;
  ChaptersListPage(this.studentClass, this.subjectName);
  @override
  _ChaptersListPageState createState() => _ChaptersListPageState();
}

class _ChaptersListPageState extends State<ChaptersListPage> {
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
          'Class ${widget.studentClass} - ${widget.subjectName}',
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
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection("EBooks")
            .doc(widget.studentClass.toString())
            .collection(widget.studentClass.toString())
            .doc(widget.subjectName)
            .collection(widget.subjectName)
            .get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<ChaptersModel> chaptersList = [];
          snapshot.data.docs.forEach((element) {
            chaptersList.add(ChaptersModel(
              chapterName: element['chapterName'],
              chapterNumber: element['chapterNumber'],
              pdfUrl: element['pdfUrl'],
            ));
          });
          return ListView.builder(
            itemCount: chaptersList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Color(0xff0772a0),
                  onTap:(){
                    Get.to(PDFViewer(chaptersList[index].pdfUrl,chaptersList[index].chapterName));
                  },
                  title: Text(
                    "Chapter " + chaptersList[index].chapterNumber.toString(),
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  subtitle: Text(
                    chaptersList[index].chapterName,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6)
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
