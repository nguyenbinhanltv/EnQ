class Recent {
  final String userName, photoUrl, endAt, date;
  final int point;

  Recent(this.userName, this.photoUrl, this.endAt, this.date, this.point);
}

List<Recent> recents = [
  Recent("Akita", "assets/images/bear.jpg", "12:30", "Aug 18,2020", 10),
  Recent("Akita", "assets/images/rabbit.jpg", "12:30", "Aug 18,2020", 10),
  Recent("Akita", "assets/images/baby_cow.jpg", "12:30", "Aug 18,2020", 10),
];
