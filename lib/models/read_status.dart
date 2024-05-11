class ReadStatus {
  int? userId;
  int? bookId;
  ReadStatusEnum? readStatus;
  ReadStatus(
      {this.userId = -1,
      this.bookId = -1,
      this.readStatus = ReadStatusEnum.none});
}

enum ReadStatusEnum { read, willRead, reading, none }
