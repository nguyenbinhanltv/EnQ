class User {
  final String userName, id, photoUrl;
  final int rank, point;
  // final List<String> textHistory; // TextExamHistory id (dont know)

  // User(this.userName, this.id, this.photoUrl, this.rank, this.point,
  //     this.textHistory);
  User(this.userName, this.id, this.photoUrl, this.rank, this.point);
}

List<User> users = [
  User("Baby Cow", "user 1", "assets/images/baby_cow.jpg", 1, 1500),
  User("Rabbit", "user 2", "assets/images/rabbit.jpg", 2, 1400),
  User("Meerkat", "user 3", "assets/images/meerkat.jpg", 3, 1300),
];
