import 'package:first_app/Screens/Authenticate/authenticate.dart';
import 'package:first_app/Screens/Homepage/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_app/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    print(user);
    //Return either Authenticate or Home
    return Authenticate();
  }
}
