// import 'dart:async';
// import 'package:EnQ/models/user.dart';
// import 'package:EnQ/services/user_service.dart';

// class MyStream {
//   StreamController userStreamController =
//       new StreamController<User>.broadcast();

//   Stream<User> get user => userStreamController.stream;

//   Stream<User> userStream(String id) async* {
//     while (true) {
//       await Future.delayed(Duration(minutes: 10));
//       //yield await UserService().getUser(id);
//       userStreamController.sink.add(await UserService().getUser(id));
//     }
//   }

//   void dispose() {
//     userStreamController.close();
//   }
// }
