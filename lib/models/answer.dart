enum AnswerType { A, B, C, D }

class Answer {
  final List<String> ans;
  final AnswerType correctAnswer;

  Answer(
    this.ans,
    this.correctAnswer,
  );
}
