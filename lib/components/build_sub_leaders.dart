import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/const/style.dart';
import 'package:EnQ/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildSubLeaders extends StatelessWidget {
  final User user;
  const BuildSubLeaders({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: SizeConfig.screenWidth * 0.9,
          height: 50,
          margin: EdgeInsets.only(top: DefaultPaddin * 0.75),
          child: RaisedButton(
            onPressed: () {},
            color: Colors.white,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DefaultPaddin * 2),
              side: BorderSide(
                color: Colors.black54,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(user.rank.toString()),
                CircleAvatar(
                  backgroundImage: AssetImage(user.photoUrl),
                ),
                SizedBox(
                  width: DefaultPaddin * 4,
                  child: Text(
                    user.userName,
                    textAlign: TextAlign.left,
                  ),
                ),
                Text(user.point.toString()),
                SvgPicture.asset('assets/images/arrow_forward.svg'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
