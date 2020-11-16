enum AnswerType { A, B, C, D }

class Answer {
  final List<dynamic> ans;
  final AnswerType correctAnswer;

  Answer(
    this.ans,
    this.correctAnswer,
  );

  factory Answer.fromJson(Map<dynamic, dynamic> json) {
    List<dynamic> tempAns = [json['A'], json['B'], json['C'], json['D']];
    return Answer(
      tempAns,
      AnswerType.values[json['correctAnswer']],
    );
  }
}
