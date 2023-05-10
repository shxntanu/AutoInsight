import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/trip_controller.dart';
import '../../../models/previoustrip.dart';

final tripCtr = Get.put(tripController());

class New_trip extends StatelessWidget {

  final _ctr1 = TextEditingController();
  final _ctr2 = TextEditingController();
  final _ctr3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text('Create New Trip'),
      content: Column(
        children: [
          TextField(
            controller: _ctr1,
            decoration: const InputDecoration(hintText: 'current location'),
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: _ctr2,
            decoration: const InputDecoration(hintText: 'destinaton'),
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: _ctr3,
            decoration: const InputDecoration(hintText: 'destinaton'),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: () {
            tripCtr.addTrip(
              PreviousTrip(
                start: _ctr1.text,
                end: _ctr2.text,
                distance: double.parse(_ctr3.text)
              )
            );
            Get.back();
          }, child: const Text('Create'))
        ],
      ),
    );
  }
}