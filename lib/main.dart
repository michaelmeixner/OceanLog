import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const OceanLogApp());
}

class OceanLogApp extends StatelessWidget {
  const OceanLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OceanLog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
