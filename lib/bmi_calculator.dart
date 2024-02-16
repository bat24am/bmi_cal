import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bmi_controller.dart';
import 'result_screen.dart'; // Import the new ResultScreen

/// Widget for the BMI Calculator screen.
class BMICalculator extends StatelessWidget {
 /// Controller for managing BMI calculations.
  final BMIController bmiController = Get.put(BMIController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xFF6E8AC9), // Set the app bar color to gray
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) =>
                   bmiController.height.value = double.tryParse(value) ?? 0,
  keyboardType: TextInputType.numberWithOptions(decimal: true),
  decoration: InputDecoration(labelText: 'Height (cm)'),
    
  ),
            SizedBox(height: 16),
            TextField(
              onChanged: (value) =>
    bmiController.weight.value = double.tryParse(value) ?? 0,
  keyboardType: TextInputType.numberWithOptions(decimal: true),
  decoration: InputDecoration(labelText: 'Weight (kg)'),
  ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                bmiController.calculateBMI();
                _showBMIResult(context); // Pass context to navigate
              },
              child: Text('CALCULATE',style: TextStyle(
      color: Colors.white,),
              ),
              style: ElevatedButton.styleFrom(
      primary: Color.fromARGB(255, 231, 8, 8),),
            ),
            SizedBox(height: 40),
            Obx(() =>
                Text('Previous Result: ${bmiController.bmiResult.toStringAsFixed(2)}',style: TextStyle(fontSize: 14,
      color: Color.fromARGB(255, 0, 0, 0),),)),
          ],
        ),
      ),
    );
  }

  /// Shows the BMI result using GetX.
  ///
  /// Displays a snackbar if the input is invalid; otherwise,
  /// calculates BMI and navigates to the result screen.
 
  void _showBMIResult(BuildContext context) {
  if (bmiController.height.value <= 0 || bmiController.weight.value <= 0) {
    
    Get.snackbar(
      'Invalid Input',
      'Please enter valid height and weight.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  } else {
   /// Valid input, calculate BMI and navigate to the result screen
    bmiController.calculateBMI();
    Get.to(ResultScreen(bmiController.bmiResult.value.toStringAsFixed(2)));
  }
}
}