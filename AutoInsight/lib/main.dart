import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/landing_screen.dart';

void main() => runApp(const AutoInsight());

class AutoInsight extends StatelessWidget {
  const AutoInsight({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
