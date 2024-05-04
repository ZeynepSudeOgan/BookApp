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

  Book({required this.id, required this.name, required this.imageLink});
}
