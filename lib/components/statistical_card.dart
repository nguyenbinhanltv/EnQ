import 'package:EnQ/const/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StatisticalCard extends StatelessWidget {
  final String _url, _text, _score;

  const StatisticalCard(this._url, this._text, this._score);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(
        width: SizeConfig.screenWidth * 0.4,
        height: 65.0, // are we need to fix it turn to dynamic?
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              this._url,
              width: 24.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(this._text),
                Text(
                  this._score,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
