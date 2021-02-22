import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ivara_app/students_app/notification.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:videos_player/model/video.model.dart';
import 'package:videos_player/util/theme.util.dart';
import 'package:videos_player/videos_player.dart';
import 'package:videos_player/model/control.model.dart';

class VirtualTutionPage extends StatefulWidget {
  static String id = 'VirtualTutionPage';
  @override
  _VirtualTutionPageState createState() => _VirtualTutionPageState();
}

class _VirtualTutionPageState extends State<VirtualTutionPage> {


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
          'VIRTUAL TUTION',
          style: TextStyle(color: Colors.white, fontSize: 20),
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
      
      body: VideosPlayer(
        networkVideos: [
          new NetworkVideo(
              id: "2",
              name: "Elephant Dream",
              videoUrl:
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
              thumbnailUrl:
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg",
              videoControl: new NetworkVideoControl(
                fullScreenByDefault: false,
              )),
          new NetworkVideo(
              id: "3",
              name: "Big Buck Bunny",
              videoUrl:
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
              thumbnailUrl:
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
              videoControl: new NetworkVideoControl(autoPlay: true)),
          new NetworkVideo(
              id: "4",
              name: "For Bigger Blazes",
              videoUrl:
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
              thumbnailUrl:
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg"),
          new NetworkVideo(
              id: "5",
              name: "For Bigger Escape",
              videoUrl:
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
              thumbnailUrl:
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerEscapes.jpg"),
          new NetworkVideo(
              id: "6",
              name: "For Bigger Fun",
              videoUrl:
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
              thumbnailUrl:
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerFun.jpg"),
          new NetworkVideo(
              id: "7",
              name: "For Bigger Joyrides",
              videoUrl:
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
              thumbnailUrl:
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerJoyrides.jpg"),
        ],
        playlistStyle: Style.Style2,
      ),
    );
  }
}
