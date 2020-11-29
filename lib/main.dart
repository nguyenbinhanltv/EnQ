import 'package:EnQ/const/style.dart';
import 'package:EnQ/pages/history.dart';
import 'package:EnQ/pages/leader_board.dart';
import 'package:EnQ/pages/home.dart';
import 'package:EnQ/utils/app_route.dart';
import 'package:flutter/material.dart';
import 'package:EnQ/pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: FontName,
            ),
      ),
      debugShowCheckedModeBanner: true,
      routes: {
        AppRouting.login: (context) => Login(),
        // ignore: missing_required_param
        AppRouting.leaderBoard: (context) => LeaderBoard(),
        AppRouting.history: (context) => History(),
        // ignore: missing_required_param
        AppRouting.home: (context) => Home()
      },
      // home: Home(),
      initialRoute: AppRouting.login,
    );
  }
}
