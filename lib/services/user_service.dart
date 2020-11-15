import 'package:EnQ/utils/env.dart';
import 'package:EnQ/models/user.dart';
import 'package:EnQ/models/test_exam_history.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  Future<http.Response> createUser(String id, String userName, String photoURL,
      int rank, int point, List<TestExamHistory> testHistory, String email) {
    return http.post(
      Enviroment.prod + '/users',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "_id": id,
        "displayName": userName,
        "photoURL": photoURL,
        "rank": rank,
        "point": point,
        "testExamHistory": testHistory,
        "email": email,
        "timeCreate": DateTime.now().toString()
      }),
    );
  }

  Future<User> getUser(String id) async {
    // String url = Enviroment.prod + '/users/' + id;
    final response =
        await http.get(Uri.https('enq-server.herokuapp.com', '/v1/users/$id'));
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      print('Fail to get user');
    }
  }

  // User getUserStream(String id) {
  //   String url = Enviroment.prod + '/users/' + id;
  //   final response = http.get(url);
  //   response.then((value) {
  //     User user = User.fromJson(jsonDecode(value.body));
  //     print(user.userName);
  //     return User.fromJson(jsonDecode(value.body));
  //   });
  // }

  Stream<User> userStream(String id) async* {
    while (true) {
      await Future.delayed(Duration(seconds: 5));
      yield await getUser(id);
    }
  }
}
