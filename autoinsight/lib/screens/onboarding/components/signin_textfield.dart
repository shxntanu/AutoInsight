import 'package:flutter/material.dart';

class SignIn_TextField extends StatelessWidget {

  const SignIn_TextField(
        {
          required this.icon,
          required this.hintText,
          required this.textType,
          required this.obscureText, 
          required this.controller
        }
      );

  final IconData icon;
  final String hintText;
  final TextInputType textType;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      //margin: EdgeInsets.only(top: 20),
      color: const Color(0xFFF2F2F2),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: textType,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: const Color(0xFF03045E),
            ),
            hintText: ' $hintText',
            hintStyle: const TextStyle(color: Colors.grey)),
      ),
    );
  }
}