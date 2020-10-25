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
      'id 2',
      'easy',
      ' Hi,  ______ name is Phong. I’m a student.',
      'grammar',
      Answer(['My', 'His', 'Her', 'Our'], 'ans id 2'),
    ),
    Question(
      'id 1',
      'easy',
      '______ do you live? I live on Tran Phu street.',
      'grammar',
      Answer(['What', 'Where', 'Who', 'How'], 'ans id 1'),
    ),
    Question(
      'id 1',
      'easy',
      ' What is ______? It is a schoolbag.',
      'grammar',
      Answer(['these', 'those', 'they', 'this'], 'ans id 1'),
    ),
    Question(
      'id 1',
      'easy',
      'When do you have English? I have it ________ Monday and Thursday.',
      'grammar',
      Answer(['at', 'on', 'for', 'in'], 'ans id 1'),
    ),
    Question(
      'id 1',
      'easy',
      'Are there any flowers to the left of your house? _____________.',
      'grammar',
      Answer([
        'Yes, there are',
        'Yes, there is',
        'No, there isn’t',
        'Yes, they do'
      ], 'ans id 1'),
    ),
    Question(
      'id 1',
      'easy',
      'I go to the __________ to send the letter.',
      'grammar',
      Answer(['supermarket', 'zoo', 'post office', 'bank'], 'ans id 1'),
    ),
    Question(
      'id 1',
      'easy',
      '“ It’s 9:45 now.” means: ________________.',
      'grammar',
      Answer([
        'It’s nine past forty- five.',
        'It’s a quarter to ten',
        'It’s forty- five nine',
        'It’s a quarter to nine.'
      ], 'ans id 1'),
    ),
    Question(
      'id 1',
      'easy',
      'My sister can’t swim _________. She’s afraid of water.',
      'grammar',
      Answer(['because', 'and', 'but', 'so'], 'ans id 1'),
    ),
    Question(
      'id 1',
      'easy',
      ' Last summer, I _________. Finishing with my uncle in the afternoon..',
      'grammar',
      Answer(['go', 'went', 'goes', 'going'], 'ans id 1'),
    ),
  ];
}
