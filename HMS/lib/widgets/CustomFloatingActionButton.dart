import 'package:flutter/material.dart';

//TODO connect it to the chat page
class CustomFloatingActionButton extends StatelessWidget {
  Function function;

  CustomFloatingActionButton(function);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: function,
      backgroundColor: Colors.white,
      child: Icon(
        Icons.chat_rounded,
        color: Color(0xFF8F0026),
      ),
    );
  }
}
