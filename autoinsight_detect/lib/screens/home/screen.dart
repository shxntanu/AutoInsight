import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controllerList = List.generate(8, (_) => TextEditingController());
  final _colorList = List<Color>.filled(8, Colors.grey);

  @override
  void dispose() {
    _controllerList.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Colorable Circular Outline'),
      ),
      body: Center(
        child: Stack(
          children: [
            CustomPaint(
              painter: CircularOutlinePainter(_colorList),
              size: Size(200, 200),
            ),
            // Positioned.fill(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       for (var i = 0; i < _controllerList.length; i++)
            //         Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: TextField(
            //             controller: _controllerList[i],
            //             decoration: InputDecoration(
            //               hintText: 'Color $i',
            //             ),
            //             onChanged: (value) {
            //               setState(() {
            //                 _colorList[i] =
            //                     value.isNotEmpty ? Color(int.parse(value, radix: 16)) : Colors.grey;
            //               });
            //             },
            //           ),
            //         ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class CircularOutlinePainter extends CustomPainter {
  final List<Color> colorList;

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
