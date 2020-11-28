import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:EnQ/services/user_service.dart';
import 'package:EnQ/models/user.dart';
import 'package:EnQ/models/leader.dart';
import 'package:EnQ/utils/env.dart';

class LeaderService {
  Future<http.Response> updateLeadersDay(String id) async {
    Map<String, String> header = {"Content-Type": "application/json"};
    User user = await UserService().getUser(id);
    print(jsonEncode({
      'user': {
        '_id': id,
        'displayName': user.userName,
        'email': user.email,
        'photoURL': user.photoUrl,
        'point': user.point,
        'rank': user.rank
      }
    }));
    var response = await http.patch(Enviroment.prod + '/leaders/day',
        headers: header,
        body: jsonEncode({
          'user': {
            '_id': id,
            'displayName': user.userName,
            'email': user.email,
            'photoURL': user.photoUrl,
            'point': user.point,
            'rank': user.rank
          }
        }));
    print(response.statusCode);
    return response;
  }

  Future<Leader> getLeadersDay() async {
    var response = await http.get(Enviroment.prod + '/leaders/day');
    print(response.statusCode);
    if (response.statusCode == 200) {
      return Leader.fromJson(jsonDecode(response.body));
    } else {
      print('Fail to get leaders day');
    }
  }
}
