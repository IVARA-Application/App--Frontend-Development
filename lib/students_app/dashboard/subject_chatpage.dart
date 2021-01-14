import 'package:condition/condition.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SubjectChatPage extends StatefulWidget {
  static String id = 'SubjectChatPage';
  SubjectChatPage({Key key}) : super(key: key);

  @override
  _SubjectChatPageState createState() => _SubjectChatPageState();
}

class _SubjectChatPageState extends State<SubjectChatPage> {
  File _imageFile;
  String messageText;
  final messageTextController = TextEditingController();
  final _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    PickedFile selected = await _picker.getImage(source: source);
    setState(() {
      if (selected != null) {
        _imageFile = File(selected.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0772a0),
        title: Center(
          child: Text('IVENTORS'),
        ),
        actions: [Icon(Icons.notifications)],
      ),
      body: SafeArea(
        child: Conditioned.boolean(_imageFile == null,
            trueBuilder: () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    MessageStream(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenHeight * 0.01,
                          vertical: screenWidth * 0.02),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            // Expanded(
                            //   child: TextField(
                            //     controller: messageTextController,
                            //     onChanged: (value) {
                            //       messageText = value;
                            //     },
                            //     decoration: InputDecoration(
                            //       contentPadding: EdgeInsets.symmetric(
                            //           vertical: 10.0, horizontal: 20.0),
                            //       hintText: 'Type your message here...',
                            //       border: InputBorder.none,
                            //     ),
                            //   ),
                            // ),
                            // FlatButton(
                            //   onPressed: () {},
                            //   child: Icon(LineAwesomeIcons.telegram_plane)
                            // ),

                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(35.0),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 3),
                                        blurRadius: 5,
                                        color: Colors.grey)
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: TextField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          decoration: InputDecoration(
                                              hintText: "Type Something...",
                                              hintStyle: TextStyle(
                                                  color: Color(0xff0772a0)),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.photo_camera,
                                          color: Color(0xff0772a0)),
                                      onPressed: () {
                                        _pickImage(ImageSource.camera);
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.attach_file,
                                          color: Color(0xff0772a0)),
                                      onPressed: () {
                                        _pickImage(ImageSource.gallery);
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Container(
                              padding: const EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                  color: Color(0xff0772a0),
                                  shape: BoxShape.circle),
                              child: InkWell(
                                child: Icon(
                                  LineAwesomeIcons.telegram,
                                  color: Colors.white,
                                ),
                                onLongPress: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            falseBuilder: () => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Container(
                        height: screenHeight - (screenHeight * 0.1763),
                        color: Colors.black,
                        child: Image.file(_imageFile),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Container(
                          child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Container(
                                height: screenHeight * 0.07,
                                width: screenWidth / 2,
                                color: Colors.redAccent,
                                child: IconButton(
                                    icon: Icon(LineAwesomeIcons.times),
                                    onPressed: () => {
                                          setState(() {
                                            _imageFile = null;
                                          })
                                        })),
                          ),
                          Container(
                              height: screenHeight * 0.07,
                              width: screenWidth / 2,
                              color: Colors.greenAccent,
                              child: IconButton(
                                  icon: Icon(LineAwesomeIcons.check),
                                  onPressed: null))
                        ],
                      )),
                    )
                  ],
                )),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> messages = [
      {'text': 'Thanks.', 'sender': 'Me', 'time': '08:20 PM'},
      {
        'text': 'No issues, let me look into your problem.',
        'sender': 'Pasternek',
        'time': '08:20 PM'
      },
      {
        'text':
            'But I was having a litte bit of problem regarding online lectures, videos arent loading.',
        'sender': 'Me',
        'time': '08:20 PM'
      },
      {
        'text': 'Sorry to disturb you at the uneven hour.',
        'sender': 'Me',
        'time': '08:23 PM'
      },
      {'text': 'Hey David !', 'sender': 'Viren', 'time': '08:23 PM'},
      {'text': 'Hello.', 'sender': 'Me', 'time': '08:20 PM'},
    ];
    List<MessageBubble> messageBubbles = [];
    for (var message in messages) {
      final messageText = message['text'];
      final messageSender = message['sender'];
      final messageTime = message['time'];
      String currentUser = 'Me';
      final messageBubble = MessageBubble(
        text: messageText,
        sender: messageSender,
        time: messageTime,
        isMe: messageSender == currentUser,
      );
      messageBubbles.add(messageBubble);
    }
    return Expanded(child: ListView(reverse: true, children: messageBubbles));
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final String sender;
  final String time;
  final bool isMe;
  MessageBubble({this.text, this.sender, this.isMe, this.time});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(13),
              bottomRight: Radius.circular(13),
              topLeft: isMe ? Radius.circular(13) : Radius.circular(0),
              topRight: isMe ? Radius.circular(0) : Radius.circular(13),
            ),
            elevation: 5,
            color: isMe ? Colors.white : Color(0xff0772a0),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  Text(
                    sender,
                    style: TextStyle(fontSize: 10, color: Colors.black54),
                  ),
                  Text(
                    text,
                    style: TextStyle(color: isMe ? Color(0xff0772a0) : Colors.white),
                  ),
                  Text(
                    time,
                    style: TextStyle(fontSize: 10, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
