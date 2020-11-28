import 'package:EnQ/models/answer.dart';

class Question {
  final String id, title;
  String type;
  String rank;
  Answer answer;

  Question({this.id, this.rank, this.title, this.type, this.answer});

  Map<String, dynamic> toJson() => _questionToJson(this);

  factory Question.fromJson(Map<dynamic, dynamic> json) {
    return Question(
        id: json['_id'],
        rank: json['rank'],
        title: json['title'],
        type: json['type'],
        answer: Answer.fromJson(json["answer"]));
  }
}

Map<String, dynamic> _questionToJson(Question instance) => <String, dynamic>{
      '_id': instance.id,
      'rank': instance.rank,
      'title': instance.title,
      'type': instance.type,
      'answer': instance.answer != null ? instance.answer.toJson() : null
    };
