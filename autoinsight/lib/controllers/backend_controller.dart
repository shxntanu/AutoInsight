import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    await _firestoreInstance.collection("users").doc(email).collection("coords").doc("temp").set(
      {
        "0": 0,
        "1": 0,
        "2": 0,
        "3": 0,
        "4": 0,
        "5": 0,
        "6": 0,
        "7": 0,
      }
    );
  }

  Future<dynamic> login( String email, String pass ) async {
    final user = await _firestoreInstance.collection("users").doc(email).collection("user_data").doc("user_info").get();
    if (user.exists) {
      final userData = User.fromMap(user.data() as Map<String, dynamic>);
      _userCtr.setUser(userData);
      final _prefs = await SharedPreferences.getInstance();
      await _prefs.setBool("logged_in", true);
      await _prefs.setString("email", email);
      await _prefs.setString("password", pass);
      await _prefs.setString("name", userData.name);
      await _prefs.setString("phone", userData.phone);
      await _prefs.setString("address", userData.address);
      await _prefs.setString("carName", userData.carName);
      await _prefs.setString("carYear", userData.carYear);
      await _prefs.setString("licencePlate", userData.licencePlate);
      
      return true;
    } else {
      return false;
    }
  }
}