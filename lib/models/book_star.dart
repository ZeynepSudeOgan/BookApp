class BookStar {
  int? userId;
  int? bookId;
  int? star;
  BookStar({this.userId = -1, this.bookId = -1, this.star = 0});

  static BookStar fromJson(Map<String, dynamic> json) {
    return BookStar(
      userId: json['userID'],
      bookId: json['bookID'],
      star: json['star'],
    );
  }
}
