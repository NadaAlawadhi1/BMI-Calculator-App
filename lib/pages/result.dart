import 'dart:math';

import 'package:bmi_plus/colors.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  int height;
  int weight;
  bool isFemale;
  ResultPage(
      {super.key,
      required this.height,
      required this.weight,
      required this.isFemale});

  @override
  Widget build(BuildContext context) {
    double bmiCalc = weight / pow(height / 100, 2);
    String result = "";

    // Use if-else statements instead of switch for range checking
    if (bmiCalc < 16) {
      result = "Severe thinness";
    } else if (bmiCalc < 18.5) {
      result = "Underweight";
    } else if (bmiCalc < 25) {
      result = "Normal";
    } else if (bmiCalc < 30) {
      result = "Overweight";
    } else {
      result = "Obese";
    }
    return Scaffold(
      backgroundColor: isFemale ? KRedColor : KBlueColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "BMI is ",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              bmiCalc.toStringAsFixed(1),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 5),
            Text(
              result,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 5),
            IconButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous screen
              },
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
