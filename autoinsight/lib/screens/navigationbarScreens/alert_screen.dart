import 'package:flutter/material.dart';

import '../../utils/alert_card.dart';
import '../../utils/alertcard_separator.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFFFF7171),title: const Text('Alerts'),),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardSeparator(label: "TODAY",),
              const AlertCard(icon: Icons.car_crash_rounded, title: "Car Damage", subtitle: "Possible car damage detected."),
              const AlertCard(icon: Icons.dangerous, title: "Forceful Opening", subtitle: "Attempt at forcefully opening car door."),
              const AlertCard(icon: Icons.car_crash_rounded, title: "Stranger Alert", subtitle: "Possible stranger detected."),
              CardSeparator(label: "WITHIN ONE WEEK"),
              const AlertCard(icon: Icons.location_off_rounded , title: "Device left behind", subtitle: "Device has possibly been mislocated."),
              const AlertCard(icon: Icons.check , title: "Good Driving", subtitle: "Great driving today."),
              CardSeparator(label: "THIS MONTH"),
              const AlertCard(icon: Icons.minor_crash_rounded , title: "Near miss", subtitle: "You got too close to another vehicle."),
            ],
          ),
        ),
      ),
    );
  }
}