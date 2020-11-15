import 'package:EnQ/components/answer_box.dart';
import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/const/style.dart';
import 'package:EnQ/models/question.dart';
import 'package:EnQ/models/testExam.dart';
import 'package:EnQ/pages/result.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otp_count_down/otp_count_down.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Quiz extends StatefulWidget {
  Future<TestExam> test;
  Quiz({@required this.test});

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
    for (int i = 0; i < 10; i++) {
      userAns.add('');
    }
  }

  void checkCorrectAnswer() {
    advancedPlayer.stop();
    for (int i = 0; i < userAns.length; i++) {
      if (userAns[i] ==
          questions[i].answer.correctAnswer.toString().substring(11)) {
        point++;
      }
    }
    print(idQuestions);
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
        if (questions != null) {
          checkCorrectAnswer();
        }
      },
    );
  }

  List<Question> questions = [];
  List<String> idQuestions = [];

  bool isVolIconOnTap = true;
  //QuestionService question = new QuestionService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
          future: widget.test,
          builder: (BuildContext context, AsyncSnapshot<TestExam> snapshot) {
            if (snapshot.hasData) {
              questions = snapshot.data.questions;
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
                          print(this.userAns);
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
