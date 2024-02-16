import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bmi_calculator.dart';

/// The main entry point for the BMI Calculator application.
void main() {
  runApp(MainApp());
}
/// The main application widget that initializes GetMaterialApp.
class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BMI CALCULATOR',
      home: BMICalculator(),
    );
  }
}
