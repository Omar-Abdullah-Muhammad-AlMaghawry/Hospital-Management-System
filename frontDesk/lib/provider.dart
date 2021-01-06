////////// merna chat list
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
/*
void main() {
  runApp(Homepage ());
}
*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Homepage());
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List<Item> _data = <Item>[
    Item( headervalue: 'jjb' , expandedvalue: 'ugug'),

  ];
  //var scroll = ScrollDragController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
          backgroundColor: Color(0xFFE1F5FE),
          appBar: AppBar(
            title: Text(' Access Data ',
              style: TextStyle(fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Color(0xFD6D6D6),
          ),
          //  Firebase val = Firebase.instance();
          body:ListView(
            children: [
              ExpansionPanelList(
                expansionCallback: (int index , bool isEpanded){
                  setState(() {
                    _data[index].isEpanded = ! _data [index].isEpanded;

                  });
                },

                children: _data.map  ((Item item){
                  return ExpansionPanel(headerBuilder: (BuildContext context , bool isEpanded){
                    return Container(child:Text(item.headervalue,)
                    );
                  },
                    isExpanded : item.isEpanded,
                  );


                }),
              ),
            ],
          ) ,

        )
    );
  }
}

class Item {
  String expandedvalue;
  String headervalue;
  bool isEpanded;
  Item({this.expandedvalue , this.headervalue ,this.isEpanded=false});
/*
  List<Item> generateItems (int numberofitems){
    return List.generate (numberofitems, (index){
      return Item(
        headervalue: 'panel $index',
        expandedvalue: 'this is item number $index ',

      );

    });*/
}
