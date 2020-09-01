import 'package:http/http.dart' as http;

class QuestionService {
  Future<http.Request> getQuestions() {
    http.get('https://enq-server.herokuapp.com/questions',
        headers: <String, String>{'Content-Type': 'application/json'});
  }
}
