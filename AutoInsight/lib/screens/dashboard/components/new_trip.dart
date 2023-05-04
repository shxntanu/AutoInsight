import 'package:flutter/material.dart';

class New_trip extends StatelessWidget {

  final _startCtr = TextEditingController();
  final _destCtr = TextEditingController();
  final _distCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Form(
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
              TextFormField(
                controller: _startCtr,
                autofocus: true,
                cursorColor: Colors.blueGrey,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: 'enter starting location',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey.shade900))),
              ),
              TextFormField(
                controller: _destCtr,
                autofocus: true,
                cursorColor: Colors.blueGrey,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: 'enter destination',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey.shade900))),
              ),
              TextFormField(
                controller: _distCtr,
                autofocus: true,
                cursorColor: Colors.blueGrey,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: 'enter distance',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey.shade900))),
              ),
              ElevatedButton(
                onPressed: () {
                  // addtripCallback(start, end, distance);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey.shade900),
                child: const Text('Create Trip'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
