import 'package:flutter/material.dart';
import'package:firebase_auth/firebase_auth.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'dart:core';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';





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
          child: Container(
            height: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
            color:Colors.white,
            
            ),
         
         child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  
                      SizedBox(
                        width:5,
                      ),
                      
                      Expanded(
                        child:
                         TextField(
                        controller: textfieldcontroller,
                        autofocus: true,
                        
                          onChanged: (value){
                            setState(() {
                              post = value;                        
                            });                        
                          },
                          cursorWidth: 1,
                          maxLines: null,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            border:OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

                            hintText: "Add an announcement...",
                            hintStyle: TextStyle(
                              color: Colors.black26,
                            ),

                          ),
                          style: TextStyle(
                            color:Color(0XFF424242) ,
                          ),
                        ),
                      ),
                     
                      IconButton(
                        icon: Icon(Icons.send),
                        highlightColor: Colors.grey,
                        disabledColor: Colors.white10,

                        color: Color(0XFF424242),
                        onPressed:
                            (){
                              FocusScope.of(context).requestFocus(new FocusNode());

                            textfieldcontroller.clear();
                            FocusScope.of(context).unfocus();
                            FirebaseFirestore.instance.collection('announcements').add({
                              'createdat': Timestamp.now(),
                              'text': post,

                            });
                  
                            
                    
                        },
                      ),
                    ],
                  ),
                  

         )
        
          ) ,
          Divider(
            
          thickness: 2,
          color: Colors.white,
          ),
        
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
                                 date: posts[index]['createdat'].toDate(),  
                               ) ,
                           );
                           }                 
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