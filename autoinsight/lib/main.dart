import 'package:autoinsight/screens/navigationbarScreens/alert_screen.dart';
import 'package:autoinsight/screens/navigationbarScreens/profile_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../screens/onboarding/signup_page.dart';
import '../screens/camera_page/camera_page.dart';
import '../screens/car_screen/car_screen.dart';
import '../screens/dashboard/homescreen.dart';
import '../screens/dashboard/components/newtrip.dart';
import '../screens/videolist_screen/list_page.dart';
import '../screens/onboarding/start_screen.dart';

import '../firebase_options.dart';

late final bool loggedin;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // await prefs.clear();
  loggedin = prefs.getBool("logged_in") ?? false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      title: 'AutoInsight',
      theme: ThemeData(
        fontFamily: 'San Francisco',
      ),
      // home: SignUpPage(),
      home: loggedin ? HomeScreen() : StartScreen(),
      getPages: [
        GetPage(name: '/', page: () => SignUpPage()),
        GetPage(name: '/camera', page: () => const CameraPage()),
        GetPage(name: '/car', page: () => const CarScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/newtrip', page: () => New_trip()),
        GetPage(name: '/videolist', page: () => VideoList()),
        GetPage(name: '/alerts', page: () => const Alertscreen()),
      ],
    );
  }
}