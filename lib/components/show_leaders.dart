import 'package:EnQ/models/leader.dart';
import 'package:EnQ/components/build_sub_leaders.dart';
import 'package:EnQ/components/top_leader.dart';
import 'package:EnQ/const/size_config.dart';
import 'package:flutter/material.dart';
import 'package:EnQ/const/style.dart';

// ignore: must_be_immutable
class ShowLeaders extends StatelessWidget {
  ShowLeaders({Key key, @required this.leader}) : super(key: key);

  final Leader leader;

  List<dynamic> subLeader = [];

  void generateMissingLeaders() {
    for (int i = this.leader.users.length; i < 10; i++) {
      this.leader.users.add(Leader.leaderDay.users[i]);
    }
    generateSubLeaders();
  }

  void generateSubLeaders() {
    for (int i = 3; i < 10; i++) {
      subLeader.add(this.leader.users[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    generateMissingLeaders();
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
                      leader.users[1]['displayName'].toString().length <= 10
                          ? leader.users[1]['displayName']
                          : leader.users[1]['displayName']
                              .toString()
                              .substring(0, 11),
                      leader.users[1]['point'].toString(),
                      leader.users[1]['photoURL']),
                ),
                TopLeader(
                    'assets/images/gold-cup.svg',
                    leader.users[0]['displayName'].toString().length <= 10
                        ? leader.users[0]['displayName']
                        : leader.users[0]['displayName']
                            .toString()
                            .substring(0, 11),
                    leader.users[0]['point'].toString(),
                    leader.users[0]['photoURL']),
                Padding(
                  padding: const EdgeInsets.only(top: DefaultPaddin * 5.0),
                  child: TopLeader(
                      'assets/images/bronze-cup.svg',
                      leader.users[2]['displayName'].toString().length <= 10
                          ? leader.users[2]['displayName']
                          : leader.users[2]['displayName']
                              .toString()
                              .substring(0, 11),
                      leader.users[2]['point'].toString(),
                      leader.users[2]['photoURL']),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) =>
                    BuildSubLeaders(user: subLeader[index], index: index + 4)),
          ),
        ],
      ),
    );
  }
}
