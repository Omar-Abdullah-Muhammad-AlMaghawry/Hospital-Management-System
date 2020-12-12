import 'package:flutter/material.dart';
import './widgets/CustomFloatingActionButton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8F0026),
      ),
      body: Text('sup'),
      floatingActionButton: CustomFloatingActionButton(() {}),
      backgroundColor: Color(0xFF035F6D),
    );
  }
}
