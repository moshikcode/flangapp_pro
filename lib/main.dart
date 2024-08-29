import 'package:flangapp_pro/views/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flangapp PRO',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.withOpacity(0.5)),
        useMaterial3: true,
      ),
      home: const Splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}