import 'package:EnQ/components/top_leader.dart';
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
                  margin: EdgeInsets.only(top: DefaultPaddin * 0.6),
                  decoration: BoxDecoration(
                      // border: Border(
                      //   bottom: BorderSide(
                      //     color: Colors.black,
                      //     width: 10.0,
                      //   ),
                      // ), doesnt work.
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: DefaultPaddin * 4.0),
                        child: TopLeader('assets/images/silver-cup.svg',
                            'Okita', '1400', 'assets/images/pig.jpg'),
                      ),
                      TopLeader('assets/images/gold-cup.svg', 'Akita', '1500',
                          'assets/images/dennis_dog.jpg'),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: DefaultPaddin * 5.0),
                        child: TopLeader('assets/images/bronze-cup.svg',
                            'Ekita', '1300', 'assets/images/penguin.jpg'),
                      ),
                    ],
                  ),
                ),
                Container(
                    // change to ListView.builder
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
                    child: Column(
                      children: [
                        Container(
                          width: SizeConfig.screenWidth * 0.9,
                          height: 50,
                          margin: EdgeInsets.only(top: DefaultPaddin * 0.5),
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.white,
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(DefaultPaddin * 2),
                              side: BorderSide(
                                color: Colors.black54,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('4'),
                                CircleAvatar(),
                                Text('Peter'),
                                Text('1200'),
                                SvgPicture.asset(
                                    'assets/images/arrow_forward.svg'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
            Stack(), // another tabs
          ],
        ),
      ),
    );
  }
}
