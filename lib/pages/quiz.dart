import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/const/style.dart';
import 'package:EnQ/models/answer.dart';
import 'package:EnQ/models/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:EnQ/services/question_service.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  void initState() {
    super.initState();
  }

  //QuestionService question = new QuestionService();
  List<Tab> tabs = [
    new Tab(
        child: Text(
      '1',
      textAlign: TextAlign.center,
    )),
  ];

  List<Icon> tabView = [
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
        body: TabBarView(
            children: List<Widget>.generate(
          Question.questions.length,
          (index) => Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: DefaultPaddin),
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight * 0.25,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(DefaultPaddin * 1.5),
                  child: Text(
                    Question.questions[index].title,
                    style: ScriptStyle,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: DefaultPaddin * 10.25),
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight * 0.6,
                child: AnswersBox(ans: Question.questions[0].answer),
              )
            ],
          ),
        )),
      ),
    );
  }
}

class AnswersBox extends StatelessWidget {
  final Answer ans;
  const AnswersBox({Key key, this.ans}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> fields = ["A", "B", "C", "D"];
    return ListView.builder(
      itemCount: ans.ans.length,
      itemBuilder: (BuildContext context, int index) => Column(
        children: [
          Container(
            width: SizeConfig.screenWidth * 0.9,
            height: 60,
            margin: EdgeInsets.only(top: DefaultPaddin * 1.5),
            child: RaisedButton(
              onPressed: () {},
              color: Colors.white,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(DefaultPaddin * 0.8),
                side: BorderSide(
                  color: Colors.black54,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(fields[index], style: TextStyle(fontSize: 17.0)),
                  //SizedBox(width: DefaultPaddin * 5.25),
                  Spacer(
                    flex: 1,
                  ),
                  Text(ans.ans[index], style: TextStyle(fontSize: 17.0)),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
