import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:EnQ/models/test_exam_history.dart';

class HistoryService {
  Future<http.Response> updateUserHistory(
      String id, TestExamHistory testHistory) async {
    Map<String, dynamic> testHistoryJson = testHistory.toJson();
    List<Map<String, dynamic>> testHistoryList = [testHistoryJson];
    // print(testHistoryList.toString());
    // print(testHistoryJson);
    // convert this shit to json -> testExam and testHistory
    print(jsonEncode({"testExamHistory": testHistoryList}));
    http.Response response = await http.patch(
      Uri.https('enq-server.herokuapp.com', '/v1/users'),
      headers: {"Content-type": "application/json"},
      body: jsonEncode({
        "_id": id,
        "testExamHistory": testHistoryList,
      }),
    );
    print(response.statusCode);
    return response;
  }

  Future<http.Response> getRecentHistory() async {
    http.Response response = await http.post(
      Uri.https('enq-server.herokuapp.com', '/v1/test/history'),
    );
  }
}
