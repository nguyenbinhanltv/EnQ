import 'package:EnQ/components/answer_box_history.dart';
import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/const/style.dart';
import 'package:EnQ/models/answer.dart';
import 'package:EnQ/services/history_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:EnQ/models/category.dart';

class HistoryDetail extends StatefulWidget {
  final String uid, historyId;

  const HistoryDetail({Key key, this.uid, this.historyId}) : super(key: key);
  @override
  _HistoryDetailState createState() => _HistoryDetailState();
}

class _HistoryDetailState extends State<HistoryDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
          future:
              HistoryService().getHistoryDetail(widget.uid, widget.historyId),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return DefaultTabController(
                length: snapshot.data['question'].length,
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    centerTitle: true,
                    title: Text('History Result', style: ScriptStyle),
                    leading: IconButton(
                      icon: SvgPicture.asset(
                        'assets/images/arrow_back.svg',
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    actions: [],
                    bottom: TabBar(
                      isScrollable: true,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black12,
                      indicatorColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: List<Widget>.generate(
                        snapshot.data['question'].length,
                        (index) {
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
                    snapshot.data['question'].length,
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
                                      Text(
                                          '${Type.values[int.parse(snapshot.data['question'][index]['type'])].toString().substring(5)}'),
                                      Text(
                                          '${Level.values[int.parse(snapshot.data['question'][index]['rank'])].toString().substring(6)}'),
                                    ]),
                                Expanded(
                                  child: Text(
                                    snapshot.data['question'][index]['title'],
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
                          child: AnswersBoxHistory(
                            ans: Answer.fromJson(
                                snapshot.data['question'][index]['answer']),
                            indexOfQuestion: index,
                            userAns: snapshot.data['question'][index]
                                ['userChoice'],
                            correctAns: snapshot.data['question'][index]
                                ['answer']['correctAnswer'],
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
}
