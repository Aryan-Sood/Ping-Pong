import 'package:flutter/material.dart';

class SliderPainter extends CustomPainter {
  BuildContext context;

  SliderPainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    final totalWidth = MediaQuery.of(context).size.width;
    final totalHeight = MediaQuery.of(context).size.height;

    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..strokeWidth = 3;

    final Path path = Path();
    path.addRect(Rect.fromCenter(
        center: Offset(totalWidth / 2, totalHeight - 15),
        width: 100,
        height: 5));

    // final Path path = Path()
    //   ..moveTo(totalWidth / 2, totalHeight / 2)
    //   ..lineTo((totalWidth / 2) + 100, totalHeight / 2)
    //   ..arcTo(
    //       Rect.fromCircle(
    //           center: Offset((totalWidth / 2) + 100, (totalHeight / 2) + 10),
    //           radius: 8),
    //       0,
    //       45,
    //       true);
    // canvas.drawCircle(Offset(totalWidth / 2, totalHeight / 2), 30, paint);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
