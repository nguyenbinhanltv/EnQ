import 'package:EnQ/components/history_review_button.dart';
import 'package:EnQ/const/style.dart';
import 'package:EnQ/models/test_exam_history.dart';
import 'package:EnQ/models/user.dart';
import 'package:EnQ/services/history_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

class History extends StatefulWidget {
  final String uidCurrentUser;
  final Future<User> user;
  const History({Key key, this.uidCurrentUser, this.user}) : super(key: key);
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text('History', style: ScriptStyle),
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/images/arrow_back.svg',
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: FutureBuilder(
            future: Future.wait([
              widget.user,
              HistoryService().getAllHistory(widget.uidCurrentUser)
            ]),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: histories.length,
                    itemBuilder: (BuildContext context, int index) =>
                        HistoryReviewButton(
                            histories: snapshot.data[1][index],
                            index: index,
                            currentUser: snapshot.data[0]),
                  ),
                );
              }
              return SpinKitWave(
                color: Colors.purple[50],
              );
            }),
      ),
    );
  }
}
