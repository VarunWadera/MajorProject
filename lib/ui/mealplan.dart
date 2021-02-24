import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:calendar_strip/calendar_strip.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:nutrical/model/ml.dart' as ml;

//yaml
//curved_navigation_bar: ^0.3.1
//calendar_strip: ^1.0.6

PickedFile imageFile;
File imgFile;
final ImagePicker _picker = ImagePicker();

class Mealplan extends StatefulWidget {
  @override
  _MealplanState createState() => _MealplanState();
}

class _MealplanState extends State<Mealplan> {
  _openGallery() async {
    var picture = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      imageFile = picture;
      imgFile = File(imageFile.path);
      // imgFile = imageFile.path
    });
    //Navigator.of(context).pop();
  }

  _openCamera() async {
    var picture = await _picker.getImage(source: ImageSource.camera);
    setState(() {
      imageFile = picture;
      imgFile = File(imageFile.path);
    });
    // Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Choose From'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: FlatButton.icon(
                      onPressed: () => _openGallery(),
                      icon: Icon(
                        Icons.camera_roll,
                        color: Colors.red,
                      ),
                      label: Text('Gallery'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: FlatButton.icon(
                      onPressed: () => _openCamera(),
                      icon: Icon(Icons.camera_front, color: Colors.blue),
                      label: Text('Camera'),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: AnimatedNavigatorBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.orange[900], Colors.orange],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              height: MediaQuery.of(context).size.height / 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Meal Plan',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('images/bitemoji.jpg'),
                    radius: 40.0,
                  )
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 25),
              height: MediaQuery.of(context).size.height / 6,
              child: CalendarStripe(),
            ),
            Container(
//              color: Colors.yellow,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / 65,
                horizontal: MediaQuery.of(context).size.width / 18,
              ),
              height: MediaQuery.of(context).size.height / 12,
              child: Text(
                'Sunday, 30 JUL',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.black54,
                    child: CircleAvatar(
                        radius: 19.0,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.red,
                          ),
                          onPressed: () {
//                            _showChoiceDialog(context);
                            Navigator.pushNamed(context, '/ml');
                          },
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.black54,
                    child: CircleAvatar(
                        radius: 19.0,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: Icon(
                            Icons.list,
                            color: Colors.red,
                          ),
                          onPressed: () {},
                        )),
                  ),
                ),
              ],
            ),
            MealInfo(
              time: 'BREAKFAST',
              name: 'Berry Blast Acai Bowl',
              cal: 90,
              img: 'bowl.png',
            ),
            MealInfo(
              time: 'LUNCH',
              name: 'Berry Blast Acai Bowl',
              cal: 145,
              img: 'bowl.png',
            ),
            MealInfo(
              time: 'DINNER',
              name: 'Rice with Roasted Potato and milk',
              cal: 275,
              img: 'bowl.png',
            ),
          ],
        ),
      ),
    );
  }
}

class MealInfo extends StatelessWidget {
  MealInfo({
    this.name,
    this.time,
    this.img,
    this.cal,
  });
  final String name;
  final String time;
  final String img;
  final int cal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 18,
        right: MediaQuery.of(context).size.width / 18,
      ),
      height: MediaQuery.of(context).size.height / 5,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '$time',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black45),
              ),
              GestureDetector(
//                onTap: ,
                child: Container(
                  child: Icon(
                    Icons.edit,
                    color: Colors.black26,
                  ),
                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.width / 15,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.orange[200]),
                ),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 48),
          Row(
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height / 11,
                  width: MediaQuery.of(context).size.width / 6,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38, width: 1.1),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Image.asset(
                    'images/$img',
                    fit: BoxFit.contain,
                  )),
              SizedBox(width: MediaQuery.of(context).size.width / 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$name',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 86),
                  Row(
                    children: <Widget>[
                      Image.asset(
                        'images/fire.png',
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width / 50),
                      Text(
                        '$cal',
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class CalendarStripe extends StatelessWidget {
  dateTileBuilder(
      date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    Color fontColor = isDateOutOfRange ? Colors.black26 : Colors.black87;
    TextStyle normalStyle =
        TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: fontColor);
    TextStyle selectedStyle = TextStyle(
        fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black87);
    TextStyle dayNameStyle = TextStyle(fontSize: 14.5, color: fontColor);
    List<Widget> _children = [
      Text(dayName, style: dayNameStyle),
      SizedBox(
        height: 15.0,
      ),
      Text(date.day.toString(),
          style: !isSelectedDate ? normalStyle : selectedStyle),
    ];

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
      decoration: BoxDecoration(
        color: !isSelectedDate ? Colors.transparent : Colors.orange[200],
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children: _children,
      ),
    );
  }

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  onSelect(data) {
    print("Selected Date -> $data");
  }

  @override
  Widget build(BuildContext context) {
    return CalendarStrip(
      addSwipeGesture: true,
      startDate: startDate,
      endDate: endDate,
      selectedDate: selectedDate,
      dateTileBuilder: dateTileBuilder,
      onDateSelected: onSelect,
    );
  }
}

class AnimatedNavigatorBar extends StatefulWidget {
  @override
  _AnimatedNavigatorBarState createState() => _AnimatedNavigatorBarState();
}

class _AnimatedNavigatorBarState extends State<AnimatedNavigatorBar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.white,
      color: Colors.orange[200],
      buttonBackgroundColor: Colors.orange[100],
      height: MediaQuery.of(context).size.height / 17,
      index: 2,
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
    );
  }
}
