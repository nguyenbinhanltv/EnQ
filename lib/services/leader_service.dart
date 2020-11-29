import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:EnQ/services/user_service.dart';
import 'package:EnQ/models/user.dart';
import 'package:EnQ/models/leader.dart';
import 'package:EnQ/utils/env.dart';

class LeaderService {
  Future<http.Response> updateLeadersDay(String uid) async {
    Map<String, String> header = {"Content-Type": "application/json"};
    User currentUser = await UserService().getUser(uid);

    Leader leadersDay = await getLeadersDay();
    bool flag = false;
    if (leadersDay.users.length > 0) {
      for (var element in leadersDay.users) {
        if (element['_id'] == uid) {
          element['point'] = currentUser.point;
          flag = true;
          break;
        }
      }
      if (!flag) {
        leadersDay.users.add({
          '_id': uid,
          'displayName': currentUser.userName,
          'email': currentUser.email,
          'photoURL': currentUser.photoUrl,
          'point': currentUser.point,
          'rank': currentUser.rank
        });
      }
    } else {
      leadersDay.users.add({
        '_id': uid,
        'displayName': currentUser.userName,
        'email': currentUser.email,
        'photoURL': currentUser.photoUrl,
        'point': currentUser.point,
        'rank': currentUser.rank
      });
    }

    var response = await http.patch(
      Enviroment.prod + '/leaders/day',
      headers: header,
      body: jsonEncode({
        '_id': leadersDay.id,
        'users': leadersDay.users.toSet().toList(),
      }),
    );
    print('update leader day ${response.statusCode}');
    return response;
  }

  // ignore: missing_return
  Future<Leader> getLeadersDay() async {
    var response = await http.get(Enviroment.prod + '/leaders/day');
    print('get leader week ${response.statusCode}');

    if (response.statusCode == 200) {
      return Leader.fromJson(jsonDecode(response.body));
    } else {
      print('Fail to get leaders day');
    }
  }

  // ignore: missing_return
  Future<Leader> getLeadersWeek() async {
    var response = await http.get(Enviroment.prod + '/leaders/week');
    print('get leader week ${response.statusCode}');
    if (response.statusCode == 200) {
      return Leader.fromJson(jsonDecode(response.body));
    } else {
      print('Fail to get leaders week');
    }
  }

  Future<http.Response> updateLeadersWeek(String uid) async {
    Map<String, String> header = {"Content-Type": "application/json"};
    User currentUser = await UserService().getUser(uid);

    Leader leadersWeek = await getLeadersWeek();
    bool flag = false;
    if (leadersWeek.users.length > 0) {
      for (var element in leadersWeek.users) {
        if (element['_id'] == uid) {
          element['point'] = currentUser.point;
          flag = true;
          break;
        }
      }
      if (!flag) {
        leadersWeek.users.add({
          '_id': uid,
          'displayName': currentUser.userName,
          'email': currentUser.email,
          'photoURL': currentUser.photoUrl,
          'point': currentUser.point,
          'rank': currentUser.rank
        });
      }
    } else {
      leadersWeek.users.add({
        '_id': uid,
        'displayName': currentUser.userName,
        'email': currentUser.email,
        'photoURL': currentUser.photoUrl,
        'point': currentUser.point,
        'rank': currentUser.rank
      });
    }

    var response = await http.patch(
      Enviroment.prod + '/leaders/week',
      headers: header,
      body: jsonEncode({
        '_id': leadersWeek.id,
        'users': leadersWeek.users.toSet().toList(),
      }),
    );
    print('update leader week ${response.statusCode}');
    return response;
  }
}
