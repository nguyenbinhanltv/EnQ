import 'package:EnQ/models/test_exam.dart';

class TestExamHistory {
  final String timeStart, timeEnd;
  final List<int> answers;
  final int point;
  final TestExam testExam;
  TestExamHistory(this.timeStart, this.timeEnd, this.answers, this.point,
      [this.testExam]);

  Map<String, dynamic> toJson() => _testHistoryToJson(this);
}

Map<String, dynamic> _testHistoryToJson(TestExamHistory instance) {
  return <String, dynamic>{
    'timeStart': instance.timeStart,
    'timeEnd': instance.timeEnd,
    'answers': instance.answers,
    'point': instance.point,
    'testExam': instance.testExam != null ? instance.testExam.toJson() : null
  };
}

List<TestExamHistory> histories = [
  TestExamHistory("November 7, 2020", "9:30", [0, 1, 2, 3], 8),
  TestExamHistory("November 7, 2020", "8:30", [0, 1, 2, 3], 10),
  TestExamHistory("November 7, 2020", "5:30", [0, 1, 2, 3], 7),
  TestExamHistory("November 7, 2020", "1:30", [0, 1, 2, 3], 10),
  TestExamHistory("November 7, 2020", "3:30", [0, 1, 2, 3], 10),
  TestExamHistory("November 7, 2020", "9:30", [0, 1, 2, 3], 10),
  TestExamHistory("November 7, 2020", "9:30", [0, 1, 2, 3], 10),
  TestExamHistory("November 7, 2020", "9:30", [0, 1, 2, 3], 10),
  TestExamHistory("November 7, 2020", "9:30", [0, 1, 2, 3], 10),
  TestExamHistory("November 7, 2020", "9:30", [0, 1, 2, 3], 10),
];
