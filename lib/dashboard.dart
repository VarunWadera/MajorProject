import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutrical/mealselection.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wave_progress_widget/wave_progress_widget.dart';

class Dashboard extends StatelessWidget {
  int _currentIndex = 0;

  var _progressWaterLog = 50.0;
  String name = 'James';
  int burnedCal = 625;
  int consumedCal = 1200;
  List<Widget> workoutlist = [
    WorkoutCards(activity: 'Running', cal: '125', time: '80'),
    WorkoutCards(activity: 'Weight Lifting', cal: '425', time: '30'),
    WorkoutCards(activity: 'Rope Skipping', cal: '250', time: '20'),
    WorkoutCards(activity: 'Running', cal: '125', time: '80'),
    WorkoutCards(activity: 'Rope Skipping', cal: '250', time: '20'),
    WorkoutCards(activity: 'Running', cal: '125', time: '80'),
    WorkoutCards(activity: 'Weight Lifting', cal: '425', time: '30'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.orange[200],
        buttonBackgroundColor: Colors.orange[100],
        height: 52.0,
        index: _currentIndex,
        animationDuration: Duration(
          milliseconds: 200,
        ),
        animationCurve: Curves.bounceInOut,
        items: <Widget>[
          Icon(Icons.home, size: 34, color: Colors.deepOrange),
          Icon(Icons.directions_run, size: 34, color: Colors.deepOrange),
          Icon(Icons.local_dining, size: 34, color: Colors.deepOrange),
          Icon(Icons.fitness_center, size: 34, color: Colors.deepOrange),
          Icon(Icons.person, size: 34, color: Colors.deepOrange),
        ],
        onTap: (index) {
          if (index == 0) {
            print("clicked");
          }
          if (index == 2) {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade, child: MealSelection()));
          }
        },
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Welcome',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '$name',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('images/bitemoji.jpg'),
                          radius: 40.0,
                        )
                      ],
                    ),
                  ),
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0)),
                    gradient: LinearGradient(
                        colors: [Colors.orange[900], Colors.orange],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                  ),
                ),
                //Calorie Card
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 5.4,
                      left: MediaQuery.of(context).size.width / 12),
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange[500],
                        blurRadius: 3.0, // soften the shadow
                        spreadRadius: 3.0, //extend the shadow
                        offset: Offset(
                          1.0, // Move to right 10  horizontally
                          2.0, // Move to bottom 5 Vertically
                        ),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              height: MediaQuery.of(context).size.height / 19,
                              width: MediaQuery.of(context).size.width / 15,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.orange[300],
                              ),
                              child: Icon(
                                Icons.fastfood,
                                color: Colors.white,
                              )),
                          Text(
                            '$consumedCal',
                            style: TextStyle(fontSize: 22),
                          ),
                          Text(
                            'Consumed',
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),
                      CircularPercentIndicator(
                        radius: MediaQuery.of(context).size.width / 4,
                        lineWidth: 10.0,
                        animation: true,
                        animationDuration: 1500,
                        percent: 0.7,
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: Colors.deepOrange,
                        center: new Container(
                          height: MediaQuery.of(context).size.height / 9.5,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.deepOrange,
                                offset: Offset(1.0, 1.0), //(x,y)
                                blurRadius: 11.0,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '1065',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Calories Left',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              height: MediaQuery.of(context).size.height / 19,
                              width: MediaQuery.of(context).size.width / 15,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.orange[300],
                              ),
                              child: Icon(
                                Icons.fitness_center,
                                color: Colors.white,
                              )),
                          Text(
                            '$burnedCal',
                            style: TextStyle(fontSize: 22),
                          ),
                          Text(
                            'Burned',
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
//              color: Colors.red,
              width: double.infinity,
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.width / 20),
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 20),
              height: MediaQuery.of(context).size.width / 4.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Meal Planning',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  WeekStrip()
                ],
              ),
            ),
            MealTimingCard(
              whichMeal: 'Breakfast',
              timing: '8.00',
              food: 'Avacado heaven',
              backcolor: Color(0xFFCEF9BA),
            ),
            MealTimingCard(
              whichMeal: 'Lunch',
              timing: '12.00',
              food: 'Grilled chicken',
              backcolor: Color(0xFFFCD0BF),
            ),
            MealTimingCard(
              whichMeal: 'Dinner',
              timing: '8.00',
              food: 'Grilled Potato',
              backcolor: Color(0xFFEDCCEB),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 60,
                  horizontal: MediaQuery.of(context).size.width / 20),
              child: Row(
                children: <Widget>[
                  Text(
                    'Workout',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  FlatButton(
//                    onPressed: ,
                    child: Container(
                      child: Text(
                        'View More',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      height: 20.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  )
                ],
              ),
            ),
            Container(
//                color: Colors.yellow,
              height: MediaQuery.of(context).size.height / 5,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: workoutlist,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 40,
                  horizontal: MediaQuery.of(context).size.width / 20),
              child: Row(
                children: <Widget>[
                  Text(
                    'Water Intake',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      WaveProgress(160.0, Colors.blue, Colors.lightBlue,
                          _progressWaterLog),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.blue),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 40,
                          ),
                          GestureDetector(
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.blue),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            'You have consumed',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            '${_progressWaterLog.round() * 10} ml',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeekStrip extends StatelessWidget {
  Color func(int day) {
    DateTime date = DateTime.now();
    if (date.weekday == day) {
      return Colors.deepOrange;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Mon',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w600, color: func(1)),
        ),
        Text(
          'Tue',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w600, color: func(2)),
        ),
        Text(
          'Wed',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w600, color: func(3)),
        ),
        Text(
          'Thu',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w600, color: func(4)),
        ),
        Text(
          'Fri',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w600, color: func(5)),
        ),
        Text(
          'Sat',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w600, color: func(6)),
        ),
        Text(
          'Sun',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w600, color: func(7)),
        ),
      ],
    );
  }
}

class MealTimingCard extends StatelessWidget {
  MealTimingCard({this.whichMeal, this.timing, this.food, this.backcolor});

  final String whichMeal;
  final String timing;
  final String food;
  final Color backcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height / 5.5,
      child: Row(
        children: <Widget>[
          Container(
//            color: Colors.red,
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width / 3.5,
            child: Column(
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height / 60),
                Text(
                  '$whichMeal',
                  style: TextStyle(fontSize: 20.0, color: Colors.grey),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 17),
                Text(
                  '$timing',
                  style: TextStyle(fontSize: 20.0, color: Colors.grey),
                )
              ],
            ),
          ),
          Container(
//            color: Colors.yellow,
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width / 1.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height / 35),
                Container(
                  height: 1.5,
                  width: MediaQuery.of(context).size.width / 1.4,
                  color: Colors.grey,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 40,
                    horizontal: MediaQuery.of(context).size.width / 20,
                  ),
                  height: MediaQuery.of(context).size.height / 12,
                  width: MediaQuery.of(context).size.width / 1.6,
                  decoration: BoxDecoration(
                      color: backcolor,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Text(
                    '$food',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class WorkoutCards extends StatelessWidget {
  WorkoutCards({this.activity, this.time, this.cal});
  final String activity;
  final String time;
  final String cal;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.all(20.0),
      height: double.infinity,
      width: MediaQuery.of(context).size.width / 2.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
            colors: [Colors.orange[900], Colors.orange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                '$activity',
                style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w800),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                '$time mins',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '$cal kcal',
                style: TextStyle(color: Colors.white, fontSize: 19),
              )
            ],
          ),
        ],
      ),
    );
  }
}
