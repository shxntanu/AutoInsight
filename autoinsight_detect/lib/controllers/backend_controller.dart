import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../controllers/user_controller.dart';
import '../models/user_model.dart';

final _userCtr = Get.put(userController());
final _firestoreInstance = FirebaseFirestore.instance;

class backendController extends GetxController {

  Future<dynamic> login( String email, String pass ) async {
    final user = await _firestoreInstance.collection("users").doc(email).collection("user_data").doc("user_info").get();
    if (user.exists) {
      final userData = User.fromMap(user.data() as Map<String, dynamic>);
      _userCtr.setUser(userData);
      return true;
    } else {
      return false;
    }
  }
}