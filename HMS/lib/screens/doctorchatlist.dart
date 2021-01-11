///chatlist of doctors
import 'package:firebase_core/firebase_core.dart';
import '../screens/chat_screen.dart';
import 'package:flutter/material.dart';
import'package:firebase_auth/firebase_auth.dart';
import'package:cloud_firestore/cloud_firestore.dart';

class DoctorChatList extends StatefulWidget {
  static const String id = 'DoctorChat_List';
  @override
  _DoctorChatListState createState() => _DoctorChatListState();
}

class _DoctorChatListState extends State<DoctorChatList> {
  String sender;
  String message1;
  User loggedinuser;
  String user1;
  String user2;
  String temp1;
  String temp2;
  String temp3;
  String x;
  
  String chatteduser;
    Future getroomid()async{
    temp1 = user1 + "-" + user2;
    print('temp1');print(temp1);
    temp2 = user2 + "-" + user1;
    print('temp2');print(temp2);
    var chatroomid1 =await Firestore.instance.collection('chatrooms/$temp1/messages').getDocuments().then((value) {
      if(value.docs.length>0){
        temp3 = temp1;
        print('temp1exist');
        ///print collectoin here
      }
      else{
        temp3=temp2;
        print('temp1NOEXISTANCE');
      }
      

    });

   
    return temp3;

  }

  void getCurrentUser()async{
    try{
      final user =await FirebaseAuth.instance.currentUser;
      if(user!= null){
        loggedinuser = user;
        user1 = loggedinuser.email;
        print('INSIDE DOCTOR CHATLIST');
        print(user1);
      }
    }
    catch(e){
      print(e);
      print('nooooo');
    }
    
  }


  Future getdoctornames()async{
    final _firestore = FirebaseFirestore.instance;
    var doc = await _firestore.collection('doctors').getDocuments();
    return doc.documents;
  }

 void initState(){
      super.initState();
      getdoctornames();
      getCurrentUser();

    }

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      backgroundColor: Color(0xFFB3E5FC),
      appBar:AppBar(
        title: Text('Chat'),
        backgroundColor: Color(0xFFD6D6D6),
      ),
      body:
      Container(


        child:
        FutureBuilder(
            future:getdoctornames() ,
            builder:(context,snapshot){
              if(snapshot.connectionState== ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                  ),
                );
              }
              else{
                return ListView.builder(itemBuilder: (BuildContext context,int index) {

                  return ListTile(
                    title:
                    FlatButton(
                      child: Text(snapshot.data[index]['username']
                        ,style: TextStyle(fontSize: 20),
                      ),
                      onPressed: ()async{

                        user2 = await snapshot.data[index]['email'];
                        print('WHEN USER2 SELECTED');

                           x= await getroomid();
       
                        
                      
                            
                        print('the ROOOOOM ID :');
                        print(x);

      
         print('navigating...');
           Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Chat(roomid: x,),
                          ),
                        );
                        
                        
                     

                        // Navigator.pushNamed(context, ChatScreen.id);

                       /* Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Chat(roomid: temp3,),
                          ),
                        );*/

                      },
                    ),
                  );
                },
                  itemCount:snapshot.data.length,
                  //scrollDirection: Axis.vertical,



                );

              }
            }

        ),

      ),



    );
  }
}

