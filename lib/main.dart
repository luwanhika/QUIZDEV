import 'package:flutter/material.dart';
import 'splash/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz-Care',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}