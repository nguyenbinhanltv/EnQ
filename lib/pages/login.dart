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
  // StreamController<bool> loginFlag = new StreamController();
  bool loginFlag = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: DefaultPaddin * 0.8),
            child: SvgPicture.asset(
              'assets/images/logo-noname.svg',
              width: SizeConfig.screenWidth,
              color: Colors.black,
              alignment: Alignment.topRight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: DefaultPaddin * 2.0,
              top: DefaultPaddin * 14.0,
              right: DefaultPaddin * 6.0,
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: DefaultPaddin),
              child: TypewriterAnimatedTextKit(
                repeatForever: false,
                isRepeatingAnimation: true,
                text: ['Welcome to EnQ, it will help you improve your English'],
                textStyle: ScriptStyle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: DefaultPaddin * 15.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginButton(
                      'Sign in with Google',
                      'assets/images/brands-and-logotypes.svg',
                      'GG',
                      () => setState(() => loginFlag = !loginFlag)),
                  SizedBox(height: DefaultPaddin),
                  LoginButton(
                      'Sign in with Facebook',
                      'assets/images/facebook.svg',
                      'FB',
                      () => setState(() => loginFlag = !loginFlag)),
                ],
              ),
            ),
          ),
          Visibility(
              visible: loginFlag,
              child: Container(
                alignment: Alignment.center,
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight,
                color: Colors.white,
                child: SpinKitWanderingCubes(
                  color: Colors.blueAccent,
                  size: SizeConfig.screenWidth / 2,
                ),
              ))
        ],
      ),
    );
  }
}
