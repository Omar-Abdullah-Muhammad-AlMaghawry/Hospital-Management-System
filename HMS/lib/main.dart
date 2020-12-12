import 'package:flutter/material.dart';
import './widget/RaisedButton.dart';

void main() => runApp(MyApp01());

class MyApp01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HMS',
      //theme: ThemeData(primarySwatch:/*Color.fromARGB(1, 3, 95, 109)*/ ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 95, 109, 1),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {},
          )
        ],
        title: Text("HMS"),
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: Image(
              image: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
            ),
          ),
          NiseButton(
            nameOfButton: "My Profile",
            sizeOfButton: double.infinity,
          ),
          NiseButton(
            nameOfButton: "My Appointments",
            sizeOfButton: double.infinity,
          ),
          NiseButton(
            nameOfButton: "My Midical History",
            sizeOfButton: double.infinity,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.chat,
        ),
        onPressed: () {},
      ),
    );
  }
}
