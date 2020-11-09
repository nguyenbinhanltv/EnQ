import 'package:http/http.dart' as http;
import 'package:EnQ/models/testExam.dart';
import 'package:EnQ/utils/env.dart';
import 'dart:convert';

class TestExamService {
  Future<TestExam> getTestExam(int type, int rank) async {
    var url = Enviroment.prod + '/questions/' + '?type=$type?rank=$rank';
    print(url);
    // final response = await http.get(url);
    // if (response.statusCode == 200) {
    //   print(TestExam.fromJson(jsonDecode(response.body)));
    //   return TestExam.fromJson(jsonDecode(response.body));
    // } else {
    //   throw Exception('Fail to get testExam');
    // }
  }
}
