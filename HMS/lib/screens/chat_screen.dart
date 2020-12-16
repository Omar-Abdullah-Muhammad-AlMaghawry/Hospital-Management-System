import 'package:HMS/widget/chat/messages.dart';
import 'package:HMS/widget/chat/new_message.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
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
              }
            },
          )
        ],
      ),
      body:Container(child: Column(
        children: [
          Expanded(child: Messages()) ,
          NewMessage(),
        ],
      ),) 
      ,      
    );
  }
}
