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
    var ok = user.email;
    var index = ok.indexOf('@');
    if (ok.contains('d', index)) {
      return DoctorsHomeScreen()??Center();
    } else if (ok.contains('p', index)) {
      return PatientHomeScreen() ?? Center();
    }
    else if (ok.contains('f', index)) {
      return DoctorsHomeScreen() ?? Center();
    } else if (ok.contains('g', index)){
      Center();
    }
  }
}
