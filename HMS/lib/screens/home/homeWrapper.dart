import 'package:authentication/screens/home/homeDoctor.dart';
import 'package:flutter/material.dart';
import 'package:authentication/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:authentication/models/user.dart';
import 'package:authentication/screens/home/homePatient.dart';
import 'package:authentication/screens/FrontDesk.dart/FrontHome.Dart';

class HomeWrapper extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    //return either doctor home or patient home widget
    var ok = user.email;
    var index = ok.indexOf('@');
    if (ok.contains('d', index)) {
      return Profile();
    }
    if (ok.contains('p', index)) {
      return HomePatient();
    }
  }
}
