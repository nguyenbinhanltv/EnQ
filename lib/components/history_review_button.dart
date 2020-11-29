import 'dart:ffi';

import 'package:EnQ/const/style.dart';
import 'package:EnQ/models/test_exam_history.dart';
import 'package:EnQ/models/user.dart';
import 'package:EnQ/pages/history_detail.dart';
import 'package:EnQ/services/history_service.dart';
import 'package:flutter/material.dart';

class HistoryReviewButton extends StatelessWidget {
  final dynamic histories;
  final int index;
  final User currentUser;
  const HistoryReviewButton(
      {Key key, this.histories, this.index, this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => HistoryDetail(
                      uid: this.currentUser.id,
                      historyId: this.histories['_id'].toString())));
          // HistoryService().getHistoryDetail(
          //     this.currentUser.id, this.histories['_id'].toString());
        },
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
                backgroundImage: NetworkImage(this.currentUser.photoUrl),
              ),
              Text(this.currentUser.userName, style: InsideButton),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(histories['timeStart'].toString().split(',')[0].trim(),
                      style: InsideButton),
                  Text(
                      // 'End Time: ' +
                      histories['timeEnd'].toString().split(',')[1].trim(),
                      style: InsideButton),
                ],
              ),
              Column(
                children: [
                  Text('Score', style: InsideButton),
                  Text('${histories['point']}' + '/100', style: InsideButton),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
