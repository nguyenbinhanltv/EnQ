import 'package:EnQ/const/style.dart';
import 'package:EnQ/pages/categories.dart';
import 'package:EnQ/pages/home.dart';
import 'package:EnQ/pages/leader_board.dart';
import 'package:EnQ/pages/profile.dart';
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
      debugShowCheckedModeBanner: false,
      routes: {
        AppRouting.home: (context) => Home(),
        AppRouting.login: (context) => Login(),
        AppRouting.leaderBoard: (context) => LeaderBoard(),
        AppRouting.categories: (context) => Categories(),
        AppRouting.profile: (context) => Profile(),
      },
      // home: Home(),
      initialRoute: AppRouting.login,
    );
  }
}
