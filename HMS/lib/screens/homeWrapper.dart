import 'package:HMS/screens/Laboratory/lab_home_screen.dart';
import 'package:HMS/screens/Radiology/rad_home_screen.dart';

import './doctors/doctors_home_screen.dart';

import './doctors/Form_Screen.dart';

import './doctors/doctors_home_screen.dart';
import './patient/patients_home_screen.dart';

import 'MyProfile.dart';
import 'package:flutter/material.dart';
import '../services/auth.dart';
import 'package:provider/provider.dart';
import '../models/users.dart';
import './FrontDesk.dart/FrontHome.Dart';

class HomeWrapper extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Client>(context);
    print(user);
    //return either doctor home or patient home widget
    var val = user.email;
    var i = val.indexOf('@');
    if ((val.contains('d', i) &&
        val.contains('o', i + 1) &&
        val.contains('c', i + 2) &&
        val.contains('t', i + 3) &&
        val.contains('o', i + 4) &&
        val.contains('r', i + 5))) {
      return DoctorsHomeScreen() ?? Center();
    } else if (val.contains('p', i) &&
        val.contains('a', i + 1) &&
        val.contains('t', i + 2) &&
        val.contains('i', i + 3) &&
        val.contains('e', i + 4) &&
        val.contains('n', i + 5) &&
        val.contains('t', i + 6)) {
      return PatientHomeScreen() ?? Center();
    } else if (val.contains('f', i) &&
        val.contains('r', i + 1) &&
        val.contains('o', i + 2) &&
        val.contains('n', i + 3) &&
        val.contains('t', i + 4)) {
      return FrontHome() ?? Center();
    } else if (val.contains('l', i) &&
        val.contains('a', i + 1) &&
        val.contains('b', i + 2)) {
      return LabHomeScreen() ?? Center();
    } else if (val.contains('r', i) &&
        val.contains('a', i + 1) &&
        val.contains('d', i + 2)) {
      return RadiologyHomeScreen() ?? Center();
    } else {
      _auth.signOut();
      return Center(child :Text(""));
    }
  }
}
