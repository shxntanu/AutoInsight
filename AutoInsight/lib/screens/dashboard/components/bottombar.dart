import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBarButton extends StatelessWidget {
  late final IconData icon;
  late final String tip;

  BottomBarButton({required this.icon, required this.tip});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 45,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: FloatingActionButton(
          onPressed: () {},
          tooltip: tip,
          hoverColor: Colors.black,
          backgroundColor: Color(0xFFFFFFFF),
          child: Icon(
            icon,
            size: 33,
            color: Color(0xFF03045E),
          ),
        ),
      ),
    );
  }
}
