import 'package:authentication/models/user.dart';
//import 'package:authentication/screens/NormalBeds.dart';
import 'package:authentication/screens/home/homeWrapper.dart';
import 'package:authentication/screens/authenticate/authenticate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:HMS/screens/home/homeDoctor.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //print(user);
    //return either home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return HomeWrapper();
    }
  }
}
