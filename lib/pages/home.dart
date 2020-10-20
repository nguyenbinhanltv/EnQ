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

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Icon(EvaIcons.home),
                Icon(EvaIcons.barChartOutline),
                Icon(EvaIcons.listOutline),
                Icon(EvaIcons.personOutline),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
