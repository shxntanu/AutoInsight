import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../controllers/user_controller.dart';

final _userCtr = Get.put(userController());
final firestore = FirebaseFirestore.instance;
CollectionReference<Map<String, dynamic>> coords = firestore.collection("users").doc(_userCtr.getEmail).collection("coords");

const brightGreen = Color(0xFF00FF00);

class circleController extends GetxController {

  RxList<Color> colors = <Color>[
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
  ].obs;

  StreamSubscription<QuerySnapshot>? _coordsSubscription;

  @override
  void onInit() async {
    await _subscribeToCoords();
    super.onInit();
  }

  Future<void> _subscribeToCoords() async {
    _coordsSubscription = coords.snapshots().listen(
      (snapshot) async {
        if (snapshot.docs.isNotEmpty) {
          QuerySnapshot<Map<String, dynamic>> snapshot = await coords
          .orderBy('timestamp', descending: true) // Assuming you have a 'timestamp' field in your documents
          .limit(1)
          .get();

          final latestDoc = snapshot.docs[0].reference;
          final data = await latestDoc.get();
          final updatedColors = <Color>[];

          for (int i = 0; i < 8; i++) {
            final colorValue = data["$i"] == 0 ? Colors.grey : Colors.green;
            updatedColors.add(colorValue);
          }

          colors.assignAll(updatedColors);
          update();
        }
      }
    );
  }
}