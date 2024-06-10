import 'package:async_builder/async_builder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_project/models/author.dart';
import 'package:db_project/pages/author_page.dart';
import 'package:db_project/utils/data_manager.dart';
import 'package:flutter/material.dart';

class AuthorsTab extends StatefulWidget {
  const AuthorsTab({super.key});

  @override
  State<AuthorsTab> createState() => _AuthorsTabState();
}

class _AuthorsTabState extends State<AuthorsTab> {
  List<Author> authors = [];

  Future<void> getData() async {
    authors = await DataManager.getAuthors();
  }

  @override
  Widget build(BuildContext context) {
    return AsyncBuilder(
      future: getData(),
      builder: (context, value) => Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
              itemBuilder: (context, index) => gridItem(index),
              itemCount: authors.length,
            ),
          ),
        ),
      ]),
    );
  }

  Widget gridItem(int index) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AuthorPage(id: authors[index].id),
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(authors[index].imageLink ??
                "https://www.limonhost.net/makaleler/wp-content/uploads/2020/10/404-not-found-sayfa-bulunamadi-hatasi-ve-cozumu.png"),
          ),
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
                  "${authors[index].name ?? "null"} ${authors[index].surname ?? "null"}",
                ),
              ),
            )),
      ),
    );
  }
}
