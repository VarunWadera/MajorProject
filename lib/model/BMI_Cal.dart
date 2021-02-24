import 'package:flutter/material.dart';

int weight = 0,wk=0,wl=0;
int height = 0;
bool isweight = true;

double bmicalculation(int h, int w){
  if (isweight) {
    return w/(0.0001 * h*h);
  }
  else{
    return (0.453592 * w)/(0.0001 * h*h);
  }
}

String classes(int bmi)
{
  if(bmi<19)
    return 'Low BMI';
  else if(bmi>=19 && bmi<=24)
    return 'Normal';
  else if (bmi>24 && bmi<=29)
    return 'Overweight';
  else if (bmi>30 && bmi<=39)
    return 'Obesity';
  else if (bmi>40)
    return 'Severe obesity';

}


void weightconvert(int w)
{
  if (isweight) {
    wk = w;
    wl = (w * 2.20462).toInt();
  }
  else{
    wl = w;
    wk = (w * 0.453592).toInt();
  }

}