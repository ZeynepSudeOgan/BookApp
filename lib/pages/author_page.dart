import 'package:db_project/models/book_simple.dart';
import 'package:db_project/utils/data_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthorPage extends StatefulWidget {
  int? authorId;
  AuthorPage({super.key, required this.authorId});

  @override
  State<AuthorPage> createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {
  List<BookSimple> books = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    isLoading = true;
    DataManager.getBooksByAuthorId(widget.authorId).then((value) {
      setState(() {
        books = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
