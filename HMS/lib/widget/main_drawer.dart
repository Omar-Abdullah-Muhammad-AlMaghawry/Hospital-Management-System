import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 30,
            ),
            color: Theme.of(context).primaryColorDark,
            //Color.fromRGBO(153, 238, 255, 1),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://img.republicworld.com/republic-prod/stories/promolarge/xxhdpi/tivvhptvbuc6cs3l_1596777854.jpeg?tr=w-812,h-464'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    "User Name",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    "@01011179003",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text("OutPatient Clincis"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text("Medical Anlysis"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text("Radiation"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text("Map"),
            onTap: () {},
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color.fromRGBO(153, 238, 255, 1),
            ),
            child: Column(
              children: [
                Text(
                  "Contuct Us",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Text('01011111111'),
                Text('username@gmail.com'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon: Icon(Icons.face), onPressed: () {}),
                    IconButton(icon: Icon(Icons.face), onPressed: () {}),
                    IconButton(icon: Icon(Icons.face), onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
