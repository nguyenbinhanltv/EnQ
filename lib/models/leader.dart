import 'package:EnQ/models/user.dart';

enum LeadersType { Week, Day }

class Leader {
  final String id, startAt, endAt;
  final List<dynamic> users;
  final int type;
  Leader(this.id, this.startAt, this.endAt, this.users, this.type);

  factory Leader.fromJson(Map<dynamic, dynamic> json) {
    return Leader(
      json['data']['_id'],
      json['data']['startAt'].toString(),
      json['data']['endAt'].toString(),
      json['data']['users'],
      json['data']['type'],
    );
  }

  static Leader leaderDay = Leader(
      "id 2",
      "November, 2020",
      "December, 2020",
      [
        {
          'displayName': 'Baby Cow',
          'point': 200,
          'rank': 3,
          'photoURL':
              'https://i.pinimg.com/564x/d0/0c/c3/d00cc3510d3e15135f54767191947e05.jpg'
        },
        {
          'displayName': 'Baby Cow',
          'point': 200,
          'rank': 3,
          'photoURL':
              'https://i.pinimg.com/564x/d0/0c/c3/d00cc3510d3e15135f54767191947e05.jpg'
        },
        {
          'displayName': 'Baby Cow',
          'point': 200,
          'rank': 3,
          'photoURL':
              'https://i.pinimg.com/564x/d0/0c/c3/d00cc3510d3e15135f54767191947e05.jpg'
        },
        {
          'displayName': 'Baby Cow',
          'point': 200,
          'rank': 3,
          'photoURL':
              'https://i.pinimg.com/564x/d0/0c/c3/d00cc3510d3e15135f54767191947e05.jpg'
        },
        {
          'displayName': 'Baby Cow',
          'point': 200,
          'rank': 3,
          'photoURL':
              'https://i.pinimg.com/564x/d0/0c/c3/d00cc3510d3e15135f54767191947e05.jpg'
        },
        {
          'displayName': 'Baby Cow',
          'point': 200,
          'rank': 3,
          'photoURL':
              'https://i.pinimg.com/564x/d0/0c/c3/d00cc3510d3e15135f54767191947e05.jpg'
        },
        {
          'displayName': 'Baby Cow',
          'point': 200,
          'rank': 3,
          'photoURL':
              'https://i.pinimg.com/564x/d0/0c/c3/d00cc3510d3e15135f54767191947e05.jpg'
        },
        {
          'displayName': 'Baby Cow',
          'point': 200,
          'rank': 3,
          'photoURL':
              'https://i.pinimg.com/564x/d0/0c/c3/d00cc3510d3e15135f54767191947e05.jpg'
        },
        {
          'displayName': 'Baby Cow',
          'point': 200,
          'rank': 3,
          'photoURL':
              'https://i.pinimg.com/564x/d0/0c/c3/d00cc3510d3e15135f54767191947e05.jpg'
        },
        {
          'displayName': 'Baby Cow',
          'point': 200,
          'rank': 3,
          'photoURL':
              'https://i.pinimg.com/564x/d0/0c/c3/d00cc3510d3e15135f54767191947e05.jpg'
        }
      ],
      1);

  static Leader leaderWeek = Leader(
      "id 1",
      "November, 2020",
      "December, 2020",
      [
        User("Rabbit", "user 1", "assets/images/rabbit.jpg",
            'meerkat@gmail.com', 1, 1500, [], [], DateTime.now().toString()),
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
        User("Raccon", "user 8", "assets/images/raccoon.jpg",
            'meerkat@gmail.com', 8, 1000, [], [], DateTime.now().toString()),
        User("Raccon", "user 9", "assets/images/raccoon.jpg",
            'meerkat@gmail.com', 9, 1000, [], [], DateTime.now().toString()),
        User("Raccon", "user 10", "assets/images/raccoon.jpg",
            'meerkat@gmail.com', 10, 1000, [], [], DateTime.now().toString()),
      ],
      0);
}
