import 'package:HMS/screens/FrontDesk.dart/Acess%20Data.dart';
import 'package:HMS/screens/FrontDesk.dart/Service_fees.dart';
import 'package:HMS/screens/FrontDesk.dart/bed_reservation.dart';
import 'package:HMS/screens/FrontDesk.dart/choose_manger.dart';
import 'package:HMS/screens/FrontDesk.dart/initialFeesScreen.dart';
import 'package:HMS/screens/chat/move-to-transaction-screesn.dart';
import '../chat/patientchatlist.dart';
import 'package:flutter/material.dart';
import '../../services/auth.dart';
import '../chat/frontchatlist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../masterHome.dart';

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
        //  backgroundColor: Color(0xFFE1F5FE),
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text('Inform Disk and Financial department',
              style: TextStyle(color: Colors.white, fontSize: 16.0)),
          actions: [
            FlatButton.icon(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              label: Text('Log out',
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.popUntil(
                    context, ModalRoute.withName(MasterHome.nameRoute));
              },
            )
          ],
        ),
        body: list(context),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.message),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FrontNavigator(),
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
      SizedBox(height: 10.0),
      ListTile(
        tileColor: Theme.of(context).appBarTheme.color,
        title: Text(
          "push Notifcation ",
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(Icons.add_alert_sharp, color: Colors.white),
        onTap: () {
          debugPrint("Hello world");
        },
      ),
      SizedBox(height: 10.0),
      ListTile(
        tileColor: Theme.of(context).appBarTheme.color,
        title: Text(
          'service fees ',
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(Icons.accessibility_new_outlined, color: Colors.white),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>ServiceFees(),
            ),
          );
        },
      ),
      SizedBox(height: 10.0),
      ListTile(
        tileColor: Theme.of(context).appBarTheme.color,
        title: Text(
          "Access Data",
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(Icons.account_circle_rounded, color: Colors.white),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AccessData()),
          );
        },
      ),
      SizedBox(height: 10.0),
      ListTile(
        tileColor: Theme.of(context).appBarTheme.color,
        title: Text(
          'Bed Reservation',
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(Icons.add_to_photos_rounded, color: Colors.white),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BedReservation(),
              ));
        },
      ),
      SizedBox(height: 10.0),
      ListTile(
        tileColor: Theme.of(context).appBarTheme.color,
        title: Text(
          'Choosing Manger',
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(
          Icons.add_to_photos_rounded,
          color: Colors.white,
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChooseMangerScreen(),
              ));
        },
      ),
    ],
  );

  return list;
}
