import 'package:get/get.dart';
import '../models/user_model.dart';

class userController extends GetxController {

  late User _user;

  String get getEmail => _user.email;
  String get getPassword => _user.password;
  String get getPhone => _user.phone;

  void setUser(User user) {
    _user = user;
    update();
  }
}