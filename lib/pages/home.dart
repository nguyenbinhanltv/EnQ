import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/components/bottom_bar.dart';
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
                  BottomBar(
                    onPressed: () {
                      bottomIcons = BottomIcons.Home;
                    },
                    bottomIcons: bottomIcons == BottomIcons.Home ? true : false,
                    text: "Home",
                    icons: EvaIcons.home,
                  ),
                  BottomBar(
                    onPressed: () {
                      bottomIcons = BottomIcons.Leader;
                    },
                    bottomIcons:
                        bottomIcons == BottomIcons.Leader ? true : false,
                    text: "Leader",
                    icons: EvaIcons.barChartOutline,
                  ),
                  BottomBar(
                    onPressed: () {
                      bottomIcons = BottomIcons.Quiz;
                    },
                    bottomIcons: bottomIcons == BottomIcons.Quiz ? true : false,
                    text: "Quiz",
                    icons: EvaIcons.listOutline,
                  ),
                  BottomBar(
                    onPressed: () {
                      bottomIcons = BottomIcons.Profile;
                    },
                    bottomIcons:
                        bottomIcons == BottomIcons.Profile ? true : false,
                    text: "Profile",
                    icons: EvaIcons.personOutline,
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
