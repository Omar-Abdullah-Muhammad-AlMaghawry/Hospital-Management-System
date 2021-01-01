import 'package:HMS/widget/chat/message-list.dart';
import 'package:HMS/widget/chat/message_bubles.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Messages extends StatelessWidget {
  var id = '';
  Messages({this.id});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("chat")
            .orderBy(
              "createdAt",
              descending: true,
            )
            .snapshots(),
        builder: (ctx, chatSnapshots) {
          final chatDocs = chatSnapshots.data.documents;
          if (chatSnapshots.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              reverse: true,
              itemCount: chatDocs.length,
              itemBuilder: (ctx, index) {
               
                if(chatDocs[index]["senderId"] ==
                      FirebaseAuth.instance.currentUser.uid && chatDocs[index]["recieverId"]==MessageList.reciever.id ||chatDocs[index]["senderId"] ==MessageList.reciever.id&&chatDocs[index]["recieverId"]==FirebaseAuth.instance.currentUser.uid)
                  return MessageBuble(
                  chatDocs[index]["text"],
                  chatDocs[index]["userName"],
                  chatDocs[index]["senderId"] ==
                      FirebaseAuth.instance.currentUser.uid,
                  key: ValueKey(chatDocs[index].documentID),
                );
              });
        });
  }
}
