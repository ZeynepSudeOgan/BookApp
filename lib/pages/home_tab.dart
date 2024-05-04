import 'dart:math';

import 'package:db_project/models/book.dart';
import 'package:db_project/pages/book_detail_page.dart';
import 'package:db_project/utils/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  DataProvider? dataProvider;
  List<Book> books = [];
  List<Book> recommendations = [];
  @override
  Widget build(BuildContext context) {
    dataProvider = Provider.of<DataProvider>(context);
    books = dataProvider!.books;
    recommendations = getRandomElements(books, books.length ~/ 2);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
      itemBuilder: (context, index) => gridItem(context, index),
      itemCount: recommendations.length,
    );
  }

  Widget gridItem(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        if (recommendations[index].id != null) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BookDetailPage(bookId: recommendations[index].id!),
          ));
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              fit: BoxFit.cover,
              opacity: .4,
              image: NetworkImage(recommendations[index].imageLink ??
                  "https://www.limonhost.net/makaleler/wp-content/uploads/2020/10/404-not-found-sayfa-bulunamadi-hatasi-ve-cozumu.png")),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: Text(
                  recommendations[index].name ?? "null",
                ),
              ),
            )),
      ),
    );
  }

  List<T> getRandomElements<T>(List<T> list, int count) {
    if (list.length <= count) {
      return List<T>.from(list);
    } else {
      Random random = Random();
      List<T> copy = List.from(list);
      List<T> randomElements = [];
      for (int i = 0; i < count; i++) {
        int randomIndex = random.nextInt(copy.length);
        randomElements.add(copy[randomIndex]);
        copy.removeAt(randomIndex);
      }
      return randomElements;
    }
  }
}
