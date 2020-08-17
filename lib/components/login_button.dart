import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/const/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginButton extends StatelessWidget {
  final String _title;
  final String _imgUrl;
  LoginButton(this._title, this._imgUrl);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.7,
      height: SizeConfig.screenHeight * 0.08,
      child: FlatButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(color: Colors.black)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              this._imgUrl,
              width: 24.0,
              height: 24.0,
            ),
            Text(
              this._title,
              style: TextStyle(
                fontSize: SmallText,
                fontFamily: FontName,
              ),
            ),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
