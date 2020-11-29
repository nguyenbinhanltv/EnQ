import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/const/style.dart';
import 'package:EnQ/models/answer.dart';
import 'package:flutter/material.dart';

class AnswersBoxHistory extends StatefulWidget {
  final Answer ans;
  final int indexOfQuestion;
  final int correctAns;
  final int userAns;

  AnswersBoxHistory(
      {Key key, this.ans, this.indexOfQuestion, this.correctAns, this.userAns})
      : super(key: key);

  @override
  _AnswersBoxHistoryState createState() => _AnswersBoxHistoryState();
}

class _AnswersBoxHistoryState extends State<AnswersBoxHistory>
    with AutomaticKeepAliveClientMixin {
  List<String> fields = ["A", "B", "C", "D"];

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.ans.ans.length,
      itemBuilder: (BuildContext context, int index) => Column(
        children: [
          Container(
            width: SizeConfig.screenWidth * 0.9,
            height: 60,
            margin: EdgeInsets.only(top: DefaultPaddin * 1.5),
            child: RaisedButton(
              onPressed: null,
              disabledColor: Colors.white,
              disabledTextColor: Colors.black,
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
                  Expanded(
                      flex: 1,
                      child: Text(fields[index],
                          style: TextStyle(fontSize: 17.0))),
                  //SizedBox(width: DefaultPaddin * 5.25),
                  Expanded(
                      flex: 4,
                      child: Text(widget.ans.ans[index],
                          style: TextStyle(fontSize: 17.0))),
                  widget.correctAns == widget.userAns
                      ? Expanded(
                          flex: 1,
                          child: Icon(widget.correctAns == index
                              ? Icons.check_circle_outline
                              : null),
                        )
                      : Expanded(
                          child: Icon(
                              widget.userAns == index ? Icons.cancel : null))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
