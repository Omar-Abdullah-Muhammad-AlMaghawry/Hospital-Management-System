import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

import '../widget/scudule.dart';
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
  void _pickImage() async {
    final pickedImageFile = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50, maxWidth: 300);
    final _ref =
        FirebaseStorage.instance.ref().child("Scudule").child("Scudule.jpg");
    await _ref.putFile(pickedImageFile);
    final _imageUrl = await _ref.getDownloadURL();

    setState(() {
      _imageScUrl = _imageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyScudule"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).pop();
              FirebaseAuth.instance.signOut();
            },
          )
        ],
      ),
      body: Scudule(_imageScUrl),

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
