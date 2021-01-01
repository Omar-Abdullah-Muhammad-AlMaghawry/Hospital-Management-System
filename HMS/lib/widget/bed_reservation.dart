

import 'package:flutter/material.dart'  ;

void main() {
  runApp(Homepage ());
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        backgroundColor: Color(0xFFE1F5FE),
        appBar: AppBar(
          title: Text('Inform Disk and Financial department',
            style: TextStyle(fontSize: 15,
              color: Colors.black,
            ),
          ),
          backgroundColor: Color(0xFD6D6D6),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton( onPressed:(){

                },
                  elevation: 10,

                  shape: StadiumBorder(),
                  child : Text( 'logout',
                      style: TextStyle( fontSize: 20,
                        color: Colors.black,
                      )
                  ),
                  color:Colors.lightBlueAccent,

                ),



              ],
            ),
          ],
        ),
        body: List(),
        floatingActionButton:

        FloatingActionButton(
          child: Icon(Icons.add_comment_rounded),
          onPressed: (){
            debugPrint("Hello world");
          },
          splashColor: Colors.lightBlueAccent,
          elevation: 10 ,
          tooltip: "Chat",
        ),



      ),

    );


  }
}

Widget List(){
  var list =  ListView (
    children: <Widget>[

      ListTile(
        title: Text("push Notifcation "),
        trailing: Icon(Icons.add_alert_sharp),
        onTap: () {
          debugPrint("Hello world");
        },
      ),
      ListTile(
        title: Text('service fees '),
        trailing : Icon (Icons.accessibility_new_outlined),
        onTap :(){},
      ),

      ListTile(

        title: Text("Access Data") ,
        trailing : Icon (Icons.account_circle_rounded),
        onTap :(){},
      ),

      ListTile(

        title: Text('Bed Reservation'),
        trailing : Icon (Icons.add_to_photos_rounded),
        onTap :(){},
      ),

    ],

  );

  return list;
}

//import 'package:flutter/material.dart';
//import 'layouts/home_screen.dart';
/*

void main() => runApp(MyFlutterApp());

//void main() => runApp(MyFlutterApp());

void main() {
  runApp(
      MaterialApp(
          title: "My List View",
          home: Scaffold(
            body: myListView(),
          )
      )
  );
}

Widget myListView() {
  var list = ListView(
    children: <Widget>[

      ListTile(
        leading: Icon(Icons.access_alarm),
        title: Text("My alarm"),
        subtitle: Text("the body of the alam list"),
        trailing: Icon(Icons.accessibility),
        onTap: () {
          debugPrint("Hello world");
        },
      ),
      ListTile(
        leading: Icon(Icons.adb),
        title: Text("My android"),
        subtitle: Text("the body of the android list"),
        trailing: Icon(Icons.image),
      ),      ListTile(
        title: Text("My android"),
        trailing: Icon(Icons.image),
      ),

    ],
  );
  return list;
}
*/