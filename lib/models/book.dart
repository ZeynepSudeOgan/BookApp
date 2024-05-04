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
  String? pageCount;
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
      this.pageCount = "null",
      this.releaseDate = "null",
      this.star = 0.0,
      this.totalUserVoted = 0,
      this.totalVote = 0});
}
