import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ping_pong/manager/ball_painter.dart';
import 'package:ping_pong/manager/slider_painter.dart';
import 'package:ping_pong/providers/color_provider.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin {
  late double centerX;
  late double centerY;
  double dx = 12; // Horizontal speed
  double dy = 12; // Vertical speed

  bool started = false;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1300),
    )..repeat(reverse: true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        centerX = MediaQuery.of(context).size.width / 2;
        centerY = MediaQuery.of(context).size.height / 2;
      });
      startGameLoop();
    });
  }

  void startGameLoop() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
    String color = Provider.of<ColorProvider>(context).getColor();
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            started = true;
          });
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromRGBO(94, 174, 174, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              started
                  ? Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: CustomPaint(
                                  painter: BallPainter(centerX, centerY, color),
                                  size: Size(double.infinity, double.infinity),
                                ),
                              ),
                              Expanded(
                                child: CustomPaint(
                                  painter: SliderPainter(),
                                  size: Size(double.infinity, double.infinity),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  : AnimatedBuilder(
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
            ],
          ),
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
