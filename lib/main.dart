import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutrical/dashboard.dart';
import 'package:nutrical/mealselection.dart';
import 'package:nutrical/ui/bmi.dart';
import 'package:nutrical/ui/mealplan.dart';
import 'package:nutrical/ui/your_height.dart';
import 'package:nutrical/ui/your_weight.dart';
import 'package:nutrical/model/ml.dart';
import 'mealselection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/your_weight',
      routes: {
        '/your_weight': (context) => Your_Weight(),
        '/your_height': (context) => Your_Height(),
        '/bmi': (context) => BMI(),
        '/dashboard': (context) => Dashboard(),
        '/meal_selection': (context) => MealSelection(),
        '/meal_plan': (context) => Mealplan(),
        '/ml': (context) => TfliteHome(),
      },
    );
  }
}
