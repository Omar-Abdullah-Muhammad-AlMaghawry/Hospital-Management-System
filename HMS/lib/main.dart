import 'package:clinic/screens/home/Product.dart';
import 'package:clinic/screens/home/lab_patient.dart';
import 'package:clinic/widget/doctor.dart';
import 'package:clinic/widget/form_screen.dart';
import 'package:clinic/widget/laboratory.dart';
import 'package:clinic/widget/main_screen.dart';
import 'package:clinic/widget/outpatientclinics.dart';
import 'package:clinic/widget/rediology1.dart';
import 'package:clinic/widgets/try.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      theme: ThemeData(
        // primarySwatch: Colors.red[900],
        /* backgroundColor: Colors.teal[600],
         accentColor: Colors.deepOrange,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.red[900],
          textTheme: ButtonTextTheme.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),*/
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Rediology(),
    );
  }
}
