import 'package:db_project/models/book.dart';
import 'package:db_project/utils/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BookDetailPage extends StatelessWidget {
  BookDetailPage({super.key, required this.bookId});
  static const String routeName = "bookDetail";
  int bookId;
  DataProvider? provider;
  Book? book;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<DataProvider>(context);
    book = provider!.bookById(bookId);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("bookId:${book!.name}"),
      ),
    );
  }
}
