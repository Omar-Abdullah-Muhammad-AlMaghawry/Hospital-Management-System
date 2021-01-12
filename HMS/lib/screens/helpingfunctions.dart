import'package:firebase_auth/firebase_auth.dart';
import'package:cloud_firestore/cloud_firestore.dart';



/////////////////////////////
  Future getroomid(String user1,String user2)async{
    String temp3 = '';
   String  temp1 = user1 + "-" + user2;
    print('temp1');print(temp1);
   String temp2 = user2 + "-" + user1;
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
//////////////////////////
