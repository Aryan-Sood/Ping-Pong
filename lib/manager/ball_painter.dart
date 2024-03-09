import 'package:flutter/material.dart';

class BallPainter extends CustomPainter {
  final double ballX;
  final double ballY;
  final String color;

  BallPainter(this.ballX, this.ballY, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    String fixedColor = color;
    Color ballColor = Colors.red;
    switch (fixedColor) {
      case 'Red':
        ballColor = Colors.red;
        break;
      case 'Blue':
        ballColor = Colors.blue;
        break;
      case 'Green':
        ballColor = Colors.green;
        break;
      case 'Orange':
        ballColor = Colors.orange;
        break;
    }
    Paint paint = Paint()..color = ballColor;
    canvas.drawCircle(Offset(ballX, ballY), 20, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
