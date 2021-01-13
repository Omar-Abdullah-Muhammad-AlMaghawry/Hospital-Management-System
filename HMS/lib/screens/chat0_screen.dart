import 'package:HMS/pages/masterHome.dart';
import 'package:HMS/widget/chat/messages.dart';
import 'package:HMS/widget/chat/new_message.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../moduls/reciever.dart';

class ChatScreen extends StatefulWidget {
  var userName = '';
  ChatScreen({this.userName});
  static const nameRoute = "/chat-screen";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void movingToChat(context) {}
  @override
  Widget build(BuildContext context) {
    Reciever reciever = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(reciever.name),
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.logout),
                      SizedBox(
                        width: 8,
                      ),
                      Text("Logout")
                    ],
                  ),
                ),
                value: 'logout',
              ),
            ],
            onChanged: (itemIdentifer) {
              if (itemIdentifer == "logout") {
                FirebaseAuth.instance.signOut();
                             Navigator.popUntil(context, ModalRoute.withName(MasterHome.nameRoute));

              }
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: Messages()),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
