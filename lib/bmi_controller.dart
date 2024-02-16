import 'package:get/get.dart';

class BMIController extends GetxController {
  var height = 0.0.obs;
  var weight = 0.0.obs;
  var bmiResult = 0.0.obs;

  void calculateBMI() {
    if (height.value > 0 && weight.value > 0) {
      double heightInMeters = height.value / 100;
      bmiResult.value = weight.value / (heightInMeters * heightInMeters);
    } else {
      bmiResult.value = 0.0;
    }
  }
}
