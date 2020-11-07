import 'package:EnQ/models/leader.dart';
import 'package:EnQ/models/user.dart';
import 'package:EnQ/components/build_sub_leaders.dart';
import 'package:EnQ/components/top_leader.dart';
import 'package:EnQ/const/size_config.dart';
import 'package:flutter/material.dart';
import 'package:EnQ/const/style.dart';

class ShowLeaders extends StatelessWidget {
  const ShowLeaders({Key key, @required this.subLeaders, @required this.leader})
      : super(key: key);

  final List<User> subLeaders;
  final Leader leader;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: SizeConfig.screenHeight * 0.35,
            margin: EdgeInsets.only(top: DefaultPaddin * 0.5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: DefaultPaddin * 4.0),
                  child: TopLeader(
                      'assets/images/silver-cup.svg',
                      leader.users[1].userName,
                      leader.users[1].point.toString(),
                      leader.users[1].photoUrl),
                ),
                TopLeader(
                    'assets/images/gold-cup.svg',
                    leader.users[0].userName,
                    leader.users[0].point.toString(),
                    leader.users[0].photoUrl),
                Padding(
                  padding: const EdgeInsets.only(top: DefaultPaddin * 5.0),
                  child: TopLeader(
                      'assets/images/bronze-cup.svg',
                      leader.users[2].userName,
                      leader.users[2].point.toString(),
                      leader.users[2].photoUrl),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: subLeaders.length,
                itemBuilder: (BuildContext context, int index) =>
                    BuildSubLeaders(user: subLeaders[index])),
          ),
        ],
      ),
    );
  }
}
