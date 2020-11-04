import 'package:EnQ/components/answer_box.dart';
import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/const/style.dart';
import 'package:EnQ/models/answer.dart';
import 'package:EnQ/models/question.dart';
import 'package:EnQ/pages/result.dart';
import 'package:EnQ/utils/app_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  void initState() {
    super.initState();
  }

  List<String> userAns = [];
  int point = 0;
  void generateListUserAns() {
    if (userAns.length == Question.questions.length) {
      return;
    } else {
      for (int i = 0; i < Question.questions.length; i++) {
        userAns.add('');
      }
    }
  }

  void checkCorrectAnswer() {
    for (int i = 0; i < userAns.length; i++) {
      if (userAns[i] ==
          Question.questions[i].answer.correctAnswer.toString().substring(11)) {
        point++;
      }
    }
  }

  //QuestionService question = new QuestionService();
  @override
  Widget build(BuildContext context) {
    //question.getQuestions();
    generateListUserAns();
    return DefaultTabController(
      length: Question.questions.length,
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
              onPressed: () {
                print(this.userAns);
                checkCorrectAnswer();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>
                        Result(score: this.point, total: userAns.length)));
              },
              child: Text('Finish'),
            )
          ],
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black12,
            indicatorColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: List<Widget>.generate(
              Question.questions.length,
              (index) => new Tab(
                  child: Text(
                (index + 1).toString(),
                textAlign: TextAlign.center,
              )),
            ),
          ),
        ),
        body: TabBarView(
            children: List<Widget>.generate(
          Question.questions.length,
          (index) => new Stack(
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
                child: AnswersBox(
                    ans: Question.questions[index].answer,
                    indexOfQuestion: index,
                    userAns: this.userAns),
              )
            ],
          ),
        )),
      ),
    );
  }
}

// void nextQuestion() {
//   // ignore: unused_element
//   setState() {
//     if (questionNumber == Question.questions.length) {
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => Summary(
//                     score: finalScore,
//                   )));
//     } else {
//       questionNumber++;
//     }
//   }
// }

// class Summary extends StatelessWidget {
//   final int score;
//   Summary({Key key, @required this.score}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return new WillPopScope(
//       onWillPop: null,
//       child: Scaffold(
//         body: Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 "Your Result: $score",
//                 style: TextStyle(fontSize: 35.0),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
