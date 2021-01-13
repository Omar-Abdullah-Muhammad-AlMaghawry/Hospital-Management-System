import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';

class Radiology extends StatefulWidget {
  @override
  _RadiologyState createState() => _RadiologyState();
}

class _RadiologyState extends State<Radiology> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).backgroundColor,
      appBar: AppBar(
       // backgroundColor: Colors.teal,
        title: Text('Rediological Tests'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('/Radiology').snapshots(),
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
                      onPressed: () {
                        Firestore.instance
                            .collection('/appoiment')
                            .document('1') //user id
                            .setData({
                          'price': documents[index]['price'],
                          'name': documents[index]['name'],
                          'depart': 'Radiology'
                       
                        });
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
