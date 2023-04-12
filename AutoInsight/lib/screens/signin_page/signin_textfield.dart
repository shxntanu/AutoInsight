import 'package:flutter/material.dart';

class SignIn_TextField extends StatelessWidget {
  SignIn_TextField(
      {required this.icon,
      required this.hintText,
      required this.textType,
      required this.obscureText});

  final IconData icon;
  final String hintText;
  final TextInputType textType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Card(
      //margin: EdgeInsets.only(top: 20),
      color: Color(0xFFF2F2F2),
      child: TextField(
        obscureText: obscureText,
        keyboardType: textType,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Color(0xFF03045E),
            ),
            hintText: ' $hintText',
            hintStyle: TextStyle(color: Colors.grey)),
      ),
    );
  }
}
