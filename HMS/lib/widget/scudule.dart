import 'package:flutter/material.dart';
import './user_image_picker.dart';

class Scudule extends StatefulWidget {
  String imageScUrl;
  Scudule(this.imageScUrl);
  @override
  _ScuduleState createState() => _ScuduleState();
}

class _ScuduleState extends State<Scudule> {
  @override
  Widget build(BuildContext context) {
    if (widget.imageScUrl != null)
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
        height: 400,
        width: double.maxFinite,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(widget.imageScUrl),
        )),
      );
    else
      return Center();
  }
}
