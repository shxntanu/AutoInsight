import 'package:flutter/material.dart';
import 'package:autoinsight/main.dart';

import 'components/bottombar.dart';

class FinalHomeScreen extends StatefulWidget {
  @override
  _FinalHomeScreenState createState() => _FinalHomeScreenState();
}

class _FinalHomeScreenState extends State<FinalHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
          SizedBox(
            height: 35,
          ),
          Row(children: <Widget>[
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 20,
              // backgroundImage: AssetImage(//insert image here
              // ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Welcome Back!',
              style: TextStyle(
                  color: Color(0xFF03045E),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 90,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  'current location',
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                ),
              ),
              color: Colors.grey,
            ),
          ]),
          Container(
              child: Column(children: <Widget>[
            Card(
              child: Text('Previous Trips'),
            ),
          ])),
        ]),
        bottomNavigationBar: BottomAppBar(
          height: 60,
          color: Color(0xFFFF6D6D),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 20,
              ),
              BottomBarButton(
                icon: Icons.person,
                tip: 'User',
              ),
              SizedBox(
                width: 30,
              ),
              BottomBarButton(
                icon: Icons.camera,
                tip: 'Area Feed',
              ),
              SizedBox(
                width: 30,
              ),
              BottomBarButton(
                icon: Icons.add,
                tip: 'New Trip',
              ),
              SizedBox(
                width: 30,
              ),
              BottomBarButton(
                icon: Icons.card_membership,
                tip: 'Vehicle',
              ),
              SizedBox(
                width: 30,
              ),
              BottomBarButton(
                icon: Icons.settings,
                tip: 'Settings',
              )
            ],
          ),
        ));
  }
}



// [
//                   Text('Create New Trip',),
//                   SizedBox(height: 10,),
//                   TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'Enter current location',
//                     ),
//                   ),
//                   SizedBox(height: 10,),
//                   TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'Enter destination',
//                     ),
//                   ),
//                 ]