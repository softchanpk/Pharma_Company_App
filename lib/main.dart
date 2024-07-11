import 'package:flutter/material.dart';
import 'package:sc_pharma_app/views/login.dart';
import 'package:sc_pharma_app/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pharma App',

      home: SplashScreen() );
  }
}

