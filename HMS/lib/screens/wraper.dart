import '../models/users.dart';
//import 'package:authentication/screens/NormalBeds.dart';
import './homeWrapper.dart';
import '../screens/authenticate/authenticate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import './MyProfile.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Client>(context);
    //print(user);
    //return either home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return HomeWrapper();
    }
  }
}
