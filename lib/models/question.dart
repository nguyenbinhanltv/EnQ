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
      ' Hi,  ______ name is Phong. I’m a student.',
      'grammar',
      Answer(['My', 'His', 'Her', 'Our'], 'ans id 1'),
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
      'Which sentence is correct?',
      'grammar',
      Answer([
        'Do your brother watches TV in the evening?',
        'Is your brother watches TV in the evening?',
        'Does your brother watches TV in the evening?',
        'Does your brother watch TV in the evening?'
      ], 'ans id 1'),
    ),
    Question(
      'id 1',
      'easy',
      'Which sentence is correct?',
      'grammar',
      Answer([
        'There is a flower garden to the left of the house.',
        'There is a flowers garden to the left of the house.',
        'There is a flower garden the left of the house.',
        'There is a flower gardens to the left of the house.'
      ], 'ans id 1'),
    ),
  ];
}
