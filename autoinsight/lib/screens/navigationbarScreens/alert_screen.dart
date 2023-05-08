import 'package:flutter/material.dart';

class Alertscreen extends StatelessWidget {
  const Alertscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFFFF6D6D),title: Text('Alerts'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Alerts"),
        ],
      ),
    );
  }
}