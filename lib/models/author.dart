class Author {
  int? id;
  String? name;
  String? surname;
  String? biography;
  String? imageLink;
  Author(
      {this.id = -1,
      this.name = "null",
      this.surname = "null",
      this.biography = "null",
      this.imageLink =
          "https://galeri.netfotograf.com/images/medium/69433C4D690F8A66.jpg"});

  static Author fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      name: json['name'],
      surname: json['lastname'],
      biography: json['biography'],
      imageLink: json['imageLink'],
    );
  }
}
