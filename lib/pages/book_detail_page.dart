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
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "https://www.canyayinlari.com/productimages/117775/original/9789750715709_735.jpg",
                          width: 160,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Text("bookId:${book!.name ?? "null"}"),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Release Date:${book!.releaseDate}"),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Author:${book!.authorId}"),
                      ], //yapamadımm ama yşne de yazdım bir şeyler :(
                    ),
                    Column(
                      children: [Text("Rating:${book!.totalVote}")],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text("About Book"),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Flexible(
                              child: Text("description:${book!.description}"))
                        ],
                      )
                    ],
                  ),
                ),
                const Text("Auther")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
