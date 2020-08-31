import 'package:EnQ/const/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:EnQ/services/question_service.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  QuestionService questions = new QuestionService();
  @override
  Widget build(BuildContext context) {
    questions.getQuestions();
    return Scaffold(
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
      ),
    );
  }
}
