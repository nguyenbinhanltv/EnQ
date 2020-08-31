import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  Future<http.Response> createUser(String id, String userName, String photoURL,
      int rank, int point, List<String> testHistory) {
    //String url = 'https://enq-server.herokuapp.com/users/' + id;
    // String url = 'http://localhost:3000/users/ + ${id}';
    // Map<String, String> headers = {"Content-type": "application/json"};
    // Map<String, dynamic> json = {
    //   "id": id,
    //   "userName": userName,
    //   "photoURL": photoURL,
    //   "rank": rank,
    //   "point": point,
    //   "testHistory": testHistory
    // };
    return http.post(
      'https://enq-server.herokuapp.com/users',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "id": id,
        "userName": userName,
        "photoURL": photoURL,
        "rank": rank,
        "point": point,
        "testHistory": testHistory
      }),
    );
  }
}
