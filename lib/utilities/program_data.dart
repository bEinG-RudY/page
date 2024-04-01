class ProgramData {
  DateTime? createdAt;
  int? id;
  int? lesson;
  String? name;
  String? category;

  ProgramData({this.createdAt, this.id, this.lesson, this.name, this.category});

  ProgramData.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    id = json['id'];
    lesson = json['lesson'];
    name = json["name"];
    category = json['category'];
  }
}
