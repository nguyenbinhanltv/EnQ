import 'package:EnQ/models/user.dart';

enum LeadersType { Week, Month }

class Leader {
  final String id, startAt, endAt;
  final List<User> users;
  final LeadersType type;
  Leader(this.id, this.startAt, this.endAt, this.users, this.type);
}

Leader leaderMonth = Leader(
    "id 2",
    "November, 2020",
    "December, 2020",
    <User>[
      User("Baby Cow", "user 1", "assets/images/baby_cow.jpg",
          'meerkat@gmail.com', 1, 1500, [], [], DateTime.now().toString()),
      User("Rabbit", "user 2", "assets/images/rabbit.jpg", 'meerkat@gmail.com',
          2, 1400, [], [], DateTime.now().toString()),
      User("Penguin", "user 3", "assets/images/penguin.jpg",
          'meerkat@gmail.com', 3, 1350, [], [], DateTime.now().toString()),
      User("Meerkat", "user 4", "assets/images/meerkat.jpg",
          'meerkat@gmail.com', 4, 1300, [], [], DateTime.now().toString()),
      User("Bear", "user 5", "assets/images/bear.jpg", 'meerkat@gmail.com', 5,
          1200, [], [], DateTime.now().toString()),
      User("Baby Lion", "user 6", "assets/images/baby_lion.jpg",
          'meerkat@gmail.com', 6, 1100, [], [], DateTime.now().toString()),
      User("Dennis Dog", "user 7", "assets/images/dennis_dog.jpg",
          'meerkat@gmail.com', 7, 1000, [], [], DateTime.now().toString()),
      User("Raccon", "user 8", "assets/images/raccoon.jpg", 'meerkat@gmail.com',
          8, 1000, [], [], DateTime.now().toString()),
      User("Raccon", "user 9", "assets/images/raccoon.jpg", 'meerkat@gmail.com',
          9, 1000, [], [], DateTime.now().toString()),
      User("Raccon", "user 10", "assets/images/raccoon.jpg",
          'meerkat@gmail.com', 10, 1000, [], [], DateTime.now().toString()),
    ],
    LeadersType.Month);

Leader leaderWeek = Leader(
    "id 1",
    "November, 2020",
    "December, 2020",
    <User>[
      User("Rabbit", "user 1", "assets/images/rabbit.jpg", 'meerkat@gmail.com',
          1, 1500, [], [], DateTime.now().toString()),
      User("Baby Cow", "user 2", "assets/images/baby_cow.jpg",
          'meerkat@gmail.com', 2, 1400, [], [], DateTime.now().toString()),
      User("Penguin", "user 3", "assets/images/penguin.jpg",
          'meerkat@gmail.com', 3, 1350, [], [], DateTime.now().toString()),
      User("Meerkat", "user 4", "assets/images/meerkat.jpg",
          'meerkat@gmail.com', 4, 1300, [], [], DateTime.now().toString()),
      User("Bear", "user 5", "assets/images/bear.jpg", 'meerkat@gmail.com', 5,
          1200, [], [], DateTime.now().toString()),
      User("Baby Lion", "user 6", "assets/images/baby_lion.jpg",
          'meerkat@gmail.com', 6, 1100, [], [], DateTime.now().toString()),
      User("Dennis Dog", "user 7", "assets/images/dennis_dog.jpg",
          'meerkat@gmail.com', 7, 1000, [], [], DateTime.now().toString()),
      User("Raccon", "user 8", "assets/images/raccoon.jpg", 'meerkat@gmail.com',
          8, 1000, [], [], DateTime.now().toString()),
      User("Raccon", "user 9", "assets/images/raccoon.jpg", 'meerkat@gmail.com',
          9, 1000, [], [], DateTime.now().toString()),
      User("Raccon", "user 10", "assets/images/raccoon.jpg",
          'meerkat@gmail.com', 10, 1000, [], [], DateTime.now().toString()),
    ],
    LeadersType.Week);
