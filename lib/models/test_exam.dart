import 'package:EnQ/models/question.dart';

class TestExam {
  final String id;
  final List<Question> questions;
  final String rank;
  final String type;
  TestExam(this.id, this.questions, this.rank, this.type);

  Map<String, dynamic> toJson() => _testExamToJson(this);

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

  // Map toJson() {
  //   // Map questions = ;
  //   return {
  //     'id': id,
  //     'questions': jsonEncode(questions),
  //     'rank': rank,
  //     'type': type
  //   };
  // }

}

Map<String, dynamic> _testExamToJson(TestExam instance) {
  List<Map<String, dynamic>> questions = instance.questions != null
      ? instance.questions.map((e) => e.toJson()).toList()
      : null;
  return {
    '_id': instance.id,
    'questions': questions,
    'rank': instance.rank,
    'type': instance.type,
  };
}
