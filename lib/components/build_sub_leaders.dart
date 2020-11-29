import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/const/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildSubLeaders extends StatelessWidget {
  final dynamic user;
  final int index;
  const BuildSubLeaders({Key key, this.user, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: SizeConfig.screenWidth,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
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
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(index.toString()),
                    CircleAvatar(
                      backgroundImage: NetworkImage(user['photoURL']),
                    ),
                    SizedBox(
                      width: DefaultPaddin * 4,
                      child: Text(
                        user['displayName'],
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Text(user['point'].toString()),
                    SvgPicture.asset('assets/images/arrow_forward.svg'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
