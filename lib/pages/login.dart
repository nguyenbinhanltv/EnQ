import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            padding: const EdgeInsets.only(
              left: 70.0, // will replace later
              top: 75.0, // will replace later
            ),
            child: Text(
              'EnQ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
                fontSize: 60.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 40.0, // will replace later
              top: 200.0, // will replace later
              right: 120.0, // will replace later
            ),
            child: Text(
              'Welcome to EnQ, it will help you improve your English',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
                fontSize: 20.0, // will replace later
              ),
              textAlign: TextAlign.left,
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
        ],
      ),
    );
  }
}
