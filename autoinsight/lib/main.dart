import 'package:autoinsight/screens/onboarding/login_page/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../screens/dashboard/homescreen.dart';

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
  await prefs.clear();
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
      home: loggedin ? HomeScreen() : LoginPage(),
    );
  }
}