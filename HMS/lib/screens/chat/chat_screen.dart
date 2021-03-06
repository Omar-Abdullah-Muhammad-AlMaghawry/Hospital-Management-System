import '../masterHome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:core';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flash_chat/screens/testimage.dart';

class Chat extends StatefulWidget {
  String roomid;
  Chat({this.roomid});

  static const id = 'Chat_Screen';

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final textfieldcontroller = TextEditingController();
  String user1;
  String temp3;
  String sender;
  String message1;
  User loggedinuser;

  ///get the image
  File _image;
  Stream<QuerySnapshot> _stream;

  void UploadImage() async {
    await ImagePicker.pickImage(source: ImageSource.camera).then((value) {
      _image = value;
    });
    //ref is a pointer to the main bucket
    //a pointer to the path of the uploaded image
    String imagename = user1 + Timestamp.now().toString();
    final refpath = FirebaseStorage.instance
        .ref()
        .child('imagemessages')
        .child(imagename + '.jpg');

    await refpath.putFile(_image);
    final url = await refpath.getDownloadURL();
    /////////store image url in messages collection of this chatroom
    print('uploading IMAGE NOWWWWWW');
    FirebaseFirestore.instance
        .collection('chatrooms/${widget.roomid}/messages')
        .add({
      'text': url,
      'sender': loggedinuser.email,
      'createdat': Timestamp.now(),
      'type': 'image'
    });
  }

  Future getCurrentUser() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        loggedinuser = user;
        print(loggedinuser.email);
        user1 = loggedinuser.email;
        print(widget.roomid);
        print(user1);
        return user1;
      }
    } catch (e) {
      print(e);
      print('nooooo');
    }
  }

  void initState() {
    super.initState();

    getCurrentUser();
    print('check before making temp on user1');
    print(user1);
    _stream = FirebaseFirestore.instance
        .collection('/chatrooms/${widget.roomid}/messages')
        .orderBy('createdat', descending: true)
        .snapshots();

    /*  Firestore.instance.collection('chatrooms/${widget.roomid}/messages/temp').add({
  
      'text':'uuu',
      'sender':user1,
      'createdat':Timestamp.now(),
      'type':'text',
    });
    */
    /*  Firestore.instance.collection('chatrooms/${widget.roomid}/messages').doc('temp').set(
      {
  
      'text':'empty',
      'sender':user1,
      'createdat':Timestamp.now(),
      'type':'text',
    }
    );
  
     
         print('done888888888888888888888');
         FirebaseFirestore.instance.collection('chatrooms/${widget.roomid}/messages').doc('temp').delete();

     */
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        // backgroundColor: Color(0xFFB3E5FC),
        appBar: AppBar(
          //  backgroundColor:  Color(0xFFD6D6D6),
          title: Text('⚡️Chat'),
          actions: [
            FlatButton.icon(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: Text('Home',
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            )
          ],
        ),

        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Color(0xFFB3E5FC),
                  child: StreamBuilder<QuerySnapshot>(

                      ///here i am gonna pass two vars of both logged in&chatted usernames
                      stream: _stream,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Color(0XFF0277BD),
                            ),
                          );
                        }

                        final messages = snapshot.data.docs;

                        return ListView.builder(
                          reverse: true,
                          itemCount: messages.length,
                          itemBuilder: (ctx, index) => Bubble(
                            text: messages[index]['text'],
                            sender: messages[index]['sender'],
                            isloggeduser:
                                loggedinuser.email == messages[index]['sender']
                                    ? true
                                    : false,
                            type: messages[index]['type'],
                          ),
                        );
                      }),
                ),
              ),
              Material(
                color: Colors.white,
                child: SizedBox(
                  height: 10,
                ),
              ),
              ////added now at 22/12/2020
              Material(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: textfieldcontroller,
                        onChanged: (value) {
                          setState(() {
                            message1 = value;
                          });
                        },
                        cursorWidth: 1,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "type message here...",
                          hintStyle: TextStyle(
                            color: Colors.black26,
                          ),
                        ),
                        style: TextStyle(
                          color: Color(0XFF424242),
                        ),
                      ),
                    ),

                    //////////////////////////added for the photo upload
                    IconButton(
                      icon: Icon(Icons.photo),
                      highlightColor: Colors.grey,
                      disabledColor: Colors.white10,
                      color: Color(0XFF424242),
                      onPressed: () {
                        //Upload the photo
                        UploadImage();
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      highlightColor: Colors.grey,
                      disabledColor: Colors.white10,
                      color: Color(0XFF424242),
                      onPressed: () {
                        ///delete message from textfield
                        textfieldcontroller.clear();

                        ///make the keyboard disappear after pressing the send button
                        FocusScope.of(context).unfocus();
                        //check if the chatroom already exists
                        print('TEMP33333333333');
                        print(widget.roomid);
                        //store data in firestore database

                        FirebaseFirestore.instance
                            .collection('chatrooms/${widget.roomid}/messages')
                            .doc('temp')
                            .delete();

                        FirebaseFirestore.instance
                            .collection('chatrooms/${widget.roomid}/messages')
                            .add({
                          'text': message1,
                          'sender': loggedinuser.email,
                          'createdat': Timestamp.now(),
                          'type': 'text',
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Bubble extends StatelessWidget {
  Bubble({this.text, this.sender, this.isloggeduser, this.type});
  final bool isloggeduser;
  final String text;
  final String sender;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: type == 'text' ? EdgeInsets.all(10) : EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment:
            isloggeduser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(sender),
          Material(
            borderRadius: text == 'image'
                ? BorderRadius.circular(0)
                : isloggeduser
                    ? BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(0),
                        topRight: Radius.circular(15))
                    : BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(15)),
            color: isloggeduser ? Color(0XFF424242) : Color(0xFFD6D6D6),
            child: Padding(
              padding: type == 'text'
                  ? EdgeInsets.fromLTRB(10, 7, 10, 10)
                  : EdgeInsets.all(0),
              child: (type == 'text')
                  ? Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  : Image.network(
                      text,
                      width: 150,
                      height: 180,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
