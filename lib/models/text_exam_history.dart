import 'package:EnQ/models/answer.dart';

class TextExamHistory {
  final String id, timeStart, timeEnd, textExamId;
  final List<Answer> answers;

  TextExamHistory(
      this.id, this.timeStart, this.timeEnd, this.textExamId, this.answers);
}
