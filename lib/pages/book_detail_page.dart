import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_project/models/user.dart';
import 'package:db_project/utils/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:db_project/models/author.dart';
import 'package:db_project/models/book.dart';
import 'package:db_project/models/book_star.dart';
import 'package:db_project/pages/author_page.dart';
import 'package:db_project/utils/data_manager.dart';
import 'package:provider/provider.dart';

class BookDetailPage extends StatefulWidget {
  BookDetailPage({super.key, required this.bookId});
  static const String routeName = "bookDetail";
  int bookId;

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  Book? book;
  double? bookStar;
  Author? author;
  BookStar? userBookStar;
  bool isLoading = false;
  UserProvider? userProvider;
  User? user;
  @override
  void initState() {
    super.initState();
    isLoading = true;
    getData().then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }

  Future<void> getData() async {
    book = await DataManager.getBookDetails(widget.bookId);
    bookStar = await DataManager.getAvgStar(widget.bookId);
    if (user?.id != null) {
      userBookStar = await DataManager.getBookStar(user!.id, widget.bookId);
    }
    if (book?.authorId != null && book!.authorId != -1) {
      author = await DataManager.getAuthorById(book!.authorId);
    }
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    user = userProvider!.user;
    return isLoading
        ? loadingCase()
        : Scaffold(
            appBar: AppBar(
              title: Text(book?.name ?? "Kitap Detayları"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWideScreen = constraints.maxWidth > 600;

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: book?.imageLink ?? "",
                              width: isWideScreen ? 200 : 160,
                              height: isWideScreen ? 300 : 240,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          book?.name ?? "null",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        isWideScreen
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  shortInfo(),
                                  ratingBar(),
                                ],
                              )
                            : Column(
                                children: [
                                  shortInfo(),
                                  const SizedBox(height: 8),
                                  ratingBar(),
                                ],
                              ),
                        const SizedBox(height: 16),
                        bookText(),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
  }

  Widget shortInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        infoCard(
            "Release Date:", book?.releaseDate?.substring(0, 4) ?? "Unknown"),
        InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AuthorPage(id: book?.authorId),
          )),
          child: infoCard("Author:", "${author?.name} ${author?.surname}"),
        ),
        infoCard("Rating:", (bookStar ?? 0).toString()),
      ],
    );
  }

  Widget infoCard(String title, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(title),
            Text(value, maxLines: null),
          ],
        ),
      ),
    );
  }

  Widget bookText() {
    return Card(
      color: Colors.grey[800],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "About Book",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              book?.description ?? "null",
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget ratingBar() {
    return RatingBar.builder(
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      initialRating: double.parse((userBookStar?.star ?? 0).toString()),
      onRatingUpdate: (value) async {
        userBookStar?.star = value.round();
        inspect(userBookStar);
        await DataManager.updateStar(userBookStar!);
      },
      allowHalfRating: false,
    );
  }

  Widget loadingCase() => const Center(child: CircularProgressIndicator());
}
