import 'package:bmi_plus/pages/control.dart';
import 'package:bmi_plus/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BmiPlus());
}

class BmiPlus extends StatelessWidget {
  const BmiPlus({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
