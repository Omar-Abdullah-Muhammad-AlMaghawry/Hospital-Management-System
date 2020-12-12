import 'package:flutter/material.dart';

Widget constructCustomAppBar(logout, userName, id) {
  return AppBar(
    actions: [
      IconButton(
        icon: Icon(Icons.logout),
        onPressed: logout,
      ),
    ],
    backgroundColor: Color(0xFF8F0026),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          userName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        Text(
          id,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}
