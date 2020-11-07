class User {
  final String userName, id, photoUrl, email;
  final int rank, point;
  final List<String> testHistory;
  final List<User> friend;

  User(this.userName, this.id, this.photoUrl, this.email, this.rank, this.point,
      this.testHistory, this.friend);

  static List<User> friends = [
    User("Baby Cow", "user 1", "assets/images/baby_cow.jpg",
        'meerkat@gmail.com', 1, 1500, [], []),
    User("Rabbit", "user 2", "assets/images/rabbit.jpg", 'meerkat@gmail.com', 2,
        1400, [], []),
    User("Penguin", "user 3", "assets/images/penguin.jpg", 'meerkat@gmail.com',
        3, 1350, [], []),
    User("Baby Cow", "user 1", "assets/images/baby_cow.jpg",
        'meerkat@gmail.com', 1, 1500, [], []),
    User("Rabbit", "user 2", "assets/images/rabbit.jpg", 'meerkat@gmail.com', 2,
        1400, [], []),
    User("Penguin", "user 3", "assets/images/penguin.jpg", 'meerkat@gmail.com',
        3, 1350, [], []),
    User("Baby Cow", "user 1", "assets/images/baby_cow.jpg",
        'meerkat@gmail.com', 1, 1500, [], []),
    User("Rabbit", "user 2", "assets/images/rabbit.jpg", 'meerkat@gmail.com', 2,
        1400, [], []),
    User("Penguin", "user 3", "assets/images/penguin.jpg", 'meerkat@gmail.com',
        3, 1350, [], []),
    User("Baby Cow", "user 1", "assets/images/baby_cow.jpg",
        'meerkat@gmail.com', 1, 1500, [], []),
    User("Rabbit", "user 2", "assets/images/rabbit.jpg", 'meerkat@gmail.com', 2,
        1400, [], []),
    User("Penguin", "user 3", "assets/images/penguin.jpg", 'meerkat@gmail.com',
        3, 1350, [], []),
    null
  ]; // when get friends array, remember to add an null.
}

User recentUser = User("Baby Cow", "user 1", "assets/images/baby_cow.jpg",
    'meerkat@gmail.com', 1, 1500, [], []);
