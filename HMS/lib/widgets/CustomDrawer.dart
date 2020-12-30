import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: Color(0xFF8F0026),
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                Icon(
                  Icons.person,
                  size: 65,
                ),
                Text(
                  'Omar الجامد',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: FlatButton(
              color: Colors.blue[100],
              onPressed: () => {},
              child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  'Home',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: FlatButton(
              color: Colors.blue[100],
              onPressed: () => {},
              child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  'Outpatient Clinics',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: FlatButton(
              color: Colors.blue[100],
              onPressed: () => {},
              child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  'Blood Tests\' lab',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: FlatButton(
              color: Colors.blue[100],
              onPressed: () => {},
              child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  'Radiology',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: FlatButton(
              color: Colors.blue[100],
              onPressed: () => {},
              child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  'Hospital Map',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 260,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 50),
                Text(
                  'Contact us:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Phone: 07775000',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Address: شارع الشهيد ميكي ماوس',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/fb_logo.jpg'),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/twitter_logo.jpg'),
                    ),
                  ),
                ),
                Icon(
                  Icons.info_outline,
                  size: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
