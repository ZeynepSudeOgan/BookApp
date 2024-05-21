import 'package:async_builder/async_builder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_project/models/book_simple.dart';
import 'package:db_project/models/category.dart';
import 'package:db_project/pages/book_detail_page.dart';
import 'package:db_project/utils/data_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryBookListPage extends StatefulWidget {
  CategoryBookListPage({super.key, required this.category});
  Category category;
  @override
  State<CategoryBookListPage> createState() => _CategoryBookListPageState();
}

class _CategoryBookListPageState extends State<CategoryBookListPage> {
  List<BookSimple> books = [];
  Future<void> getData() async {
    books = await DataManager.getBooksByCategory(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return AsyncBuilder(
      future: getData(),
      waiting: (context) => const CircularProgressIndicator(),
      builder: (context, value) => Scaffold(
        appBar: AppBar(),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
          itemBuilder: (context, index) => gridItem(context, index),
          itemCount: books.length,
        ),
      ),
    );
  }

  Widget gridItem(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        if (books[index].id != null) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BookDetailPage(bookId: books[index].id!),
          ));
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              fit: BoxFit.cover,
              opacity: .4,
              image: CachedNetworkImageProvider(books[index].imageLink ??
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
                  books[index].name ?? "null",
                ),
              ),
            )),
      ),
    );
  }
}
