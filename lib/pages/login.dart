import 'package:EnQ/const/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(70.0),
            child: Container(
              child: Text('EnQ', style: TitleStyle),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              top: 200.0,
              right: 130.0,
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                  'Welcome to EnQ, it will help you improve your English',
                  style: ScriptStyle),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              'assets/background-login.svg',
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              // color: Colors.indigo,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignInButton(
                  Buttons.Google,
                  onPressed: () {},
                ),
                SignInButton(
                  Buttons.Facebook,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
