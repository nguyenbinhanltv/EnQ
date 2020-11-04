import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/const/style.dart';
import 'package:EnQ/models/answer.dart';
import 'package:flutter/material.dart';

class AnswersBox extends StatefulWidget {
  final Answer ans;
  final int indexOfQuestion;
  List<String> userAns;

  AnswersBox({Key key, this.ans, this.indexOfQuestion, this.userAns})
      : super(key: key);

  @override
  _AnswersBoxState createState() => _AnswersBoxState();
}

class _AnswersBoxState extends State<AnswersBox>
    with AutomaticKeepAliveClientMixin {
  List<bool> press = [false, false, false, false];
  List<String> fields = ["A", "B", "C", "D"];

  void changeStateAnsBox() {
    for (int i = 0; i < press.length; i++) {
      if (press[i] == true) {
        press[i] = false;
      }
    }
  }

  @override
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
              color: press[index] ? Colors.amberAccent : Colors.white,
              autofocus: true,
              onPressed: () {
                setState(() {
                  this.widget.userAns[this.widget.indexOfQuestion] =
                      (fields[index]);
                  changeStateAnsBox();
                  press[index] = !press[index];
                  print(this.widget.userAns);
                });
              },
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
                  Text(widget.ans.ans[index], style: TextStyle(fontSize: 17.0)),
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
