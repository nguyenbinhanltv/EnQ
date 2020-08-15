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
            padding: const EdgeInsets.all(DefaultPaddin * 3 / 100),
            child: Container(
              child: Text('EnQ', style: TitleStyle),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: DefaultPaddin / 2,
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
