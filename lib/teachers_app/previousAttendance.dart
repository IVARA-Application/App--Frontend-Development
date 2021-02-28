import 'package:flutter/material.dart';

class PreviousAttendance extends StatefulWidget {
  static String id = 'PreviousAttendance';
  @override
  _PreviousAttendanceState createState() => _PreviousAttendanceState();
}

class _PreviousAttendanceState extends State<PreviousAttendance> {
  Color blue = Color(0xFF076FA0);
  List<Map> attendanceList = [
    {'name': 'Hemanth', 'absent': true},
    {'name': 'Khushwant', 'absent': false},
    {'name': 'Tarun', 'absent': false},
    {'name': 'Hemanth', 'absent': true},
    {'name': 'Khushwant', 'absent': false},
    {'name': 'Tarun', 'absent': false},
  ];
  var months = [
    'Jan',
    'Feb',
    'March',
    'April',
    'May',
    'June',
    'July',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec'
  ];
  var years = ['2020', '2021'];
  var days = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
  ];
  int currentday = 0;

   Widget makeDropDown(List<String> dropdownList, screenWidth, screenHeight) {
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.02),
      child: Container(
        height: screenHeight * 0.046,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenHeight*0.015),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 3.0,
              spreadRadius: 1.0,
              offset: Offset(1.0, 2.0),
            )
          ],
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isDense: true,
            elevation: 10,
            hint: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: Text(
                dropdownList[0],
                style: TextStyle(color: blue),
              ),
            ),
            iconEnabledColor: blue,
            icon: Icon(Icons.keyboard_arrow_down),
            items: dropdownList.map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(
                  value,
                  style: TextStyle(color: blue),
                ),
              );
            }).toList(),
            onChanged: (_) {},
          ),
        ),
      ),
    );
  }

  Widget makeCalendarList(screenWidth, screenHeight) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 31,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(screenWidth * 0.015),
          child: GestureDetector(
              child: Material(
                borderRadius: BorderRadius.circular(screenHeight * 0.022),
                color: Colors.white,
                elevation: index == currentday ? 8 : 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
                  child: Container(
                    width: screenWidth * 0.15,
                    height: screenHeight * 0.1,
                    child: Center(
                      child: Column(
                        children: [
                          Text(index<7?days[index]:days[index%7],
                              style: TextStyle(
                                  color: blue, fontSize: screenHeight * 0.03)),
                          SizedBox(height: screenHeight * 0.015),
                          Text((index + 1).toString(),
                              style: TextStyle(
                                  color: blue, fontSize: screenHeight * 0.025))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  currentday = index;
                });
              }),
        );
      },
    );
  }

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
                onPressed: (){},
                icon: Stack(
                  children: [
                    Icon(
                        Icons.brightness_1,
                        color: attendanceList[index]['absent']
                            ? Colors.red
                            : Color(0XFF00e600)),
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
          )
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
                  vertical: screenHeight * 0.008,
                  horizontal: screenWidth * 0.008),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(screenHeight * 0.022)),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        makeDropDown(months, screenWidth, screenHeight),
                        makeDropDown(years, screenWidth, screenHeight)
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.125,
                      child: makeCalendarList(screenWidth, screenHeight),
                    ),
                    SizedBox(height: screenHeight * 0.01)
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
                                  topRight: Radius.circular(screenHeight * 0.04),
                                  topLeft: Radius.circular(screenHeight * 0.04)),
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
                                child:
                                    getAttendanceList(screenHeight, screenWidth),
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
