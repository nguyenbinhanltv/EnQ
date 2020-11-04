import 'package:EnQ/const/style.dart';
import 'package:EnQ/utils/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:EnQ/services/auth_service.dart';

class LoginButton extends StatelessWidget {
  final String _title;
  final String _imgUrl;
  final String _type;
  final Function isLogin;
  LoginButton(this._title, this._imgUrl, this._type, this.isLogin);
  AuthService auth = new AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        minWidth: double.infinity,
        height: 60,
        onPressed: () {
          this.isLogin();
          if (this._type == 'GG') {
            auth.handleSignIn().whenComplete(
                  () => Future.delayed(
                    Duration(seconds: 1),
                    () =>
                        Navigator.of(context).popAndPushNamed(AppRouting.home),
                  ),
                );
          } else {
            Navigator.of(context).popAndPushNamed(AppRouting.home);
          }
        },
        color: Colors.grey[100],
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  fontWeight: FontWeight.w200),
            ),
            // Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
