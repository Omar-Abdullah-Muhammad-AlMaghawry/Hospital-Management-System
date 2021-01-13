import 'package:flutter/material.dart';


class hospitalmapimage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage image = new AssetImage('images/map.jpg');
    Image image1 = new Image(image: image,
    //height: 300,
     // width: 1000,
        fit: BoxFit.fill,

    );
    return Container(
 //height: double.infinity,   
 height: 500,  
      
      child:image1,) ;
  }


}







class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home:Scaffold(
          appBar:AppBar(
            backgroundColor:  Color(0xFFD6D6D6),
            title: Text(' Hospital Map'),
            actions: [
              IconButton(
                icon:Icon(Icons.close,
                  // color: Color( 0xFF0099FF),
                  color: Colors.white,
                ),
                onPressed: (){
                  //_auth.signOut();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          body: SafeArea(
           child: 
           
           InteractiveViewer(
             panEnabled: false,
             boundaryMargin: EdgeInsets.all(100),
             minScale: 0.5,
             maxScale: 2,
             child: hospitalmapimage()),


          ),
       )
    );    
  }
}