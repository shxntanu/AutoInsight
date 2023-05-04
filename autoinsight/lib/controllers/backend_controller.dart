import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../controllers/user_controller.dart';
import '../models/user_model.dart';

final _userCtr = Get.put(userController());
final _firestoreInstance = FirebaseFirestore.instance;

class backendController extends GetxController {
  Future<void> createUser(String email, String pass, String name, String phone, String address, String carName, String carYear, String licencePlate) async {
    final userData = User(
      email: email,
      password: pass,
      name: name,
      phone: phone,
      address: address,
      carName: carName,
      carYear: carYear,
      licencePlate: licencePlate
    );
    _userCtr.setUser(userData);
    await _firestoreInstance.collection("users").doc(email).collection("user_data").doc("user_info").set(userData.toMap());
  }
}