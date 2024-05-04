import 'package:async_builder/async_builder.dart';
import 'package:db_project/models/book.dart';
import 'package:db_project/utils/data_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BookDetailPage extends StatelessWidget {
  BookDetailPage({super.key, required this.bookId});
  static const String routeName = "bookDetail";
  int bookId;
  Book? book;

  Future<void> getData() async {
    book = await DataManager.getBookDetails(bookId);
  }

  @override
  Widget build(BuildContext context) {
    return AsyncBuilder(
      future: getData(),
      builder: (context, value) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text("bookId:${book?.name ?? "null"}"),
        ),
      ),
    );
  }
}
