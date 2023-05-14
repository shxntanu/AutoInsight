import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../controllers/user_controller.dart';

final _userCtr = Get.put(userController());

final _firestore = FirebaseFirestore.instance;
const brightGreen = Color(0xFF00FF00);

class circleController extends GetxController {
  // ignore: prefer_final_fields
  RxList _colors = [].obs;
  RxList get getColors => _colors;

  Future<void> getColorsFromDB() async {
    final email = _userCtr.getEmail;
    final colors = await _firestore.collection("users").doc(email).collection("coords").doc();
  }
}