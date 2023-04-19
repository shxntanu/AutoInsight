import 'package:flutter/material.dart';

class New_trip extends StatelessWidget {
  const New_trip({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text('Create New Trip'),
      content: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'current location'),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'destinaton'),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: () {}, child: Text('Create'))
        ],
      ),
    );
  }
}
