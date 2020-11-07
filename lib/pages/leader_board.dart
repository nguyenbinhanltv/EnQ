import 'package:EnQ/const/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:EnQ/models/leader.dart';
import 'package:EnQ/models/user.dart';
import 'package:EnQ/components/show_leaders.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  List<User> subLeadersMonth = [];
  List<User> subLeadersWeek = [];
  void generateSubLeaders() {
    print(leaderMonth.users.length);
    for (int i = 3; i < leaderMonth.users.length; i++) {
      subLeadersMonth.add(leaderMonth.users[i]);
      subLeadersWeek.add(leaderWeek.users[i]);
    }
  }

  @override
  void initState() {
    generateSubLeaders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/images/military_tech.svg'),
              )
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
              ShowLeaders(subLeaders: subLeadersWeek, leader: leaderWeek),
              ShowLeaders(
                subLeaders: subLeadersMonth,
                leader: leaderMonth,
              ), // another tabs
            ],
          ),
        ),
      ),
    );
  }
}
