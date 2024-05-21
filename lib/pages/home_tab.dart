import 'package:async_builder/async_builder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_project/models/book_simple.dart';
import 'package:db_project/pages/book_detail_page.dart';
import 'package:db_project/utils/data_manager.dart';
import 'package:db_project/utils/providers/data_provider.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  DataProvider? dataProvider;
  List<BookSimple> recommendations = [];

  Future<void> getRecommandations() async {
    recommendations = await DataManager.getRecommandations();
  }

  @override
  Widget build(BuildContext context) {
    return AsyncBuilder(
      future: getRecommandations(),
      waiting: (context) => const CircularProgressIndicator(),
      builder: (context, value) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
        itemBuilder: (context, index) => gridItem(context, index),
        itemCount: recommendations.length,
      ),
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
              image: CachedNetworkImageProvider(recommendations[index]
                      .imageLink ??
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
}
