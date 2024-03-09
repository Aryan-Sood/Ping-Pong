import 'package:flutter/material.dart';
import 'package:ping_pong/screens/game.dart';
import 'package:ping_pong/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ping Pong',
      home: Home(),
      routes: {
        '/game': (context) => GameScreen(),
      },
    );
  }
}
