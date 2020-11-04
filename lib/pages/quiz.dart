import 'package:EnQ/components/answer_box.dart';
import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/const/style.dart';
import 'package:EnQ/models/question.dart';
import 'package:EnQ/pages/result.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otp_count_down/otp_count_down.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  void initState() {
    generateListUserAns();
    _startCountDown();
    loadMusic();
    super.initState();
  }

  AudioPlayer advancedPlayer;
  Future loadMusic() async {
    advancedPlayer =
        await AudioCache().loop('audio/wallyworld_magical_parade.mp3');
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
    advancedPlayer.dispose();

    for (int i = 0; i < userAns.length; i++) {
      if (userAns[i] ==
          Question.questions[i].answer.correctAnswer.toString().substring(11)) {
        point++;
      }
    }
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) =>
            Result(score: this.point, total: userAns.length)));
  }

  String _countDown = '00:00';
  OTPCountDown _otpCountDown;
  final int _otpTimeInMS = 1000 * 5 * 60;

  void _startCountDown() {
    _otpCountDown = OTPCountDown.startOTPTimer(
      timeInMS: _otpTimeInMS,
      currentCountDown: (String countDown) {
        _countDown = countDown;
        setState(() {});
      },
      onFinish: () {
        checkCorrectAnswer();
      },
    );
  }

  //QuestionService question = new QuestionService();
  @override
  Widget build(BuildContext context) {
    //question.getQuestions();
    return SafeArea(
      child: DefaultTabController(
        length: Question.questions.length,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text('English Quiz', style: ScriptStyle),
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
                },
                child: Text('Finish', style: TextStyle(fontFamily: FontName)),
                textColor: Colors.redAccent,
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
                  margin: EdgeInsets.only(top: DefaultPaddin * 0.5),
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight * 0.25,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: DefaultPaddin * 1.5,
                        right: DefaultPaddin * 1.5,
                        bottom: DefaultPaddin * 1.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.access_time),
                                Text(_countDown),
                              ],
                            ),
                            Icon(Icons.volume_mute),
                          ],
                        ),
                        Text(
                          Question.questions[index].title,
                          style: ScriptStyle,
                        ),
                      ],
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
      ),
    );
  }

  @override
  void dispose() {
    _otpCountDown.cancelTimer();
    super.dispose();
  }
}
