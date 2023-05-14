import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

import '../../controllers/circle_controller.dart';

final circleCtr = Get.put(circleController());

class CarScreen extends StatefulWidget {
  @override
  _CarScreenState createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Car Go Brr'),
      ),
      body: Center(
        child: Stack(
            children: [
             GetBuilder<circleController>(
                init: circleCtr,
                builder: (circleCtr) => CustomPaint(
                  painter: CircularOutlinePainter(circleCtr.colors),
                  size: const Size(200, 200),
                ),
              ),
            ],
          ),
      ),
    );
  }
}

class CircularOutlinePainter extends CustomPainter {
  final RxList<Color> colorList;

  CircularOutlinePainter(this.colorList);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width , size.height );

    final sweepAngle = 2 * pi / colorList.length;

    var startAngle = -pi / 2; // Start at the top

    for (var i = 0; i < colorList.length; i++) {
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5
        ..color = colorList[i];
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(CircularOutlinePainter oldDelegate) {
    return true;
  }
}
