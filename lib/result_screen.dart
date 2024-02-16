import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String bmiResult;

  ResultScreen(this.bmiResult);

  @override
  Widget build(BuildContext context) {
    String resultCategory = getCategory(double.parse(bmiResult));

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULT'),
        backgroundColor: Color(0xFF6E8AC9),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your BMI is: $bmiResult',style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0),),
            ),
            SizedBox(height: 16),
            Text('You are $resultCategory',style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: getCategoryColor(resultCategory),
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the BMI calculator screen
              },
              child: Text('RECALCULATE',style: TextStyle(
      color: Colors.white,),
              ),
              style: ElevatedButton.styleFrom(
      primary: Color.fromARGB(255, 131, 127, 127),),
              
            ),
          ],
        ),
      ),
    );
  }

  String getCategory(double bmi) {
    if (bmi < 16) {
      return 'Severe Undernourishment';
    } else if (bmi >= 16 && bmi < 16.9) {
      return 'Medium Undernourishment';
    } else if (bmi >= 17 && bmi < 18.4) {
      return 'Slight Undernourishment';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal Nutrition State';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight';
    } else if (bmi >= 30 && bmi < 39.9) {
      return 'Obesity';
    } else {
      return 'Pathological Obesity';
    }
  }

   Color getCategoryColor(String category) {
    switch (category) {
      case 'Severe Undernourishment':
        return Colors.red; //  color for Severe Undernourishment
      case 'Medium Undernourishment':
        return Colors.orange; //  color for Medium Undernourishment
      case 'Slight Undernourishment':
        return Colors.yellow; //  color for Slight Undernourishment
      case 'Normal Nutrition State':
        return Colors.green; //  color for Normal Nutrition State
      case 'Overweight':
        return Colors.yellow; // color for Overweight
      case 'Obesity':
        return Colors.orange; //  color for Obesity
      case 'Pathological Obesity':
        return Colors.red; //  color for Pathological Obesity
      default:
        return Colors.black; // Default color
    }
  }
}
