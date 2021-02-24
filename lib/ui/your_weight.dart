import 'package:flutter/material.dart';
import 'package:flutter_fluid_slider/flutter_fluid_slider.dart';
import 'package:nutrical/model/BMI_Cal.dart' as bmical;

class Your_Weight extends StatefulWidget {
  @override
  _Your_WeightState createState() => _Your_WeightState();
}

class _Your_WeightState extends State<Your_Weight> {
  DateTime _dateTime;
  String dob = 'Date';

  double weight = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFF07030),
                        Color(0xFFED8F2F),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                child: Center(
                    child: Text(
                  'Weight Class',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500),
                )),
              ),

              Container(
                margin: EdgeInsets.only(right: 20, top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            bmical.isweight = true;
                          });
                        },
                        child: Text(
                          'Kg',
                          style: TextStyle(
                              fontSize: 20.0,
                              decoration: (bmical.isweight)
                                  ? TextDecoration.underline
                                  : null),
                        )),
                    SizedBox(
                      width: 20.0,
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            bmical.isweight = false;
                          });
                        },
                        child: Text(
                          'lbs',
                          style: TextStyle(
                              fontSize: 20.0,
                              decoration: (bmical.isweight)
                                  ? null
                                  : TextDecoration.underline),
                        ))
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(90.0, 150.0, 100, 0.0),
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Colors.orange)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.calendar_today,
                        size: 25.0,
                        color: Colors.orange,
                      ),
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: _dateTime == null
                                    ? DateTime.now()
                                    : _dateTime,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(3000))
                            .then((date) {
                          setState(() {
                            _dateTime = date;
                            dob = _dateTime.toString().substring(0, 11);
                          });
                        });
                      },
                    ),
                    Text(
                      dob,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 30.0,
              ),

              // weights is kgs or lbs
              (bmical.isweight)
                  ? Container(
                      margin: EdgeInsets.all(30.0),
                      child: FluidSlider(
                        value: weight,
                        onChanged: (double newValue) {
                          setState(() {
                            weight = newValue;
                            bmical.weight = newValue.round();
                          });
                        },
                        min: 0.0,
                        max: 100.0,
                        sliderColor: Colors.orange,
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.all(30.0),
                      child: FluidSlider(
                        value: weight,
                        onChanged: (double newValue) {
                          setState(() {
                            weight = newValue;
                            bmical.weight = newValue.round();
                          });
                        },
                        min: 0.0,
                        max: 220.0,
                        sliderColor: Colors.orange,
                      ),
                    ),

              GestureDetector(
                onTap: () {
                  print(bmical.weight);
                  bmical.weightconvert(bmical.weight);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/your_height', (route) => false);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  padding: EdgeInsets.only(right: 10.0, bottom: 20.0),
                  height: MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width * 0.20,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.circular(100.0),
                    color: Colors.orange,
                  ),
                  child: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                    size: 80.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
