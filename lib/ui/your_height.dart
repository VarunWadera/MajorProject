import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutrical/model/height_slider.dart';
import 'package:nutrical/model/BMI_Cal.dart' as bmical;

class Your_Height extends StatefulWidget {
  @override
  _Your_HeightState createState() => _Your_HeightState();
}

class _Your_HeightState extends State<Your_Height> {
  int height = 170;

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
                'Your Height',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500),
              )),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 30.0, bottom: 0.0, left: 10.0, right: 30.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.80,
              child: HeightSlider(
                height: height,
                onChange: (val) => setState(() {
                  height = val;
                  bmical.height = val;
                }),
              ),
            ),
            Divider(
              thickness: 2.0,
              indent: 50.0,
              endIndent: 50.0,
              color: Colors.black54,
            ),
            Positioned(
              top: 600.0,
              child: GestureDetector(
                onTap: () {
                  print(bmical.height);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/bmi', (route) => false);
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
            ),
          ],
        )),
      ),
    );
  }
}
