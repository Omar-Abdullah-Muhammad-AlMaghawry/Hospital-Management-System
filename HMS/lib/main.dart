import 'package:cloud_firestore/cloud_firestore.dart';

import './widgets/CustomDrawer.dart';
import 'package:flutter/material.dart';
import './widgets/CustomFloatingActionButton.dart';
import './widgets/CustomAppBar.dart';
import 'package:firebase_core/firebase_core.dart';
import './services/DbService.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HMS',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: DbService().getPatients,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: constructCustomAppBar(() {}, 'Suxess', '0123456789'),
            drawer: CustomDrawer(),
            floatingActionButton: CustomFloatingActionButton(() {}),
            backgroundColor: Color(0xFF035F6D),
            body: ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(snapshot.data.docs[index].data()['name']),
                    Text(snapshot.data.docs[index].data()['phoneNumber']),
                  ],
                );
              },
            ),
          );
        });
  }
}
