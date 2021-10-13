class Conference {
  late String name;
  late String link;
  late String start;
  late String end;
  late String location;

  Conference(
      {required this.name,
      required this.link,
      required this.start,
      required this.end,
      required this.location});

  Conference.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    link = json['link'];
    start = json['start'];
    end = json['end'];
    location = json['location'];
  }
}
