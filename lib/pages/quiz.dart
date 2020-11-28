import 'package:EnQ/components/answer_box.dart';
import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/const/style.dart';
import 'package:EnQ/models/question.dart';
import 'package:EnQ/models/test_exam.dart';
import 'package:EnQ/models/answer.dart';
import 'package:EnQ/models/test_exam_history.dart';
import 'package:EnQ/pages/result.dart';
import 'package:EnQ/services/history_service.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otp_count_down/otp_count_down.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Quiz extends StatefulWidget {
  final Future<TestExam> test;
  final String uidCurrentUser;
  Quiz({@required this.test, this.uidCurrentUser});

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  void initState() {
    // generateListUserAns();
    loadMusic();
    _startCountDown();
    generateListUserAns();
    timeStart = DateTime.now().toString();
    super.initState();
  }

  String timeStart;

  AudioPlayer advancedPlayer;
  Future loadMusic() async {
    advancedPlayer =
        await AudioCache().loop('audio/wallyworld_magical_parade.mp3');
  }

  List<String> userAns = [];
  int point = 0;
  void generateListUserAns() {
    for (int i = 0; i < 10; i++) {
      userAns.add('');
    }
  }

  void checkCorrectAnswer() {
    advancedPlayer.stop();
    for (int i = 0; i < userAns.length; i++) {
      if (userAns[i] ==
          AnswerType.values[questions[i].answer.correctAnswer]
              .toString()
              .substring(11)) {
        point++;
      }
    }

    List<int> ans = [];
    List<String> ex = ["A", "B", "C", "D"];
    this.userAns.forEach((element) {
      ans.add(ex.indexOf(element));
    });

    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Result(
            score: this.point,
            total: userAns.length,
            uidCurrentUser: widget.uidCurrentUser)));

    HistoryService().updateUserHistory(
      widget.uidCurrentUser,
      TestExamHistory(this.timeStart, DateTime.now().toString(), ans,
          this.point * 10, this.testExam),
    );
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
        if (questions != null) {
          checkCorrectAnswer();
        }
      },
    );
  }

  List<Question> questions = [];
  List<String> idQuestions = [];
  TestExam testExam;
  bool isVolIconOnTap = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
          future: widget.test,
          builder: (BuildContext context, AsyncSnapshot<TestExam> snapshot) {
            if (snapshot.hasData) {
              questions = snapshot.data.questions;
              testExam = snapshot.data;
              return DefaultTabController(
                length: snapshot.data.questions.length,
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
                          checkCorrectAnswer();
                        },
                        child: Text('Finish',
                            style: TextStyle(fontFamily: FontName)),
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
                        snapshot.data.questions.length,
                        (index) {
                          idQuestions.add(snapshot.data.questions[index].id);
                          return new Tab(
                              child: Text(
                            (index + 1).toString(),
                            textAlign: TextAlign.center,
                          ));
                        },
                      ),
                    ),
                  ),
                  body: TabBarView(
                      children: List<Widget>.generate(
                    snapshot.data.questions.length,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.access_time),
                                        Text(_countDown),
                                      ],
                                    ),
                                    IconButton(
                                      icon: Icon(isVolIconOnTap
                                          ? Icons.volume_mute
                                          : Icons.volume_off),
                                      onPressed: () => setState(() {
                                        isVolIconOnTap = !isVolIconOnTap;
                                        isVolIconOnTap
                                            ? advancedPlayer.resume()
                                            : advancedPlayer.pause();
                                      }),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Text(
                                    snapshot.data.questions[index].title,
                                    style: ScriptStyle,
                                  ),
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
                            ans: snapshot.data.questions[index].answer,
                            indexOfQuestion: index,
                            userAns: this.userAns,
                          ),
                        )
                      ],
                    ),
                  )),
                ),
              );
            } else {
              return SpinKitWave(
                color: Colors.purple[50],
              );
            }
          }),
    );
  }

  @override
  void dispose() {
    advancedPlayer.dispose();
    _otpCountDown.cancelTimer();
    super.dispose();
  }
}
