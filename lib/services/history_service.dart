import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:EnQ/models/test_exam_history.dart';

class HistoryService {
  Future<http.Response> updateUserHistory(
      String id, TestExamHistory testHistory) async {
    Map<String, dynamic> testHistoryJson = testHistory.toJson();
    List<Map<String, dynamic>> testHistoryList = [testHistoryJson];
    var response = await http.patch(
      Uri.https('enq-server.herokuapp.com', '/v1/users/?userId=$id'),
      // Uri.https('e90a88023538.ngrok.io', '/v1/users/?userId=$id'),
      body: jsonEncode({
        "_id": id,
        "testExamHistory": testHistoryList,
      }),
    );
    print(jsonDecode(response.body));
    print(response.statusCode);
    return response;
  }

  Future<http.Response> getRecentHistory() async {
    http.Response response = await http.post(
      Uri.https('enq-server.herokuapp.com', '/v1/test/history'),
    );

    return response;
  }
}
