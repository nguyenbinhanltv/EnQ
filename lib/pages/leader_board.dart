import 'package:EnQ/const/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:EnQ/models/leader.dart';
import 'package:EnQ/models/user.dart';
import 'package:EnQ/components/show_leaders.dart';

class LeaderBoard extends StatefulWidget {
  final Future<Leader> leadersDay;
  final Future<Leader> leadersWeek;
  final String uidCurrentUser;
  LeaderBoard(
      {Key key,
      @required this.uidCurrentUser,
      @required this.leadersDay,
      @required this.leadersWeek});

  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  List<User> subLeadersDay = [];
  List<User> subLeadersWeek = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // generateSubLeaders();
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
                child: Text('Week', style: TabsStyle),
              ),
              Tab(
                child: Text('Day', style: TabsStyle),
              ),
            ],
          ),
        ),
        body: FutureBuilder(
            future: Future.wait([widget.leadersDay, widget.leadersWeek]),
            builder:
                (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.hasData) {
                return TabBarView(
                  children: [
                    // problem here
                    // Text('${snapshot.data[1].users}'),
                    // Text('${snapshot.data[0].users}'),
                    ShowLeaders(leader: snapshot.data[1]),
                    ShowLeaders(leader: snapshot.data[0]), // another tabs
                  ],
                );
              }
              return SpinKitWave(
                color: Colors.purple[50],
              );
            }),
      ),
    ));
  }
}
