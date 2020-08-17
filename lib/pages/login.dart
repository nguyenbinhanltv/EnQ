import 'package:EnQ/components/login_button.dart';
import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/const/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              right: DefaultPaddin * 7.0,
              bottom: DefaultPaddin * 25.0,
            ),
            child: SvgPicture.asset(
              'assets/images/logo-noname.svg',
              width: SizeConfig.screenWidth,
              color: Colors.brown,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: DefaultPaddin * 2.0,
              top: DefaultPaddin * 12.0,
              right: DefaultPaddin * 6.0,
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: DefaultPaddin),
              child: Text(
                'Welcome to EnQ, it will help you improve your English',
                style: ScriptStyle,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              'assets/images/background-login.svg',
              alignment: Alignment.center,
              width: SizeConfig.screenWidth,
              // height: MediaQuery.of(context).size.height,
              color: Colors.indigo,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: DefaultPaddin * 12.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginButton('Sign in with Google',
                      'assets/images/brands-and-logotypes.svg'),
                  SizedBox(height: DefaultPaddin),
                  LoginButton(
                      'Sign in with Facebook', 'assets/images/facebook.svg'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
