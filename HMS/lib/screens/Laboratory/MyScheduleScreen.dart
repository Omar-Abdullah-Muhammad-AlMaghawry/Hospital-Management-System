import 'dart:io';

import '../masterHome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../widget/scudule.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyScuduleScreen extends StatefulWidget {
  static const nameRoute = "/my-scudule";
  @override
  _MyScuduleScreenState createState() => _MyScuduleScreenState();
}

class _MyScuduleScreenState extends State<MyScuduleScreen> {
  String _imageScUrl;
  final _user = FirebaseAuth.instance.currentUser;
  void _pickImage() async {
    final pickedImageFile =
        await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 300);
    final _ref =
        FirebaseStorage.instance.ref().child("Scudule").child("Scudule.jpg");
    await _ref.putFile(pickedImageFile);
    final _imageUrl = await _ref.getDownloadURL();
    await FirebaseFirestore.instance
        .collection("doctors")
        .document(_user.uid)
        .update({
      "sceduleImageUrl": _imageUrl,
    });
    setState(() {
      _imageScUrl = _imageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("My Schedule"),
        actions: [
          FlatButton.icon(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: Text('Home',
                style: TextStyle(color: Colors.white, fontSize: 16.0)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("doctors")
              .document(_user.uid)
              .snapshots(),
          builder: (context, snapshot) {
            final doctorDocs = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            // if (doctorDocs["sceduleImageUrl"] != null)
            try {
              return Scudule(doctorDocs["sceduleImageUrl"]);
            } catch (err) {
              return Container();
            }
          }),

      /// drawer: ,
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        child: Icon(
          Icons.camera_alt,
          color: Theme.of(context).bottomAppBarColor,
        ),
      ),
    );
  }
}
