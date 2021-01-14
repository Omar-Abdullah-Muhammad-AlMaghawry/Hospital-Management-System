import 'package:flutter/material.dart';

class hospitalmapimage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage image = new AssetImage('assets/images/map.jpg');
    Image image1 = new Image(
      image: image,
      //height: 300,
      // width: 1000,
      fit: BoxFit.fill,
    );
    return Container(
      //height: double.infinity,
      height: 500,

      child: image1,
    );
  }
}

class HospitalMap extends StatefulWidget {
  @override
  _HospitalMapState createState() => _HospitalMapState();
}

class _HospitalMapState extends State<HospitalMap> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
     //   backgroundColor: Color(0xFFD6D6D6),
        title: Text(' Hospital Map'),
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
      ),
      body: SafeArea(
        child: InteractiveViewer(
            panEnabled: false,
            boundaryMargin: EdgeInsets.all(100),
            minScale: 0.5,
            maxScale: 2,
            child: hospitalmapimage()),
      ),
    ));
  }
}
