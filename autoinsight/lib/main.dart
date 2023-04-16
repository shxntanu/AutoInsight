import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/onboarding/signin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AutoInsight',
      home: const SignInPage(),
      getPages: [
        GetPage(name: '/', page: () => const SignInPage()),

      ],
    );
  }
}