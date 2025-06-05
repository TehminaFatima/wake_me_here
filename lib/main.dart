import 'package:flutter/material.dart';

void main() {
  runApp(const WakeMeHereApp());
}

class WakeMeHereApp extends StatelessWidget {
  const WakeMeHereApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wake Me Here',
    );
  }
}
