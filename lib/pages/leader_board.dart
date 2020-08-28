import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/const/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          title: Text('Leader Board', style: TextStyle(color: Colors.black)),
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
                child: Text('This week'),
              ),
              Tab(
                child: Text('All time'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.blueAccent),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/gold-cup.svg',
                            width: SizeConfig.screenWidth * 0.15,
                          ),
                          CircleAvatar(),
                          Text('Akita'), //note
                          Text('1500'),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: DefaultPaddin * 13.5),
                  height: SizeConfig.screenHeight * 0.5,
                  decoration: BoxDecoration(color: Colors.amber),
                ),
              ],
            ),
            Stack(),
          ],
        ),
      ),
    );
  }
}
