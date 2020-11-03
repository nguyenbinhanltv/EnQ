import 'package:EnQ/models/answer.dart';

enum Type { Grammar, Vocab }
enum Level { Easy, Normal, Hard }

class Question {
  final String id, title;
  final Type type;
  final Level rank;
  final Answer answer;

  Question(this.id, this.rank, this.title, this.type, this.answer);

  static List<Question> questions = [
    Question(
      'id 1',
      Level.Easy,
      'Every morning, Ba ______ up at six o’clock.',
      Type.Grammar,
      Answer(['to get', 'get', 'gets', 'is getting'], 'ans id 1'),
    ),
    Question(
      'id 2',
      Level.Easy,
      'Every morning, Ba ______ up at six o’clock.',
      Type.Grammar,
      Answer(['to get', 'get', 'gets', 'is getting'], 'ans id 1'),
    ),
    Question(
      'id 10',
      Level.Easy,
      ' Last summer, I _________. Finishing with my uncle in the afternoon..',
      Type.Grammar,
      Answer(['go', 'went', 'goes', 'going'], 'went'),
    ),
  ];
}
