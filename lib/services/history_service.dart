import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:EnQ/models/test_exam_history.dart';
import 'package:EnQ/utils/env.dart';

class HistoryService {
  Future<http.Response> updateUserHistory(
      String id, TestExamHistory testHistory) async {
    Map<String, dynamic> testHistoryJson = testHistory.toJson();
    List<Map<String, dynamic>> testHistoryList = [testHistoryJson];
    Map<String, String> header = {"Content-Type": "application/json"};
    var response = await http.patch(
      // Uri.https('enq-server.herokuapp.com', '/v1/users/?userId=$id'),
      Enviroment.prod + '/users/?userId=$id',
      headers: header,
      body: jsonEncode({
        "_id": id,
        "testExamHistory": testHistoryList,
      }),
    );
    // print(jsonDecode(response.body));
    print('update history ${response.statusCode}');
    return response;
  }

  Future<http.Response> getRecentHistory() async {
    http.Response response = await http.post(
      Uri.https('enq-server.herokuapp.com', '/v1/test/history'),
    );

    return response;
  }
}
