import 'package:HMS/screens/patient/lab_radiolgy_book.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class Laboratory extends StatefulWidget {
  @override
  _LaboratoryState createState() => _LaboratoryState();
}

class _LaboratoryState extends State<Laboratory> {
  Future<DateTime> _selectDateTime(BuildContext context) => showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(seconds: 1)),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).backgroundColor,
      appBar: AppBar(
   //     backgroundColor: Colors.teal,

        title: Text(' List of Analysis'),
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
              Navigator.of(context).pop();
            },
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('/Laboratory').snapshots(),
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapshot.data.documents;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (ctx, index) => Container(
              padding: const EdgeInsets.only(top: 8.0),
              child: Card(
                margin: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.label),
                      title: Text(documents[index]['name']),
                      subtitle: Text(documents[index]['price']),
                    ),
                    SizedBox(height: 12),
                    RaisedButton(
                      color: Colors.teal,
                      child: Text('Book'),
                      onPressed: () async {
                        // final selectedDate = await _selectDateTime(context);
                        // print(selectedDate);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Date(documents[index]['name'],
                              documents[index]['price'], 'Ahmed'),
                        ));
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
