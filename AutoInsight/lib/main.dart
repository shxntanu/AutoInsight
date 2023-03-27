import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/landing_screen.dart';
import 'screens/home_screen.dart';

void main() => runApp(const AutoInsight());

class AutoInsight extends StatelessWidget {
  const AutoInsight({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'San Francisco'
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegistrationScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
