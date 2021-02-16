import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:intl/intl.dart';

class NotificationPage extends StatefulWidget {
  static String id = 'NotificationPage';
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int index = 0;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
    print('on background $message');
  }

  List<Map> messageList = [
    {'date': '12-12-2020', 'time': '23:27', 'title': 'abc', 'body': 'hghj'}
  ];

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        setState(() {
          final notification = message['notification'];
          Map data = {};
          final DateTime now = DateTime.now();
          data['date'] = '${now.day}-${now.month}-${now.year}';
          data['time'] = '${now.hour}:${now.minute}';
          data['body'] = notification['body'];
          data['title'] = notification['title'];
          messageList.insert(0, data);
        });
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true, badge: true, alert: true, provisional: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0772a0),
        centerTitle: true,
        elevation: 1.0,
        title: Text(
          'NOTIFICATION',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
                children: messageList
                    .map(
                      (data) => NotificationCard(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        date: data['date'],
                        time: data['time'],
                        name: data['title'],
                      ),
                    )
                    .toList())),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String date;
  final String time;
  final String name;
  const NotificationCard({
    Key key,
    this.date,
    this.time,
    this.name,
    @required this.screenWidth,
    @required this.screenHeight,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.1, vertical: screenHeight * 0.03),
      child: Container(
          width: screenWidth * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 15.0,
                spreadRadius: 1.5,
                offset: Offset(
                  3.0,
                  3.0,
                ),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  date,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Flexible(
                flex: 0,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Color(0xff0772a0)),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  time,
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          )),
    );
  }
}
