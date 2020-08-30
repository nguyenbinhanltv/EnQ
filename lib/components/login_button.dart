import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/const/style.dart';
import 'package:EnQ/utils/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginButton extends StatelessWidget {
  final String _title;
  final String _imgUrl;
  LoginButton(this._title, this._imgUrl);

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    return user;
  }

  // Future _handleSignOut() async {
  //   await _auth.signOut();
  //   await _googleSignIn.signOut();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.7,
      height: SizeConfig.screenHeight * 0.08,
      child: FlatButton(
        onPressed: () {
          _handleSignIn().whenComplete(
              () => Navigator.of(context).popAndPushNamed(AppRouting.home));
        },
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
