import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/onboarding/signup_page.dart';
import '../screens/camera_page/camera_page.dart';
import '../screens/camera_page/video_page.dart';

import '../firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      title: 'AutoInsight',
      home: SignUpPage(),
      getPages: [
        GetPage(name: '/', page: () => SignUpPage()),
        GetPage(name: '/camera', page: () => const CameraPage()),
      ],
    );
  }
}