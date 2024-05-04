import 'package:async_builder/async_builder.dart';
import 'package:db_project/models/book.dart';
import 'package:db_project/pages/book_detail_page.dart';
import 'package:db_project/utils/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSearchDelegate extends SearchDelegate {
  DataProvider? dataProvider;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Search Results: $query'),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  List<Book> books = [];
  @override
  Widget buildSuggestions(BuildContext context) {
    dataProvider = Provider.of<DataProvider>(context, listen: false);
    books = dataProvider!.books;

    return AsyncBuilder(
      future: prepareSuggestionList(),
      builder: (context, value) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          itemCount: value?.length ?? 0,
          itemBuilder: (context, index) => listItem(context, value?[index]),
        ),
      ),
    );
  }

  Future<List<Book?>> prepareSuggestionList() async {
    List<Book> suggestions = (query.isEmpty
        ? books.where((element) => element.name != null).toList()
        : books
            .where((element) => element.name != null)
            .where((element) =>
                element.name!.toLowerCase().startsWith(query.toLowerCase()))
            .toList());
    return suggestions;
  }

  Widget listItem(BuildContext context, Book? book) {
    if (book != null) {
      return Card(
        color: Colors.grey[0],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(book.name ?? "null"),
            onTap: () {
              if (book.id != null) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BookDetailPage(bookId: book.id!)));
              }
            },
          ),
        ),
      );
    }
    return const ListTile(
      title: Text("null"),
    );
  }
}
