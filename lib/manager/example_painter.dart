import 'package:flutter/material.dart';

class ExamplePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    Path path = Path();
    path.lineTo(size.width, size.height);
    canvas.drawColor(Colors.pink, BlendMode.color);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
