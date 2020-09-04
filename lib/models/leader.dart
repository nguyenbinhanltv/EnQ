import 'package:EnQ/models/user.dart';

class Leader {
  final String id, startAt, endAt;
  final List<String> userId;

  Leader(this.id, this.startAt, this.endAt, this.userId);

  static List<User> subLeaders = [
    User("Meerkat", "user 4", "assets/images/meerkat.jpg", 'meerkat@gmail.com',
        4, 1300, [], []),
    User("Bear", "user 5", "assets/images/bear.jpg", 'meerkat@gmail.com', 5,
        1200, [], []),
    User("Baby Lion", "user 6", "assets/images/baby_lion.jpg",
        'meerkat@gmail.com', 6, 1100, [], []),
    User("Dennis Dog", "user 7", "assets/images/dennis_dog.jpg",
        'meerkat@gmail.com', 7, 1000, [], []),
    User("Raccon", "user 8", "assets/images/raccoon.jpg", 'meerkat@gmail.com',
        8, 1000, [], []),
  ];

  static List<User> leaders = [
    User("Baby Cow", "user 1", "assets/images/baby_cow.jpg",
        'meerkat@gmail.com', 1, 1500, [], []),
    User("Rabbit", "user 2", "assets/images/rabbit.jpg", 'meerkat@gmail.com', 2,
        1400, [], []),
    User("Penguin", "user 3", "assets/images/penguin.jpg", 'meerkat@gmail.com',
        3, 1350, [], []),
  ];
}
