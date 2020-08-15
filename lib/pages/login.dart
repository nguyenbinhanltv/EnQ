import 'package:EnQ/const/size_config.dart';
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
    SizeConfig().init(context);
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: DefaultPaddin * 1.5,
              top: DefaultPaddin * 4,
            ),
            child: Container(
              child: Text('EnQ', style: TitleStyle),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: DefaultPaddin * 0.8,
              top: DefaultPaddin * 10,
              right: DefaultPaddin * 6,
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: DefaultPaddin),
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
              // height: MediaQuery.of(context).size.height,
              // color: Colors.indigo,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: SizeConfig.screenWidth * 0.7,
                  height: SizeConfig.screenHeight * 0.08,
                  child: FlatButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(color: Colors.black)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.ac_unit),
                        Text(
                          'Sign in with Google',
                          style: TextStyle(fontSize: MediumText),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
