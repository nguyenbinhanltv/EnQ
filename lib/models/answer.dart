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
  return {
    'A': instance.ans[0],
    'B': instance.ans[1],
    'correctAnswer': instance.correctAnswer,
    'C': instance.ans[2],
    'D': instance.ans[3]
  };
}
