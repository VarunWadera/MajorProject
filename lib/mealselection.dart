import 'package:flutter/cupertino.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:nutrical/dashboard.dart';
import 'package:nutrical/main.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String food = 'samosa';

class MealSelection extends StatefulWidget {
  @override
  _MealSelectionState createState() => _MealSelectionState();
}

class _MealSelectionState extends State<MealSelection> {
  int _currentIndex = 2;
  Widget updateTemplate() {
    return FutureBuilder(
      future: getapi(),
      builder: (context, snapshot) {
        Map content = snapshot.data;
        return (snapshot.hasData)
            ? GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: content.length,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        ((MediaQuery.of(context).size.height / 100) /
                            (MediaQuery.of(context).size.width / 30))),
                itemBuilder: (context, index) {
                  return content['to'] > index
                      ? Container(
                          margin: EdgeInsets.all(
                              MediaQuery.of(context).size.height / 44),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                  color: Colors.black45, width: 1.6)),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                margin: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.height / 44,
                                    right:
                                        MediaQuery.of(context).size.height / 44,
                                    top:
                                        MediaQuery.of(context).size.height / 44,
                                    bottom: MediaQuery.of(context).size.height /
                                        35),
                                height: MediaQuery.of(context).size.height / 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(
                                        color: Colors.black45, width: 1.6)),
                                child: Image.network(
                                  '${content['hits'][index]['recipe']['image']}',
                                ),
                              ),
                              Text(
                                '${content['hits'][index]['recipe']['label']}',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 44),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width / 25),
                                child: Row(
                                  children: <Widget>[
                                    Image.asset(
                                      'images/fire.png',
                                      height: 20,
                                      width: 20,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                50),
                                    Text(
                                        '${content['hits'][index]['recipe']['calories'].toStringAsFixed(1)}',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w600)),
                                    Spacer(),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              44,
                                      width: MediaQuery.of(context).size.width /
                                          11,
                                      decoration: BoxDecoration(
                                          color: Colors.orange[800],
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Center(
                                        child: GestureDetector(
//                      onTap: ,
                                          child: Text(
                                            'Add',
                                            style: TextStyle(
                                                fontSize: 11.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      : Container();
                })
            : Container();
      },
    );
  }

  Future<Map> getapi() async {
    String api =
        'https://api.edamam.com/search?q=$food&app_id=75d5e385&app_key=33b2e0fb1a2bf76c6b927a16482e1cf2&from=0&to=3&calories=591-722&health=alcohol-free#';

    http.Response response = await http.get(api);
    return json.decode(response.body);
  }

  void get() async {
    Map data = await getapi();
    print(data.toString());
  }

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade, child: Dashboard()));
          }
          if (index == 2) {
            print("clicked");
          }
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 18),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.orange[900],
                  Colors.orange,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
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
                    'Meal Selection',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
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
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 32,
                left: MediaQuery.of(context).size.width / 15,
                right: MediaQuery.of(context).size.width / 15,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 17.5,
                    width: MediaQuery.of(context).size.width / 1.6,
                    child: TextField(
                      onChanged: (value) {
                        food = value;
                      },
                      style: TextStyle(fontSize: 23.0),
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: 'Search',
                          hintStyle: TextStyle(fontSize: 23.0),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.deepOrange,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.2),
                              borderRadius: BorderRadius.circular(25.0))),
                    ),
                  ),
                  Icon(
                    Icons.hourglass_full,
                    color: Colors.deepOrange,
                    size: 30.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/meal_plan');
                    },
                    child: Icon(
                      Icons.sort,
                      color: Colors.deepOrange,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),
            updateTemplate(),
          ],
        ),
      ),
    );
  }
}
