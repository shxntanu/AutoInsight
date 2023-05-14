import 'dart:ui';

import 'package:flutter/cupertino.dart';

class CustomTheme {
  const CustomTheme();

  static const Color loginGradientStart = Color.fromARGB(255, 239, 220, 220);
  static const Color loginGradientEnd = Color.fromARGB(255, 240, 87, 87);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
    Color.fromARGB(255, 240, 87, 87),
    Color.fromARGB(255, 252, 125, 108),
    Color.fromARGB(255, 248, 154, 114),
    Color.fromARGB(255, 246, 187, 169),
    Color.fromARGB(255, 239, 220, 220)
    ]
  );
}