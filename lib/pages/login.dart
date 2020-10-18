import 'dart:async';

import 'package:EnQ/components/login_button.dart';
import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/const/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                      top: 80,
                    ),
                    child: Text("EnQ"),
                  ),
                  Text("We will help improve your English"),
                ],
              ),
            ),
            Container(
              child: Center(
                child: Image.asset("assets/images/login.jpg"),
              ),
            ),
            Container(
              child: Text("Let's get started"),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 35,
                    ),
                    child: SvgPicture.asset(
                      "assets/images/google.svg",
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 35,
                    ),
                    child: SvgPicture.asset(
                      "assets/images/facebook.svg",
                      width: 50,
                      height: 50,
                    ),
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
