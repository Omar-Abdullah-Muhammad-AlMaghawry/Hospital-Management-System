import 'package:firebase_auth/firebase_auth.dart';
import 'package:authentication/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  String email = '';
  String password = '';
  String confirmpassword = '';
  String error = '';
  String userName = '';
  String phoneNumber = '';
  String address = '';
  String date = "";
  AuthService(
      {this.date,
      this.email,
      this.address,
      this.confirmpassword,
      this.error,
      this.password,
      this.phoneNumber,
      this.userName});

  final FirebaseAuth _auth = FirebaseAuth.instance;
  // we will create user object based on firebaseUser using a function
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(email: user.email) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      print(user);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(
      {String email,
      String password,
      String confirmpassword,
      String error,
      String userName,
      String phoneNumber,
      String address,
      String date}) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = await FirebaseAuth.instance.currentUser();
      FirebaseUser user0 = result.user;
      await Firestore.instance.collection("users").document(user.uid).setData({
        "username": userName,
        "email": email,
        "phoneNumber": phoneNumber,
        "adress": address,
        "date": date
      });
      return _userFromFirebaseUser(user0);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
