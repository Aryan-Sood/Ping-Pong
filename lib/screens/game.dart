import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin {
  late double centerX;
  late double centerY;
  double dx = 4; // Horizontal speed
  double dy = 4; // Vertical speed

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1300),
    )..repeat(reverse: true);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        centerX = MediaQuery.of(context).size.width / 2;
        centerY = MediaQuery.of(context).size.height / 2;
      });
      startGameLoop();
    });
  }

  void startGameLoop() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        centerX += dx;
        centerY += dy;
        checkBoundary();
      });
      startGameLoop();
    });
  }

  void checkBoundary() {
    if (centerX >= MediaQuery.of(context).size.width - 20 || centerX <= 20) {
      dx = -dx; // Reverse direction on hitting the horizontal boundaries
    }
    if (centerY >= MediaQuery.of(context).size.height - 20 || centerY <= 20) {
      dy = -dy; // Reverse direction on hitting the vertical boundaries
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromRGBO(94, 174, 174, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomPaint(
              painter: BallPainter(centerX, centerY),
              size: Size.infinite,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _animationController.value,
                    child: const Text("Touch to Play",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class BallPainter extends CustomPainter {
  final double ballX;
  final double ballY;

  BallPainter(this.ballX, this.ballY);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.red;
    canvas.drawCircle(Offset(ballX, ballY), 20, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
