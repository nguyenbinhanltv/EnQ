import 'package:EnQ/utils/env.dart';
import 'package:EnQ/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  Future<http.Response> createUser(String id, String userName, String photoURL,
      int rank, int point, List<String> testHistory, String email) {
    return http.post(
      Enviroment.prod + '/users',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "id": id,
        "displayName": userName,
        "photoURL": photoURL,
        "rank": rank,
        "point": point,
        "testHistory": testHistory,
        "email": email
      }),
    );
  }

  Future<User> getUser(String id) async {
    String url = Enviroment.prod + '/users/' + id;
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Fail to get user');
    }
  }
}
