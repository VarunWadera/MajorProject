import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:nutrical/model/BMI_Cal.dart' as bmical;

class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  int bmi = 0;
  String c = '';

  @override
  void initState() {
    super.initState();

    bmi = bmical.bmicalculation(bmical.height, bmical.weight).toInt();
    c = bmical.classes(bmi);
  }

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
                'BMI',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500),
              )),
            ),
            Container(
                margin: EdgeInsets.only(top: 30.0),
                child: SfRadialGauge(
                    enableLoadingAnimation: true,
                    animationDuration: 2000,
                    axes: <RadialAxis>[
                      RadialAxis(minimum: 0, maximum: 60, ranges: <GaugeRange>[
                        GaugeRange(
                            startValue: 0,
                            endValue: 19,
                            color: Colors.green[200]),
                        GaugeRange(
                            startValue: 19, endValue: 24, color: Colors.green),
                        GaugeRange(
                            startValue: 24, endValue: 29, color: Colors.orange),
                        GaugeRange(
                            startValue: 29,
                            endValue: 39,
                            color: Colors.red[300]),
                        GaugeRange(
                            startValue: 39, endValue: 60, color: Colors.red),
                      ], pointers: <GaugePointer>[
                        NeedlePointer(value: bmi.toDouble())
                      ], annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            widget: Container(
                                child: Text('$bmi\nBMI',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold))),
                            angle: 90,
                            positionFactor: 0.5)
                      ])
                    ])),
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 5.0),
              child: Row(
                children: [
                  Text(
                    '${bmical.wl}\n\tlbs',
                    style: TextStyle(fontSize: 30.0, color: Colors.black45),
                  ),
                  Spacer(),
                  Text(
                    '${bmical.wk}\n \tkg',
                    style: TextStyle(fontSize: 30.0, color: Colors.black45),
                  ),
                ],
              ),
            ),
            Text(
              'Class',
              style: TextStyle(fontSize: 35.0, color: Colors.black45),
            ),
            Text(
              c,
              style: TextStyle(fontSize: 30.0, color: Colors.black45),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/dashboard', (route) => false);
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
        )),
      ),
    );
  }
}
