import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const Farm2MarketApp());
}

class Farm2MarketApp extends StatelessWidget {
  const Farm2MarketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 114, 154, 104),
      ),
      home: const SplashScreen(),
    );
  }
}
