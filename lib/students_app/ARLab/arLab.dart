import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ARLab extends StatefulWidget {
  @override
  _ARLabState createState() => _ARLabState();
}

class _ARLabState extends State<ARLab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () async{
                final channel = new MethodChannel("channel");
                await channel.invokeMethod("openUnityClass6");
              },
              child: Text("6th"),
            ),
            RaisedButton(
              onPressed: ()async {
                final channel = new MethodChannel("channel");
                await channel.invokeMethod("openUnityClass7");
              },
              child: Text("7th"),
            ),
            RaisedButton(
              onPressed: () async{
                final channel = new MethodChannel("channel");
                await channel.invokeMethod("startActivity");
              },
              child: Text("8th"),
            ),
          ],
        ),
      ),
    );
  }
}
