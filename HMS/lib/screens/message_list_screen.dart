import 'package:firebase_auth/firebase_auth.dart';

import '../widget/chat/message-list.dart';
import 'package:flutter/material.dart';

class MessageListSreen extends StatefulWidget {
  static const nameRoute = '/message-list-screen';

  @override
  _MessageListSreenState createState() => _MessageListSreenState();
}

class _MessageListSreenState extends State<MessageListSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
        actions: [
          DropdownButton(
              icon: Icon(
                Icons.more_vert,
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
                        Text("Logout"),
                      ],
                    ),
                  ),
                  value: 'logout',
                ),
              ],
              onChanged: (value) {
                if (value == 'logout') FirebaseAuth.instance.signOut();
              })
        ],
      ),
      body: MessageList(),
    );
  }
}
