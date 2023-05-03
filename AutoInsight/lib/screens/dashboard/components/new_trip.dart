import 'package:flutter/material.dart';

class New_trip extends StatelessWidget {
  String start;
  String end;
  String distance;
  final Function addtripCallback;
  New_trip(this.addtripCallback,
      {required this.start, required this.end, required this.distance});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'New Trip',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.blueGrey.shade900,
                  fontWeight: FontWeight.bold),
            ),
            TextField(
              autofocus: true,
              cursorColor: Colors.blueGrey,
              onChanged: (newText) {
                start = newText;
              },
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: 'enter starting location',
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey.shade900))),
            ),
            TextField(
              autofocus: true,
              cursorColor: Colors.blueGrey,
              onChanged: (newText) {
                end = newText;
              },
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: 'enter destination',
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey.shade900))),
            ),
            TextField(
              autofocus: true,
              cursorColor: Colors.blueGrey,
              onChanged: (newText) {
                distance = newText;
              },
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: 'enter distance',
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey.shade900))),
            ),
            ElevatedButton(
              onPressed: () {
                addtripCallback(start, end, distance);
              },
              child: Text('Create Trip'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey.shade900),
            )
          ],
        ),
      ),
    );
  }
}
