import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sc_pharma_app/views/expense_recorder.dart';
import 'package:sc_pharma_app/views/login.dart';
import 'package:sc_pharma_app/views/splash_screen.dart';
import 'package:sc_pharma_app/views/tag_location_screen.dart';
import 'package:sc_pharma_app/views/visit.dart';
import 'package:sc_pharma_app/views/visit_schduele.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pharma App',

      home: SplashScreen() );
  }
}

