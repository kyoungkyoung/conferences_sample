class Conferences{
  String name;
  String link;
  String start;
  String end;
  String location;

  Conferences(this.name, this.link, this.start, this.end, this.location);

  Conferences.fromJson(Map<String, dynamic> json){
    name = json['name'];
    link = json['link'];
    start = json['start'];
    end = json['end'];
    location = json['location'];
  }

  // @override
  // String toString() {
  //   return super.toString();
  // }

}