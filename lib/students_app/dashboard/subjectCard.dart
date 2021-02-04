import 'package:flutter/material.dart';
import 'package:ivara_app/students_app/dashboard/subject_chatpage.dart';

class SubjectCard {
  String subjectName;
  SubjectCard({this.subjectName});
}

class SubjectCardWidget extends StatelessWidget {
  final SubjectCard subjectCard;
  final double screenHeight;
  final double screenWidth;

  SubjectCardWidget(
      {Key key,
      @required this.screenHeight,
      @required this.screenWidth,
      this.subjectCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.08,
        left: screenWidth * 0.06,
        right: screenWidth * 0.06,
      ),
      child: GestureDetector(
        onTap: () => {
          Navigator.pushNamed(context, SubjectChatPage.id, arguments: {
            'subjectName': subjectCard.subjectName,
          })
        },
        child: Container(
            width: screenWidth,
            height: 145,
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
                  padding: EdgeInsets.only(top: screenHeight * 0.075),
                  child: Text(
                    subjectCard.subjectName,
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
