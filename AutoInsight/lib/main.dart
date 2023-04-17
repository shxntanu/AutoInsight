import 'package:autoinsight/screens/dashboard/homescreen.dart';
import 'package:autoinsight/screens/onboarding/new_landing_screen.dart';
import 'package:flutter/material.dart';

import 'screens/test_screen/test_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/landing_screen.dart';
import 'screens/home_screen.dart';
import 'screens/PullUpLandingScreen.dart';
import 'screens/og_landing_page.dart';
import 'screens/signin_page/signin_page.dart';
import 'screens/onboarding/new_landing_screen.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

void main() => runApp(const AutoInsight());

class AutoInsight extends StatelessWidget {
  const AutoInsight({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'San Francisco'),
      initialRoute: '/',
      routes: {
        '/': (context) =>
            const TestScreen(), // Starting screen to view different screens
        '/landing': (context) =>
            const LandingScreen(), // Circular Design landing screen
        '/login': (context) =>
            const LoginScreen(), // Circular Design login screen
        '/register': (context) =>
            const RegistrationScreen(), // Circular Design Registration screen
        '/home': (context) => HomeScreen(), // Unfinished home page
        '/new': (context) =>
            NewLandingScreen(), // New Landing screen (from the sample app) that we're building
        '/og': (context) => const OGEntryPage(), // Original landing screen
        '/pullup': (context) =>
            const PullUpLandingScreen(), // Pull Up Landing Screen
        '/signin': (context) => SignInPage(),
        '/dashboard': (context) => FinalHomeScreen(), // New Sign In Page
      },
    );
  }
}
