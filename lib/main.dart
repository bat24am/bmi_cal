import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bmi_calculator.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BMI CALCULATOR',
      home: BMICalculator(),
    );
  }
}
