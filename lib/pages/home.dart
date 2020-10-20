import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/pages/profile.dart';
import 'package:EnQ/services/auth_service.dart';
import 'package:EnQ/utils/app_route.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

enum BottomIcons { Home, Leader, Quiz, Profile }

class _Home extends State<Home> {
  BottomIcons bottomIcons = BottomIcons.Home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bottomIcons = BottomIcons.Home;
                      });
                    },
                    child: bottomIcons == BottomIcons.Home
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.indigo.shade100.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 8,
                              bottom: 8,
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  EvaIcons.home,
                                  color: Colors.indigo,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Home",
                                  style: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        : Icon(EvaIcons.home),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bottomIcons = BottomIcons.Leader;
                      });
                    },
                    child: bottomIcons == BottomIcons.Leader
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.indigo.shade100.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 8,
                              bottom: 8,
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  EvaIcons.barChartOutline,
                                  color: Colors.indigo,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Leader",
                                  style: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        : Icon(EvaIcons.barChartOutline),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bottomIcons = BottomIcons.Quiz;
                      });
                    },
                    child: bottomIcons == BottomIcons.Quiz
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.indigo.shade100.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 8,
                              bottom: 8,
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  EvaIcons.listOutline,
                                  color: Colors.indigo,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Quiz",
                                  style: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        : Icon(EvaIcons.listOutline),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bottomIcons = BottomIcons.Profile;
                      });
                    },
                    child: bottomIcons == BottomIcons.Profile
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.indigo.shade100.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 8,
                              bottom: 8,
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  EvaIcons.personOutline,
                                  color: Colors.indigo,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Profile",
                                  style: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        : Icon(EvaIcons.personOutline),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
