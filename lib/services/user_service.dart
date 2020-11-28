import 'package:EnQ/utils/env.dart';
import 'package:EnQ/models/user.dart';
import 'package:EnQ/models/test_exam_history.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';

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

  // ignore: missing_return
  Future<User> getUser(String id, BuildContext context) async {
    // String url = Enviroment.prod + '/users/' + id;
    final response =
        await http.get(Uri.https('enq-server.herokuapp.com', '/v1/users/$id'));
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      print('Fail to get user');
      // setTimeout here
      // god know if it works
      Timer(Duration(seconds: 20), () => Navigator.pop(context));
    }
  }

  // Stream<User> userStream(String id) async* {
  //   while (true) {
  //     await Future.delayed(Duration(hours: 2));
  //     yield await getUser(id);
  //   }
  // }

}
