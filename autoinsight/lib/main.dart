import 'package:autoinsight/screens/navigationbarScreens/profile_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/onboarding/signup_page.dart';
import '../screens/camera_page/camera_page.dart';
import '../screens/car_screen/car_screen.dart';
import '../screens/dashboard/homescreen.dart';
import '../screens/dashboard/components/newtrip.dart';
import '../screens/videolist_screen/list_page.dart';

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
      // home: SignUpPage(),
      home: HomeScreen(),
      getPages: [
        GetPage(name: '/', page: () => SignUpPage()),
        GetPage(name: '/camera', page: () => const CameraPage()),
        GetPage(name: '/car', page: () => const CarScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/profile',  page: () => const Profile_Page()),
        GetPage(name: '/newtrip', page: () => const New_trip()),
        GetPage(name: '/videolist', page: () => VideoList()),
      ],
    );
  }
}