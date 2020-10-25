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
      Answer(['to get', 'get', 'gets', 'is getting'], 'gets'),
    ),
    Question(
      'id 2',
      'easy',
      ' Hi,  ______ name is Phong. I’m a student.',
      'grammar',
      Answer(['my', 'his', 'her', 'our'], 'my'),
    ),
    Question(
      'id 3',
      'easy',
      '______ do you live? I live on Tran Phu street.',
      'grammar',
      Answer(['What', 'Where', 'Who', 'How'], 'Where'),
    ),
    Question(
      'id 4',
      'easy',
      ' What is ______? It is a schoolbag.',
      'grammar',
      Answer(['these', 'those', 'they', 'this'], 'this'),
    ),
    Question(
      'id 5',
      'easy',
      'When do you have English? I have it ________ Monday and Thursday.',
      'grammar',
      Answer(['at', 'on', 'for', 'in'], 'on'),
    ),
    Question(
      'id 6',
      'easy',
      'Are there any flowers to the left of your house? _____________.',
      'grammar',
      Answer([
        'Yes, there are',
        'Yes, there is',
        'No, there isn’t',
        'Yes, they do'
      ], 'Yes, there are'),
    ),
    Question(
      'id 7',
      'easy',
      'I go to the __________ to send the letter.',
      'grammar',
      Answer(['supermarket', 'zoo', 'post office', 'bank'], 'post office'),
    ),
    Question(
      'id 8',
      'easy',
      '“ It’s 9:45 now.” means: ________________.',
      'grammar',
      Answer([
        'It’s nine past forty- five.',
        'It’s a quarter to ten',
        'It’s forty- five nine',
        'It’s a quarter to nine.'
      ], 'It’s a quarter to ten'),
    ),
    Question(
      'id 9',
      'easy',
      'My sister can’t swim _________. She’s afraid of water.',
      'grammar',
      Answer(['because', 'and', 'but', 'so'], 'because'),
    ),
    Question(
      'id 10',
      'easy',
      ' Last summer, I _________. Finishing with my uncle in the afternoon..',
      'grammar',
      Answer(['go', 'went', 'goes', 'going'], 'went'),
    ),
  ];
}
