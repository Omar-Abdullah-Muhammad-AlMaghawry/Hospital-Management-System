

import 'package:HMS/widgets/DoctorDrawer.dart';
import 'package:flutter/material.dart';
import'package:firebase_auth/firebase_auth.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'dart:core';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';






class AnnouncedoctorScreen extends StatefulWidget {
  @override
  _AnnouncedoctorScreenState createState() => _AnnouncedoctorScreenState();
}

class _AnnouncedoctorScreenState extends State<AnnouncedoctorScreen> {
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
             backgroundColor : Colors.teal[500],
      //  backgroundColor:Theme.of(context).backgroundColor,
     //   backgroundColor: Color(0xFFB3E5FC),
        appBar:
        AppBar(
            backgroundColor:  Color(0xFFD6D6D6),
            title: Text('Announcements'),
            actions: [
          FlatButton.icon(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            label: Text('Log out',
                style: TextStyle(color: Colors.white, fontSize: 16.0)),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ],
        
      ),
      //  drawer: DoctorDrawer(false),
      body: SafeArea(child: 
      Expanded(
              child: Column(
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
                          
                               return
                                Expanded(
                                 child: SizedBox(
                                    height: 600,
                                    child: ListView.builder(
                                     //reverse: true,
                                     itemCount: posts.length,
                                     itemBuilder:(ctx,index)=>PostBubble(
                                       post:posts[index]['text'],  
                                       date: posts[index]['createdat'].toDate(),  
                                     ) ,
                             ),
                                  ),
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
      ),
    );






   
  }
}



class PostBubble extends StatelessWidget {
  
  PostBubble({this.post,this.date});
  final String post;
  //final Timestamp date;
  final DateTime date;
  
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
               SizedBox(width:3),
               Text('Announced At:',
                style: TextStyle(fontSize: 15,
               
               )
               ),

               SizedBox(width:3),

              Text(DateFormat.jm().format(date),
              style: TextStyle(fontSize: 15,
        
              ),
              
              ),
          
        

             ],
             
            ),
            SizedBox(height:2,),

            Material(
              elevation: 20,
                          child: Container(
                padding: EdgeInsets.all(10),
           decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
           color: Colors.white,

          ),
                
                child:Text(post,
                style: TextStyle(
                   fontSize: 20,
                   fontWeight:FontWeight.w300,
                  

                ),
                
                
                ),
                 ),
            ),
            SizedBox(height:15,),
        

          ],
        
    ),
     );
  }
}