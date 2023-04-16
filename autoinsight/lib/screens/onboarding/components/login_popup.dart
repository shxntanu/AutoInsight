import 'package:flutter/material.dart';

class Login_PopUp extends StatelessWidget {
  const Login_PopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      backgroundColor: Colors.white,
      title: Text('Login'),
    );
  }
}