import 'package:flutter/material.dart';
import'package:firebase_auth/firebase_auth.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'dart:core';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_browser.dart';





class AnnounceManagerScreen extends StatefulWidget {
  @override
  _AnnounceManagerScreenState createState() => _AnnounceManagerScreenState();
}

class _AnnounceManagerScreenState extends State<AnnounceManagerScreen> {
  final textfieldcontroller = TextEditingController();
  Stream<QuerySnapshot>_stream;
  String post;
  @override
  void initState() {
    _stream = FirebaseFirestore.instance.collection('announcements').orderBy('createdat',descending: true).snapshots();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFB3E5FC),
        appBar:
        AppBar(
            backgroundColor:  Color(0xFFD6D6D6),
            title: Text('Announcements'),
            actions: [
              IconButton(
                icon:Icon(Icons.close,
                  color: Colors.white,
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ],
          
      ),
      body: SafeArea(child: 
      Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget> [
          Padding(padding: EdgeInsets.fromLTRB(5, 5, 10, 3),
          child:       
           Expanded(
                  child: Container(
                    color: Color(0xFFB3E5FC),
                    child:
                    StreamBuilder<QuerySnapshot>(
                      ///here i am gonna pass two vars of both logged in&chatted usernames
                      stream:_stream,

                      builder:(context,snapshot) {
                        if (!snapshot.hasData ) {
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor:Color(0XFF0277BD),
                            ),
                          );
                          
                         }
                       
                         final posts = snapshot.data.docs;
                        
                             return ListView.builder(
                               //reverse: true,
                               itemCount: posts.length,
                               itemBuilder:(ctx,index)=>PostBubble(
                                 post:posts[index]['text'],  
                                 date: posts[index]['createdat']   
                               ) ,
                           );
                           
                            }              
                            ),

                  ),
                ),
          ),
        ],



      ),
      ),
      ),
    );






   
  }
}



class PostBubble extends StatelessWidget {
  
  PostBubble({this.post,this.date});
  final String post;
  final Timestamp date;
  DateFormat x;
  @override
 
  Widget build(BuildContext context) {
    return  
     Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
            
             
             children: [
                    CircleAvatar(
              backgroundImage: AssetImage('images/image.jpg'),
              radius: 10,
            ),
          SizedBox(width:3),
         // format.format(DateTime.now());
         // DateFormat.yMEd().add_jms().format(DateTime.now())
         //
        // DateTime now = DateTime.now();
          //String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
         // Text(DateFormat('yyyy-MM-dd – kk:mm').format(date.toDate()) ),
         Text('shjk' ),

             ],
             
            ),
            SizedBox(height:5,),

            Container(
              padding: EdgeInsets.all(10),
           decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          ),
              
              child: Text(post)),
            SizedBox(height:15,),
        

          ],
        
    ),
     );
  }
}