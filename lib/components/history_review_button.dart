import 'package:EnQ/const/style.dart';
import 'package:EnQ/models/test_exam_history.dart';
import 'package:EnQ/models/user.dart';
import 'package:flutter/material.dart';

class HistoryReviewButton extends StatelessWidget {
  final TestExamHistory histories;
  final int index;
  const HistoryReviewButton({Key key, this.histories, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: RaisedButton(
        onPressed: () {},
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: Colors.grey),
        ),
        color: index % 2 == 0 ? Colors.purple[50] : Colors.green[50],
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(exampleUser.photoUrl),
              ),
              Text(exampleUser.userName, style: InsideButton),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(histories.timeStart, style: InsideButton),
                  Text('End Time: ' + histories.timeEnd, style: InsideButton),
                ],
              ),
              Column(
                children: [
                  Text('Score', style: InsideButton),
                  Text('${histories.point}' + '/10', style: InsideButton),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
