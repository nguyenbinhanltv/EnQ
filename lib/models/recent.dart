class Recent {
  final String userName, photoUrl, endAt, date, point;

  Recent(this.userName, this.photoUrl, this.endAt, this.date, this.point);

  static List<Recent> recents = [
    Recent("Akita", "assets/images/baby_lion.jpg", "12:30", "Aug 18,2020",
        "10/10"),
    Recent("Akita", "assets/images/baby_lion.jpg", "12:30", "Aug 18,2020",
        "10/10"),
    Recent("Akita", "assets/images/baby_lion.jpg", "12:30", "Aug 18,2020",
        "10/10"),
  ];
}
