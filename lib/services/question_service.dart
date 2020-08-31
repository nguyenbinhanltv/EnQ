import 'package:http/http.dart' as http;

class QuestionService {
  Future<http.Request> getQuestions() {
    dynamic questions;
    http.get('https://enq-server.herokuapp.com/questions',
        headers: <String, String>{
          'Content-Type': 'application/json'
        }).then((value) => {questions = value.body, print(questions)});
  }
}
