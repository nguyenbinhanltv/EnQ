import 'package:EnQ/models/user.dart';

class Leader {
  final String id, startAt, endAt;
  final List<String> userId;

  Leader(this.id, this.startAt, this.endAt, this.userId);

  static List<User> subLeaders = [
    User("Meerkat", "user 4", "assets/images/meerkat.jpg", 4, 1300),
    User("Bear", "user 5", "assets/images/bear.jpg", 5, 1200),
    User("Baby Lion", "user 6", "assets/images/baby_lion.jpg", 6, 1100),
    User("Dennis Dog", "user 7", "assets/images/dennis_dog.jpg", 7, 1000),
    User("Raccon", "user 8", "assets/images/raccoon.jpg", 8, 1000),
  ];

  static List<User> leaders = [
    User("Baby Cow", "user 1", "assets/images/baby_cow.jpg", 1, 1500),
    User("Rabbit", "user 2", "assets/images/rabbit.jpg", 2, 1400),
    User("Penguin", "user 3", "assets/images/penguin.jpg", 3, 1350),
  ];
}
