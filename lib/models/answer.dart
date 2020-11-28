enum AnswerType { A, B, C, D }

class Answer {
  final List<dynamic> ans;
  int correctAnswer;

  Answer(
    this.ans,
    this.correctAnswer,
  );

  Map<String, dynamic> toJson() => _answerToJson(this);

  factory Answer.fromJson(Map<dynamic, dynamic> json) {
    List<dynamic> tempAns = [json['A'], json['B'], json['C'], json['D']];
    return Answer(
      tempAns,
      json['correctAnswer'],
    );
  }
}

Map<String, dynamic> _answerToJson(Answer instance) {
  return {'ans': instance.ans, 'correctAnswer': instance.correctAnswer};
}
