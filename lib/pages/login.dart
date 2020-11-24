import 'package:EnQ/components/login_button.dart';
import 'package:EnQ/const/style.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loginFlag = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "EnQ",
                      style: TitleStyle,
                    ),
                    Text(
                      "We will help you improve your English",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                          fontFamily: FontName),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/login.jpg'),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        LoginButton(
                            'Sign in with Google',
                            'assets/images/google.svg',
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
