class BookSimple {
  int? id;
  String? name;
  String? imageLink;

  BookSimple(
      {this.id = -1,
      this.name = "null",
      this.imageLink =
          "https://galeri.netfotograf.com/images/medium/69433C4D690F8A66.jpg"});

  static BookSimple fromJson(Map<String, dynamic> json) {
    return BookSimple(
        id: json["id"], imageLink: json["imageLink"], name: json["name"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "imageLink": imageLink};
  }
}
