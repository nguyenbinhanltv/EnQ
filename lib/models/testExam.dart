import 'package:EnQ/models/category.dart';
import 'package:EnQ/models/question.dart';

class TestExam {
  final String id;
  final List<Question> questions;
  final String rank;
  final String type;

  TestExam(this.id, this.questions, this.rank, this.type);

  factory TestExam.fromJson(Map<dynamic, dynamic> json) {
    List<Question> questions = List<Question>.from(
        json['data']['questions'].map((e) => Question.fromJson(e)));
    return TestExam(
      json['data']['_id'],
      questions,
      json['data']['rank'],
      json['data']['type'],
    );
  }
}
