import 'package:EnQ/models/category.dart';
import 'package:EnQ/models/question.dart';

class TestExam {
  final String id;
  final List<Question> questions;
  final Level rank;
  final Type type;

  TestExam(this.id, this.questions, this.rank, this.type);

  factory TestExam.fromJson(Map<dynamic, dynamic> json) {
    return TestExam(
      json['data']['_id'],
      json['data']['questions'],
      json['data']['rank'],
      json['data']['type'],
    );
  }
}
