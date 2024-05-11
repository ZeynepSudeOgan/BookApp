import 'package:async_builder/async_builder.dart';
import 'package:db_project/models/category.dart';
import 'package:db_project/pages/category_book_list.dart';
import 'package:db_project/utils/data_manager.dart';
import 'package:flutter/material.dart';

class CategoryTab extends StatefulWidget {
  const CategoryTab({super.key});

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  List<Category> categoryNames = [];

  Future<void> getData() async {
    categoryNames = await DataManager.getCategories();
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
              itemCount: categoryNames.length,
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
          builder: (context) =>
              CategoryBookListPage(category: categoryNames[index]),
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(categoryNames[index].imageLink ??
                "https://www.limonhost.net/makaleler/wp-content/uploads/2020/10/404-not-found-sayfa-bulunamadi-hatasi-ve-cozumu.png"),
          ),
        ),
        child: Center(child: Text(categoryNames[index].name ?? "null")),
      ),
    );
  }
}
