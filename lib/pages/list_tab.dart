import 'package:async_builder/async_builder.dart';
import 'package:db_project/models/book_simple.dart';
import 'package:db_project/models/read_status.dart';
import 'package:db_project/utils/data_manager.dart';
import 'package:db_project/widgets/horizontal_list.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListTab extends StatelessWidget {
  ListTab({super.key});

  List<BookSimple> readingBooks = [];
  List<BookSimple> readBooks = [];
  List<BookSimple> willReadBooks = [];

  Future<void> getData() async {
    readBooks = await DataManager.getBooksByReadingInfo(1, ReadStatusEnum.read);
    readingBooks =
        await DataManager.getBooksByReadingInfo(1, ReadStatusEnum.reading);
    willReadBooks =
        await DataManager.getBooksByReadingInfo(1, ReadStatusEnum.willRead);
  }

  @override
  Widget build(BuildContext context) {
    return AsyncBuilder(
      waiting: (context) => const CircularProgressIndicator(),
      future: getData(),
      builder: (context, value) => Column(
        children: [
          HorizontalList(categoryName: "Okunacak", list: willReadBooks),
          HorizontalList(categoryName: "Okundu", list: readBooks),
          HorizontalList(categoryName: "Okunuyor", list: readingBooks),
        ],
      ),
    );
  }
}
