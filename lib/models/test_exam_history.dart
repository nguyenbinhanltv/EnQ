class TestExamHistory {
  final String id, timeStart, timeEnd;
  final String answers;
  final int point;
  TestExamHistory(
      this.id, this.timeStart, this.timeEnd, this.answers, this.point);
}

List<TestExamHistory> histories = [
  TestExamHistory("1", "November 7, 2020", "9:30", "A, C, B, D", 8),
  TestExamHistory("2", "November 7, 2020", "8:30", "A, C, B, D", 10),
  TestExamHistory("3", "November 7, 2020", "5:30", "A, C, B, D", 7),
  TestExamHistory("4", "November 7, 2020", "1:30", "A, C, B, D", 10),
  TestExamHistory("5", "November 7, 2020", "3:30", "A, C, B, D", 10),
  TestExamHistory("6", "November 7, 2020", "9:30", "A, C, B, D", 10),
  TestExamHistory("7", "November 7, 2020", "9:30", "A, C, B, D", 10),
  TestExamHistory("8", "November 7, 2020", "9:30", "A, C, B, D", 10),
  TestExamHistory("9", "November 7, 2020", "9:30", "A, C, B, D", 10),
  TestExamHistory("10", "November 7, 2020", "9:30", "A, C, B, D", 10),
];
