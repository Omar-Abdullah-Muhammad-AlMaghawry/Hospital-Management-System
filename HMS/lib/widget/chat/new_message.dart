import 'dart:io';
import 'dart:math';

import 'package:HMS/moduls/reciever.dart';
import 'package:HMS/widget/chat/message-list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class NewMessage extends StatefulWidget {
  String recieverId = MessageList.reciever.id;
  String recieverName = MessageList.reciever.name;
//  NewMessage({this.reciever});
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = new TextEditingController();
  var _enterdMessage = '';
  File imageMeassage;
  
  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    final usersAuth =
        await FirebaseFirestore.instance.collection("users").document().id;
final chat =
       FirebaseFirestore.instance.collection("chat").doc().id;
    final userData =
        await Firestore.instance.collection('users').document(user.uid).get();
    // Firestore.instance
    //     .collection('chatsO ')
    //     .document(user.uid)
    //     .collection("massages")
    //     .document(usersAuth)
    //     .set({
    //   "text": _enterdMessage,
    //   "createdAt": Timestamp.now(),
    //   "senderId": user.uid,
    //   "userName": userData["userName"],
    //   "recieverId":widget.recieverId,
    //   "recieverName": widget.recieverName,
    // });
   
    FirebaseFirestore.instance.collection("chat").document(chat).set({
      "text": _enterdMessage,
      "imageNotText": null,
      "createdAt": Timestamp.now(),
      "senderId": user.uid, //userId
      "sender_image_url": userData["image_url"],
      "userName": userData["userName"],
      "recieverId": widget.recieverId,
      "recieverName": widget.recieverName,
    });
    _controller.clear();
  }

  void _sendImage() async {
    var rnd = new Random();
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    final usersAuth =
        await FirebaseFirestore.instance.collection("users").document().id;
   final chat =
       FirebaseFirestore.instance.collection("chat").doc().id; 
    final userData =
        await Firestore.instance.collection('users').document(user.uid).get();
    final _ref = FirebaseStorage.instance
        .ref()
        .child("image_messages")
        .child(chat + ".jpg");
    await _ref.putFile(imageMeassage);
    final _url = await _ref.getDownloadURL();
    FirebaseFirestore.instance.collection("chat").document(chat).set({
      "text": null,
      "imageNotText": _url,
      "createdAt": Timestamp.now(),
      "senderId": user.uid, //userId
      "sender_image_url": userData["image_url"],
      "userName": userData["userName"],
      "recieverId": widget.recieverId,
      "recieverName": widget.recieverName,
    });
    Navigator.of(context).pop();
  }

  void _pickMessageImage() async {
    final pickedImage = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    setState(() {
      imageMeassage = pickedImage;
    });
    showBottomSheet(
        context: context,
        builder: (context) {
          return Center(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 70, horizontal: 5),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: FileImage(imageMeassage)),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: FloatingActionButton(
                    child: Icon(Icons.send),
                    onPressed: _sendImage,
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: "Enter a New Messages ..."),
            onChanged: (value) {
              setState(() {
                _enterdMessage = value;
              });
            },
          )),
          IconButton(icon: Icon(Icons.camera_alt), onPressed: _pickMessageImage),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _enterdMessage.trim().isEmpty ? null : _sendMessage,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
