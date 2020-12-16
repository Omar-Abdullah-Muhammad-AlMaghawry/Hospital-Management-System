// import 'package:flutter/material.dart';

// class MainDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.only(
//               top: 30,
//             ),
//             color: Color.fromRGBO(153, 238, 255, 1),
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         image: NetworkImage(
//                             'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.itl.cat%2Fwallview%2Fhwmhxo_cute-profile-images-pic-for-whatsapp-for-boys%2F&psig=AOvVaw33eNQImBWnkA9wJ87Hnjpo&ust=1607908633876000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMi5vsvkye0CFQAAAAAdAAAAABAD'),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     "User Name",
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                   Text(
//                     "@01011179003",
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.home),
//             title: Text("Home"),
//             onTap: () {},
//           ),
//           ListTile(
//             leading: Icon(Icons.add),
//             title: Text("OutPatient Clincis"),
//             onTap: () {},
//           ),
//           ListTile(
//             leading: Icon(Icons.add),
//             title: Text("Medical Anlysis"),
//             onTap: () {},
//           ),
//           ListTile(
//             leading: Icon(Icons.add),
//             title: Text("Radiation"),
//             onTap: () {},
//           ),
//           ListTile(
//             leading: Icon(Icons.map),
//             title: Text("Map"),
//             onTap: () {},
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 50),
//             decoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               color: Color.fromRGBO(153, 238, 255, 1),
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   "Contuct Us",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 30,
//                   ),
//                 ),
//                 Text('01011111111'),
//                 Text('username@gmail.com'),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(icon: Icon(Icons.face), onPressed: () {}),
//                     IconButton(icon: Icon(Icons.face), onPressed: () {}),
//                     IconButton(icon: Icon(Icons.face), onPressed: () {}),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
