import 'package:flutter/material.dart'


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      child:Column(
        children:<Widget>
        [Row(
        children:<Widget>
        [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(//insert image here
          ),
        ),
        SizedBox(width: 10,),
        Text('Welcome Back!',
        style:TextStyle(
          color:Color.fromARGB(255, 240, 87, 87),
          fontSize: 20,
        ),
        ),
        SizedBox(width: 30,),
        Card(
          child:Text(//current location)
        ),style:TextStyle(
          color:Colors.black,
          fontSize: 20,
        ),
        ),
        ]
      ),
      Container(
        child:
        Column(
          children:<Widget>
          [
            Card(
              child:
            )
          ]
        )
      ),
    ])
    );
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