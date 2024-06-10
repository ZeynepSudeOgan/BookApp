import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_project/models/author.dart';
import 'package:db_project/models/book.dart';
import 'package:db_project/models/book_star.dart';
import 'package:db_project/models/read_status.dart';
import 'package:db_project/pages/author_page.dart';
import 'package:db_project/utils/data_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: must_be_immutable
class BookDetailPage extends StatefulWidget {
  BookDetailPage({super.key, required this.bookId});
  static const String routeName = "bookDetail";
  int bookId;

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  Book? book;
  int selectedIndex = 0;
  ReadStatus? readStatus;
  bool isLoading = false;
  BookStar? bookStar;
  Author? author;
  BookStar? userBookStar;

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
    selectedIndex = ReadStatusEnum.values
        .indexOf(readStatus?.readStatus ?? ReadStatusEnum.none);
    bookStar = await DataManager.getAvgStar(widget.bookId);
    userBookStar = await DataManager.getBookStar(1, widget.bookId);
    author = await DataManager.getAuthorById(book?.authorId ?? -1);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? loadingCase()
        : Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: book?.imageLink ??
                                "https://www.limonhost.net/makaleler/wp-content/uploads/2020/10/404-not-found-sayfa-bulunamadi-hatasi-ve-cozumu.png",
                            width: 160,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        book?.name ?? "null",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: shortInfo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ratingBar(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: bookText(),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Widget shortInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Release Date:"),
                Text(
                  book?.releaseDate?.substring(0, 4) ?? "Unknown",
                  maxLines: null,
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AuthorPage(id: book?.authorId),
          )),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text("Author:"),
                  Text("${author?.name}  ${author?.surname}", maxLines: null)
                ],
              ),
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Rating"),
                Text(
                  (bookStar ?? -1).toString(),
                  maxLines: null,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget bookText() {
    return Card(
      color: Colors.grey[800],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("About Book"),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [Flexible(child: Text(book?.description ?? ("null")))],
            )
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
      initialRating: (userBookStar?.star ?? 0).toDouble(),
      onRatingUpdate: (value) async {
        bookStar?.star = value.round();
        await DataManager.updateStar(bookStar!);
        print("${bookStar?.star} is given to bookId: ${widget.bookId}");
      },
      allowHalfRating: false,
    );
  }

  Widget loadingCase() => const Center(child: CircularProgressIndicator());
}
