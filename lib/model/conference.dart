class Conference {
  String name;
  String link;
  String start;
  String end;
  String location;

  Conference(this.name, this.link, this.start, this.end, this.location);

  Conference.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    link = json['link'];
    start = json['start'];
    end = json['end'];
    location = json['location'];
  }
}
