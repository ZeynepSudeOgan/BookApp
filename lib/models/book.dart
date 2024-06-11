class Book {
  int? id;
  int? authorId;
  int? categoryId;
  int? publisherId;
  int? typeId;
  int? languageId;
  String? name;
  String? description;
  String? isbn;
  String? imageLink;
  String? releaseDate;
  int? pageCount;
  int? totalVote;
  int? totalUserVoted;
  double? star;

  Book(
      {this.id = -1,
      this.authorId = -1,
      this.categoryId = -1,
      this.publisherId = -1,
      this.typeId = -1,
      this.languageId = -1,
      this.name = "null",
      this.imageLink = "null",
      this.description = "null",
      this.isbn = "null",
      this.pageCount = -1,
      this.releaseDate = "null",
      this.star = 0.0,
      this.totalUserVoted = 0,
      this.totalVote = 0});

  static Book fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      authorId: json["authorId"],
      publisherId: json['publisherId'],
      languageId: json['languageId'],
      name: json['name'],
      description: json['description'],
      isbn: json['isbn'],
      imageLink: json['imageLink'],
      releaseDate: json['releaseDate'],
      pageCount: json['pageCount'],
    );
  }
}
