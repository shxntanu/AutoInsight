import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../onboarding/login_page.dart';
import '../onboarding/signup_page.dart';

//import '../dashboard/components/new_trip.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'AutoInsight',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF6D6D),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(SignUpPage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6D6D),
                ),
                child: const Text('Sign Up'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(LoginPage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6D6D),
                ),
                child: const Text('Log In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
