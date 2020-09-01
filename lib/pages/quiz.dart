import 'package:EnQ/const/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:EnQ/services/question_service.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  //QuestionService question = new QuestionService();
  List<Tab> tabs = [
    new Tab(
        child: Text(
      '1',
      textAlign: TextAlign.center,
    )),
    new Tab(
        child: Text(
      '2',
      textAlign: TextAlign.center,
    )),
    new Tab(
        child: Text(
      '3',
      textAlign: TextAlign.center,
    )),
    new Tab(
        child: Text(
      '4',
      textAlign: TextAlign.center,
    )),
    new Tab(
        child: Text(
      '5',
      textAlign: TextAlign.center,
    )),
    new Tab(
        child: Text(
      '6',
      textAlign: TextAlign.center,
    )),
    new Tab(
        child: Text(
      '7',
      textAlign: TextAlign.center,
    )),
    new Tab(
        child: Text(
      '8',
      textAlign: TextAlign.center,
    )),
    new Tab(
        child: Text(
      '9',
      textAlign: TextAlign.center,
    )),
    new Tab(
        child: Text(
      '10',
      textAlign: TextAlign.center,
    )),
    new Tab(
        child: Text(
      '11',
      textAlign: TextAlign.center,
    )),
    new Tab(
        child: Text(
      '12',
      textAlign: TextAlign.center,
    )),
    new Tab(
        child: Text(
      '13',
      textAlign: TextAlign.center,
    )),
    new Tab(
        child: Text(
      '14',
      textAlign: TextAlign.center,
    )),
    new Tab(
        child: Text(
      '15',
      textAlign: TextAlign.center,
    )),
    new Tab(
        child: Text(
      '16',
      textAlign: TextAlign.center,
    )),
    new Tab(
        child: Text(
      '17',
      textAlign: TextAlign.center,
    )),
    new Tab(
        child: Text(
      '18',
      textAlign: TextAlign.center,
    )),
    new Tab(
        child: Text(
      '19',
      textAlign: TextAlign.center,
    )),
    new Tab(
        child: Text(
      '20',
      textAlign: TextAlign.center,
    )),
  ];

  List<Icon> tabView = [
    new Icon(
      Icons.notifications,
      color: Colors.black,
    ),
    new Icon(
      Icons.notifications,
      color: Colors.black,
    ),
    new Icon(
      Icons.notifications,
      color: Colors.black,
    ),
    new Icon(
      Icons.notifications,
      color: Colors.black,
    ),
    new Icon(
      Icons.notifications,
      color: Colors.black,
    ),
    new Icon(
      Icons.notifications,
      color: Colors.black,
    ),
    new Icon(
      Icons.notifications,
      color: Colors.black,
    ),
    new Icon(
      Icons.notifications,
      color: Colors.black,
    ),
    new Icon(
      Icons.notifications,
      color: Colors.black,
    ),
    new Icon(
      Icons.notifications,
      color: Colors.black,
    ),
    new Icon(
      Icons.notifications,
      color: Colors.black,
    ),
    new Icon(
      Icons.notifications,
      color: Colors.black,
    ),
    new Icon(
      Icons.notifications,
      color: Colors.black,
    ),
    new Icon(
      Icons.notifications,
      color: Colors.black,
    ),
    new Icon(
      Icons.notifications,
      color: Colors.black,
    ),
    new Icon(
      Icons.notifications,
      color: Colors.black,
    ),
    new Icon(
      Icons.notifications,
      color: Colors.black,
    ),
    new Icon(
      Icons.notifications,
      color: Colors.black,
    ),
    new Icon(
      Icons.notifications,
      color: Colors.black,
    ),
    new Icon(
      Icons.notifications,
      color: Colors.black,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    //question.getQuestions();
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text('English Quiz', style: TabsStyle),
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/images/arrow_back.svg',
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            FlatButton(
              onPressed: () {},
              child: Text('Skip'),
            )
          ],
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black12,
            indicatorColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: tabs,
          ),
        ),
        body: Container(
            color: Colors.amber, child: TabBarView(children: tabView)),
      ),
    );
  }
}
