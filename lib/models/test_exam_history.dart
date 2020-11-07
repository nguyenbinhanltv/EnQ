class TestExamHistory {
  final String id, timeStart, timeEnd;
  final String answers;
  final int point;
  TestExamHistory(
      this.id, this.timeStart, this.timeEnd, this.answers, this.point);
}

List<TestExamHistory> histories = [
  TestExamHistory("1", "November 7, 2020", "9:30", "A, C, B, D", 8),
  TestExamHistory("2", "November 7, 2020", "9:30", "A, C, B, D", 10),
  TestExamHistory("3", "November 7, 2020", "9:30", "A, C, B, D", 7),
  TestExamHistory("4", "November 7, 2020", "9:30", "A, C, B, D", 10),
];
