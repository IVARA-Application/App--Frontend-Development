import 'package:flutter/material.dart';
import 'package:ivara_app/teachers_app/doubtPortal.dart';

class DoubtPortalClassList extends StatefulWidget {
  @override
  _DoubtPortalClassListState createState() => _DoubtPortalClassListState();
}

class _DoubtPortalClassListState extends State<DoubtPortalClassList> {
  Color blue = Color(0xFF076FA0);
  List<int> classes = [
    6,
    7,
    8,
    9,
    10,
    11,
    12,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: classes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: blue,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DoubtPortal.id,
                      arguments: {
                        'class':classes[index]
                      }
                    );
                  },
                  title: Text(
                    "Class ${classes[index]}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
