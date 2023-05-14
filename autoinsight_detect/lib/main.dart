import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:autoinsight_detect/screens/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Car Detect',
      home: LoginPage(),
    );
  }
}