import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreviousTrip extends StatelessWidget {
  late String start, end;
  double distance;
  PreviousTrip({required this.start, required this.end,required this.distance});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
        child: SizedBox(
          width: MediaQuery.of(context).size.width*0.75,
          child: Card(
            borderOnForeground: true,
            color: Colors.white,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(start),
                  Text(end),
                  Text(distance.toString()),
                ]),
          ),
        ),
      ),
    );
  }
}