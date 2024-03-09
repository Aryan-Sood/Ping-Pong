import 'package:flutter/material.dart';
import 'package:ping_pong/providers/color_provider.dart';
import 'package:ping_pong/screens/game.dart';
import 'package:ping_pong/screens/home.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (context) => ColorProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ping Pong',
      home: Scaffold(
        body: Home(),
      ),
      routes: {
        '/game': (context) => GameScreen(),
      },
    );
  }
}
