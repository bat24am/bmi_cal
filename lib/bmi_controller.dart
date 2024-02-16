import 'package:get/get.dart';

/// Controller for managing BMI calculations.
class BMIController extends GetxController {
  /// Observable variable representing the height of the user in centimeters.
  var height = 0.0.obs;
 /// Observable variable representing the weight of the user in kilograms.
  var weight = 0.0.obs;
 /// Observable variable representing the result of the BMI calculation.
  var bmiResult = 0.0.obs;

/// Calculate BMI based on the provided height and weight.
  ///
  /// The BMI formula is BMI = weight / (height * height), where height is in meters.
  /// This method updates the [bmiResult] variable with the calculated BMI.
  ///
  /// If either [height] or [weight] is not greater than 0, [bmiResult] is set to 0.0.
  void calculateBMI() {
    if (height.value > 0 && weight.value > 0) {
      double heightInMeters = height.value / 100;
      bmiResult.value = weight.value / (heightInMeters * heightInMeters);
    } else {
      bmiResult.value = 0.0;
    }
  }
}
