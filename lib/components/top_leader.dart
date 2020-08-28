import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/const/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopLeader extends StatelessWidget {
  final String _rankUrl, _text, _point, _picUrl;
  TopLeader(this._rankUrl, this._text, this._point, this._picUrl);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          this._rankUrl,
          width: SizeConfig.screenWidth * 0.1,
        ),
        SizedBox(height: DefaultPaddin * 0.2),
        Container(
          width: DefaultPaddin * 3.0,
          height: DefaultPaddin * 3.0,
          child: CircleAvatar(
            backgroundImage: AssetImage(this._picUrl),
          ),
        ),
        SizedBox(height: DefaultPaddin * 0.3),
        Text(this._text), //note
        Text(this._point),
      ],
    );
  }
}
