import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreviousTrip extends StatelessWidget {
  String start, end;
  String distance;
  PreviousTrip(
      {required this.start, required this.end, required this.distance});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
        child: Card(
          borderOnForeground: true,
          color: Colors.white,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(start),
                Text(end),
                Text(distance),
              ]),
        ),
      ),
    );
  }
}
