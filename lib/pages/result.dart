import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/const/style.dart';
import 'package:EnQ/pages/history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Result extends StatelessWidget {
  final int score;
  final int total;
  const Result({Key key, @required this.score, @required this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/winner_1.png'),
            Center(
              child: Text(
                'Your Result',
                style: Script2Style,
              ),
            ),
            Center(
              child: Text(
                '$score / $total',
                style: Script2Style,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonTheme(
                  minWidth: 100.0,
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => History()));
                    },
                    child: Text(
                      'Review',
                      style: TabsStyle,
                    ),
                    textColor: Colors.black,
                    color: Colors.white,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
                ButtonTheme(
                  minWidth: 100.0,
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Quiz',
                      style: TabsStyle,
                    ),
                    textColor: Colors.black,
                    color: Colors.white,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
