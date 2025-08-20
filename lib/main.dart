import 'package:flutter/material.dart';
import 'package:three_min_for_god/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '3 Min for God',
      home: const SplashScreen(),
    );
  }
}