import 'package:flutter/material.dart';

class NiceButton extends StatelessWidget {
  final String nameOfButton;
  final double widthOfButton;
  final double heightOfButton;
  final Function functionOfButton;
  final double fontOfSize;


  NiceButton(
      {this.nameOfButton,
      this.widthOfButton,
      this.functionOfButton,
      this.heightOfButton,
      this.fontOfSize});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Color.fromRGBO(0, 153, 255, 1),
          // image: const DecorationImage( image: NetworkImage(
          //     'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg')),
          border: Border.all(width: 2, color: Colors.black)),
      // padding: EdgeInsets.all(5),
      width: widthOfButton,
      height: heightOfButton,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      
      //color: Color.fromRGBO(0, 153, 255, 1),
      child: FlatButton(
        textColor: Color.fromRGBO(255, 255, 255, 1),
        child: Text(
          nameOfButton,
          style: TextStyle(
              fontSize: fontOfSize,
              // color: Color.fromRGBO(255, 255, 255, 1),
              fontWeight: FontWeight.bold),
        ),
        onPressed: () {},
      ),
    );
  }
}
