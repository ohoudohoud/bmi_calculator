import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/StartUp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartUp(),
    );
  }
}
