import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 50,
            ),
            color: Color.fromRGBO(153, 238, 255, 1),
            child: Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
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
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color.fromRGBO(153, 238, 255, 1),
            ),
            child: Text(
              "Contuct Us",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          Text('01011111111'),
          Text('username@gmail.com'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(icon: Icon(Icons.face), onPressed: null),
              IconButton(icon: Icon(Icons.face), onPressed: null),
              IconButton(icon: Icon(Icons.face), onPressed: null),
            ],
          )
        ],
      ),
    );
  }
}
