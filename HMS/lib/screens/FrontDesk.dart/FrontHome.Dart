import 'package:HMS/screens/FrontDesk.dart/Acess%20Data.dart';
import 'package:HMS/screens/FrontDesk.dart/Service_fees.dart';
import 'package:HMS/screens/FrontDesk.dart/bed_reservation.dart';
import 'package:HMS/screens/patientchatlist.dart';
import 'package:flutter/material.dart';
import '../../services/auth.dart';
import '../frontchatlist.dart';

class FrontHome extends StatefulWidget {
  @override
  _FrontHomeState createState() => _FrontHomeState();
}

class _FrontHomeState extends State<FrontHome> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFE1F5FE),
        appBar: AppBar(
          title: Text(
            'Inform Disk and Financial department',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          backgroundColor: Color(0xFD6D6D6),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  onPressed: () async {
                    await _auth.signOut();
                  },
                  elevation: 10,
                  shape: StadiumBorder(),
                  child: Text('log out',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                  color: Colors.lightBlueAccent,
                ),
              ],
            ),
          ],
        ),
        body: list(context),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.message),
          onPressed:  () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PatientChatList(),
                ),
              ),
          splashColor: Colors.lightBlueAccent,
          elevation: 10,
          tooltip: "Chat",
        ),
      ),
    );
  }
}

Widget list(BuildContext context) {
  var list = ListView(
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
        trailing: Icon(Icons.accessibility_new_outlined),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ServiceFees()),
          );
        },
      ),
      ListTile(
        title: Text("Access Data"),
        trailing: Icon(Icons.account_circle_rounded),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AccessData()),
          );
        },
      ),
      ListTile(
        title: Text('Bed Reservation'),
        trailing: Icon(Icons.add_to_photos_rounded),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BedReservation(),
              ));
        },
      ),
    ],
  );

  return list;
}
