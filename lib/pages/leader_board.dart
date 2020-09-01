import 'package:EnQ/components/top_leader.dart';
import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/const/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:EnQ/models/leader.dart';
import 'package:EnQ/models/user.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text('Leader Board', style: ScriptStyle),
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/images/arrow_back.svg',
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: <Widget>[
            SvgPicture.asset('assets/images/military_tech.svg')
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
            tabs: [
              Tab(
                child: Text('This week', style: TabsStyle),
              ),
              Tab(
                child: Text('All time', style: TabsStyle),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: DefaultPaddin * 0.6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: DefaultPaddin * 4.0),
                        child: TopLeader(
                            'assets/images/silver-cup.svg',
                            Leader.leaders[1].userName,
                            Leader.leaders[1].point.toString(),
                            Leader.leaders[1].photoUrl),
                      ),
                      TopLeader(
                          'assets/images/gold-cup.svg',
                          Leader.leaders[0].userName,
                          Leader.leaders[0].point.toString(),
                          Leader.leaders[0].photoUrl),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: DefaultPaddin * 5.0),
                        child: TopLeader(
                            'assets/images/bronze-cup.svg',
                            Leader.leaders[2].userName,
                            Leader.leaders[2].point.toString(),
                            Leader.leaders[2].photoUrl),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: DefaultPaddin * 13.5),
                  height: SizeConfig.screenHeight * 0.5,
                  width: SizeConfig.screenWidth,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: Leader.subLeaders.length,
                    itemBuilder: (BuildContext context, int index) =>
                        BuildSubLeaders(user: Leader.subLeaders[index]),
                  ),
                ),
              ],
            ),
            Stack(), // another tabs
          ],
        ),
      ),
    );
  }
}

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
