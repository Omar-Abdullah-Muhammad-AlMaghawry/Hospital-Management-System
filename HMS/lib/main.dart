import 'package:HMS/screens/auth_screens.dart';
import 'package:HMS/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'widget/NiceButton.dart';
import 'widget/appointment/CardWidget.dart';
//import 'package:intl/intl.dart';
import 'widget/CardHistoryWidget.dart';
//import 'widget/main_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp01());
}

class MyApp01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HMS',
      //theme: ThemeData(primarySwatch:/*Color.fromARGB(1, 3, 95, 109)*/ ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (ctx, userSnapshot) {
          if (userSnapshot.hasData) {
            return ChatScreen();
          }
          return AuthScreen();
        },
      ),

      //MyHomePage(),
      theme: ThemeData(
        backgroundColor: Color.fromRGBO(3, 95, 109, 1),
        // primaryColor: Color.fromRGBO(3, 95, 109, 1),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 95, 109, 1),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {},
          )
        ],
        title: Text("HMS"),
      ),
      // drawer: MainDrawer(),
      body: ListView(
        children: [
          // Container(
          //   height: 200,
          //   width: double.infinity,
          //   child: Image(
          //     image: NetworkImage(
          //         'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
          //   ),
          // ),
          // NiceButton(
          //   nameOfButton: "My Profile",
          //   heightOfButton: 75,
          // ),
          // NiceButton(
          //   nameOfButton: "My Appointments",
          //   widthOfButton: double.infinity,
          //   heightOfButton: 75,
          // ),
          // NiceButton(
          //   nameOfButton: "My Midical History",
          //   widthOfButton: double.infinity,
          //   heightOfButton: 75,
          // ),
          CardWidget(
            titleOfCardApp: "Analysis",
            bodyOfCardApp: ['Doctor: Ahmed', 'afs'],
            dateOfReservation: DateTime.now(),
          ),
          CardWidget(
            titleOfCardApp: "Radiation",
            bodyOfCardApp: ['Doctor: Youef', 'sasa'],
            dateOfReservation: DateTime.now(),
          ),
          CardHistoryWidget(
            titleOfCardApp: "Friday",
            bodyOfCardApp: ['Doctor: Mohamed', 'ada'],
            dateOfReservation: DateTime.now(),
          ),
          CardHistoryWidget(
            titleOfCardApp: "SatrDay",
            bodyOfCardApp: ['Doctor: Ali', 'JFGD'],
            dateOfReservation: DateTime.now(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.chat,
        ),
        onPressed: () {},
      ),
    );
  }
}
