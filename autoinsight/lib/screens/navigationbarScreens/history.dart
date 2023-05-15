import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../controllers/user_controller.dart';
import '../../utils/colors.dart';

final firestore = FirebaseFirestore.instance;
final _userCtr = Get.put(userController());

class CarTest extends StatefulWidget {
  @override
  State<CarTest> createState() => _CarTestState();
}

class _CarTestState extends State<CarTest> {

  Map<String, dynamic> dataMap = 
  {
    "0" : 0,
    "1" : 0,
    "2" : 0,
    "3" : 0,
    "4" : 0,
    "5" : 0,
    "6" : 0,
    "7" : 0,
    "timestamp" : FieldValue.serverTimestamp(),
  };

  List<bool> _switchValues = List.generate(8, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Test'),
        backgroundColor: accentOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
            for (int i = 0; i < 8; i++)
              CupertinoSwitch(
              // This bool value toggles the switch.
              value: _switchValues[i],
              activeColor: CupertinoColors.activeGreen,
              onChanged: (bool value) {
                dataMap[i.toString()] = value ? 1 : 0;
                setState(() {
                  _switchValues[i] = value ;
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                firestore.collection('users').doc(_userCtr.getEmail).collection('coords').add(dataMap);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

