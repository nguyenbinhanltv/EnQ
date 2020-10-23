import 'package:EnQ/models/answer.dart';

class Question {
  final String id, rank, title, type;
  final Answer answer;

  Question(this.id, this.rank, this.title, this.type, this.answer);

  static List<Question> questions = [
    Question(
      'id 1',
      'easy',
      'Every morning, Ba ______ up at six o’clock.',
      'grammar',
      Answer(['to get', 'get', 'gets', 'is getting'], 'ans id 1'),
    ),
    Question(
      'id 1',
      'easy',
      'Every morning, Ba ______ up at six o’clock.',
      'grammar',
      Answer(['to get', 'get', 'gets', 'is getting'], 'ans id 1'),
    ),
    Question(
      'id 1',
      'easy',
      'Every morning, Ba ______ up at six o’clock.',
      'grammar',
      Answer(['to get', 'get', 'gets', 'is getting'], 'ans id 1'),
    )
  ];
}
