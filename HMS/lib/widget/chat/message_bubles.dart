import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './message-list.dart';

class MessageBuble extends StatelessWidget {
  final String comingMessage;
  final String comingImageMessage;
  final String userName;
  final String senderId;
  final String recieverId;
  final String userImage;
  final bool isMe;
  final ValueKey key;
  MessageBuble(
      {this.comingMessage,
      this.comingImageMessage,
      this.userName,
      this.senderId,
      this.userImage,
      this.recieverId,
      this.isMe,
      this.key});
  @override
  Widget build(BuildContext context) {
    if ((senderId == FirebaseAuth.instance.currentUser.uid &&
            recieverId == MessageList.reciever.id) ||
        (senderId == MessageList.reciever.id &&
            recieverId == FirebaseAuth.instance.currentUser.uid))
      return Stack(
        children: [
          Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color:
                      !isMe ? Colors.grey[300] : Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft:
                          !isMe ? Radius.circular(0) : Radius.circular(12),
                      bottomRight:
                          isMe ? Radius.circular(0) : Radius.circular(12)),
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                width: 140,
                child: Column(
                  crossAxisAlignment:
                      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: !isMe
                            ? Colors.black
                            : Theme.of(context).accentTextTheme.title.color,
                      ),
                    ),
                    if (comingMessage != null)
                      Text(
                        comingMessage,
                        style: TextStyle(
                          color: !isMe
                              ? Colors.black
                              : Theme.of(context).accentTextTheme.title.color,
                        ),
                        textAlign: isMe ? TextAlign.end : TextAlign.start,
                      ),
                    if (comingMessage == null)
                      Container(
                        height: 155,
                        margin: EdgeInsets.symmetric(horizontal:0,vertical: 15 ),
                       // padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(5)), 
                            image: DecorationImage(image: NetworkImage(comingImageMessage),fit: BoxFit.fill)),
                      )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: 0,
              left: isMe ? null : 120,
              right: isMe ? 120 : null,
              child: CircleAvatar(
                backgroundImage: NetworkImage(userImage),
              )),
        ],
        overflow: Overflow.visible,
      );
    else
      return Center();
  }
}
