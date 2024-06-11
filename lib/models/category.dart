class Category {
  int? id;
  String? name;
  String? imageLink;
  Category({required this.id, required this.name, required this.imageLink});

  static Category fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      imageLink: json["imageLink"],
    );
  }
}
