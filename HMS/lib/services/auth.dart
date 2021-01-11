import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../models/users.dart';
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
  Client _userFromFirebaseUser(User user) {
    return user != null ? Client(email: user.email) : null;
  }

  // auth change user stream
  Stream<Client> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //sign in anon
  // Future signInAnon() async {
  //   try {
  //     UserCredential result = await _auth.signInAnonymously();
  //     FirebaseUser users = result.user;
  //     return _userFromFirebaseUser(users);
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      print(user);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//
  Future resetPassword(email) async {
    try {
      String email;
      await _auth.sendPasswordResetEmail(email: email);
      //FirebaseUser user = result.user;
      // return _userFromFirebaseUser(user);
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
      String date,
      File image}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = FirebaseAuth.instance.currentUser;
      User user0 = result.user;
      UserCredential userCredential;
      final ref = FirebaseStorage.instance
          .ref()
          .child("users_images")
          .child(_auth.currentUser.uid + ".jpg");
      await ref.putFile(image);
      final url = await ref.getDownloadURL();

      await FirebaseFirestore.instance
          .collection("users")
          .document(user.uid)
          .set({
        'userName': userName,
        'email': email,
        'image_url': url,
        "birthDate": date,
        "address": address,
        "phoneNumber": phoneNumber,
      });
      await FirebaseFirestore.instance
          .collection(email.contains("p", email.indexOf("@"))
              ? "patients"
              : email.contains("d", email.indexOf("@"))
                  ? "doctors"
                  : email.contains("f", email.indexOf("@"))
                      ? "frontdesk"
                      : "none")
          .document(user.uid)
          .set({
        'userName': userName,
        'email': email,
        'image_url': url,
        "birthDate": date,
        "address": address,
        " phoneNumber": phoneNumber,
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
