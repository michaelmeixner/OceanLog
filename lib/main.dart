import 'package:flutter/material.dart';

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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OceanLog')),
      body: const Center(child: Text('Welcome to OceanLog! 🌊')),
    );
  }
}
