import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'dart:core';

class Bloodbank extends StatefulWidget {
 
 // List<int> aplus = List<int>(8);
 int aplus;int aneg;int bneg;int bplus; int oplus;int oneg; int abplus; int abneg;

  Bloodbank({this.aplus,this.aneg,this.bplus,this.bneg,this.oplus,this.oneg,this.abplus,this.abneg});
  @override
  _BloodbankState createState() => _BloodbankState();
}
 class _BloodbankState extends State<Bloodbank> {
   int a_plus=0;
   
   int a_neg=0;
   int b_plus=0 ;
   int b_neg=0;
   int ab_neg=0 ;
   int ab_plus=0;
   int o_plus=0;
   int o_neg=0;
   String temp;
   int v;
   Map x;
 
Future getnumofbloodbags()async{
     await Firestore.instance.collection('bloodBank').doc('Aplus').get().then((value) {
     
      x = value.data();
      
   } );
}

   int  blood( int num , int blood_type  ) {

   if (num == 1) {
     setState(() {
       blood_type ++;
     });
   }
   if (num != 1) {
     setState(() {
       blood_type --;
       if(blood_type <= 0 )
         { blood_type = 0 ; }
     });
   }
return blood_type ;
 }

 void initState(){
      super.initState();
  // getnumofbloodbags();
  a_plus =  widget.aplus;
  b_plus =  widget.bplus;
  ab_plus =  widget.abplus;
  o_plus =  widget.oplus;
  a_neg =  widget.aneg;
  b_neg =  widget.bneg;
  o_neg =  widget.oneg;
  ab_neg =  widget.abneg;
  
    
    print('yallllllahwy');
 

 
      

    }
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      home:Scaffold(

     backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
       // backgroundColor: Color(0xFF8F0026),
        title: Text('Blood Bank Inventory'),
         actions: [
          FlatButton.icon(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: Text('Home',
                style: TextStyle(color: Colors.white, fontSize: 16.0)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body:Container (

        child: ListView(
          children: [

        Column(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
               // shrinkWrap: true,
               // scrollDirection:Axis.vertical ,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    child: Card(
                      color: Colors.blue[100],
                      // child: Container(
                      //width: 500,
                      child: Padding(
                        padding: EdgeInsets.all(30) ,
                        child: Text('  List of blood types'
                         , style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                           ),

                        ),
                      ),
                      //),
                      elevation: 5,
                    ),
                  ),

                  Container(
                    width: double.infinity,
                   // height: 50,
                    child: Card(
                      color: Colors.blueGrey[200],
                      child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children : <Widget>[

                          Padding(
                            padding: EdgeInsets.only(left : 30,right : 20 , top: 10 , bottom: 10) ,
                            child: Container(
                              width: 45,
                              child: Text("A+"
                                , style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),),
                            ),
                          ),

                       RaisedButton(onPressed: (){
                             a_plus = blood(1, a_plus);
                             print(a_plus);
                             
                             Firestore.instance.collection('bloodBank').doc('Aplus').set({
                               'num':  a_plus,

                             });

                             },
                              color:  Color(0xFF8F0026),
                            shape: CircleBorder(),
                         // padding:EdgeInsets.all(10),
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("+"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),


                          Text('$a_plus',
                            style: TextStyle( fontSize: 25 ,
                              color: Colors.black,

                            ),
                          ),


                           RaisedButton(onPressed: (){
                             a_plus =  blood(0, a_plus);
                              print(a_plus);
                             print(a_plus.toString());
                             Firestore.instance.collection('bloodBank').doc('Aplus').set({
                               'num':  a_plus,

                             });
                            },
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              color:  Color(0xFF8F0026) ,
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("-"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),


                              ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    // height: 50,
                    child: Card(
                      color: Colors.blueGrey[200],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children : <Widget>[

                          Padding(
                            padding: EdgeInsets.only(left : 30,right : 20 , top: 10 , bottom: 10) ,
                            child: Container(
                              width:45,
                              child: Text("A-"
                                , style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),),
                            ),
                          ),


                          //Padding(
                            //padding: EdgeInsets.only( right: 15,  left: 15, top: 10 , bottom: 10) ,
                            RaisedButton(onPressed: (){
                              a_neg = blood(1, a_neg);
                               print(a_neg);
                           
                             Firestore.instance.collection('bloodBank').doc('Aneg').set({
                               'num':  a_neg.toString(),

                             });

                            },
                              color:  Color(0xFF8F0026),
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("+"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),
                         // ),

                          Text( ' $a_neg',
                            style: TextStyle( fontSize: 25 ,
                              color: Colors.black,

                            ),
                          ),

                           RaisedButton(onPressed: (){
                              a_neg= blood(0, a_neg);

                               print(a_neg);
                           
                             Firestore.instance.collection('bloodBank').doc('Aneg').set({
                               'num':  a_neg.toString(),

                             });
                            },
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              color:  Color(0xFF8F0026) ,
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("-"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),

                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    // height: 50,
                    child: Card(
                      color: Colors.blueGrey[200],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children : <Widget>[

                          Padding(
                            padding: EdgeInsets.only(left : 30,right : 20 , top: 10 , bottom: 10) ,
                            child: Container(
                              width:45,
                              child: Text("B+"
                                , style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),),
                            ),
                          ),


                         RaisedButton(onPressed: (){
                              b_plus = blood(1, b_plus);
                                print(b_plus );
                           
                             Firestore.instance.collection('bloodBank').doc('Bplus').set({
                               'num':  b_plus.toString(),

                             });

                            },
                              color:  Color(0xFF8F0026),
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("+"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),


                          Text( ' $b_plus',
                            style: TextStyle( fontSize: 25 ,
                              color: Colors.black,

                            ),
                          ),

                          RaisedButton(onPressed: (){
                              b_plus = blood(0, b_plus);
                               print(b_plus );
                           
                             Firestore.instance.collection('bloodBank').doc('Bplus').set({
                               'num':  b_plus.toString(),

                             });
                            },
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              color:  Color(0xFF8F0026) ,
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("-"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),


                        ],
                      ),
                    ),
                  ),

                  Container(
                    width: double.infinity,
                    // height: 50,
                    child: Card(
                      color: Colors.blueGrey[200],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children : <Widget>[

                          Padding(
                            padding: EdgeInsets.only(left : 30,right : 10 , top: 10 , bottom: 10) ,
                            child: Container(
                              width:60,
                              child: Text("AB-"
                                , style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),),
                            ),
                          ),


                           RaisedButton(onPressed: (){
                              ab_neg = blood(1, ab_neg);
                               print(ab_neg );
                           
                             Firestore.instance.collection('bloodBank').doc('ABplus').set({
                               'num':  ab_neg.toString(),

                             });

                            },
                              color:  Color(0xFF8F0026),
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("+"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),


                          Text( ' $ab_neg',
                            style: TextStyle( fontSize: 25 ,
                              color: Colors.black,

                            ),
                          ),

                          RaisedButton(onPressed: (){
                              ab_neg= blood(0, ab_neg);
                               print(ab_neg );
                           
                             Firestore.instance.collection('bloodBank').doc('ABneg').set({
                               'num':  ab_neg.toString(),

                             });
                              
                            },
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              color:  Color(0xFF8F0026) ,
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("-"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),


                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    // height: 50,
                    child: Card(
                      color: Colors.blueGrey[200],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children : <Widget>[

                          Padding(
                            padding: EdgeInsets.only(left : 30,right : 20 , top: 10 , bottom: 10) ,
                            child: Container(
                              width:45,
                              child: Text("B-"
                                , style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),),
                            ),
                          ),


                          RaisedButton(onPressed: (){
                              b_neg = blood(1, b_neg);
                               print(b_neg);
                           
                             Firestore.instance.collection('bloodBank').doc('Bneg').set({
                               'num':  b_neg.toString(),

                             });

                            },
                              color:  Color(0xFF8F0026),
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("+"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),


                          Text( ' $b_neg',
                            style: TextStyle( fontSize: 25 ,
                              color: Colors.black,

                            ),
                          ),

                          RaisedButton(onPressed: (){
                              b_neg= blood(0, b_neg);
                                print(b_neg);
                           
                             Firestore.instance.collection('bloodBank').doc('Bneg').set({
                               'num':  b_neg.toString(),

                             });
                            },
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              color:  Color(0xFF8F0026) ,
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("-"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),


                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    // height: 50,
                    child: Card(
                      color: Colors.blueGrey[200],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children : <Widget>[

                          Padding(
                            padding: EdgeInsets.only(left : 30,right : 10 , top: 10 , bottom: 10) ,
                            child: Container(
                              width:60,
                              child: Text("AB+"
                                , style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),),
                            ),
                          ),


                           RaisedButton(onPressed: (){
                              ab_plus = blood(1, ab_plus);
                                print(ab_plus);
                           
                             Firestore.instance.collection('bloodBank').doc('ABplus').set({
                               'num':  ab_plus.toString(),

                             });

                            },
                              color:  Color(0xFF8F0026),
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("+"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),

                          Text( ' $ab_plus',
                            style: TextStyle( fontSize: 25 ,
                              color: Colors.black,

                            ),
                          ),

                           RaisedButton(onPressed: (){
                              ab_plus= blood(0, ab_plus);
                                 print(ab_plus);
                           
                             Firestore.instance.collection('bloodBank').doc('ABplus').set({
                               'num':  ab_plus.toString(),

                             });
                            },
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              color:  Color(0xFF8F0026) ,
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("-"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),


                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    // height: 50,
                    child: Card(
                      color: Colors.blueGrey[200],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children : <Widget>[

                          Padding(
                            padding: EdgeInsets.only(left : 30,right : 20 , top: 10 , bottom: 10) ,
                            child: Container(
                              width:45,
                              child: Text("O+"
                                , style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),),
                            ),
                          ),


                          RaisedButton(onPressed: (){
                              o_plus= blood(1, o_plus);
                                 print(o_plus);
                           
                             Firestore.instance.collection('bloodBank').doc('oplus').set({
                               'num':  o_plus.toString(),

                             });

                            },
                              color:  Color(0xFF8F0026),
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("+"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),


                          Text( ' $o_plus',
                            style: TextStyle( fontSize: 25 ,
                              color: Colors.black,

                            ),
                          ),

                           RaisedButton(onPressed: (){
                              o_plus= blood(0, o_plus);
                                 print(o_plus);
                           
                             Firestore.instance.collection('bloodBank').doc('oplus').set({
                               'num':  o_plus.toString(),

                             });
                            },
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              color:  Color(0xFF8F0026) ,
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("-"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),

                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    // height: 50,
                    child: Card(
                      color: Colors.blueGrey[200],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children : <Widget>[

                          Padding(
                            padding: EdgeInsets.only(left : 30,right : 20 , top: 10 , bottom: 10) ,
                            child: Container(
                              width:45,
                              child: Text("O-"
                                , style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),),
                            ),
                          ),


                           RaisedButton(onPressed: (){
                              o_neg = blood(1, o_neg);
                                  print(o_neg);
                           
                             Firestore.instance.collection('bloodBank').doc('oneg').set({
                               'num':  o_neg.toString(),

                             });

                            },
                              color:  Color(0xFF8F0026),
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("+"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),


                          Text( ' $o_neg',
                            style: TextStyle( fontSize: 25 ,
                              color: Colors.black,

                            ),
                          ),

                           RaisedButton(onPressed: (){
                              o_neg= blood(0, o_neg);
                                  print(o_neg);
                           
                             Firestore.instance.collection('bloodBank').doc('oneg').set({
                               'num':  o_neg.toString(),

                             });
                            },
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              color:  Color(0xFF8F0026) ,
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("-"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),


                        ],
                      ),
                    ),
                  ),

           ],
          ),
          
      ],
        ),
      ),
      ),
    );
  }
}