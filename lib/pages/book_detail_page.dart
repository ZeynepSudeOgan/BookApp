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
    readStatus = await DataManager.getReadStatusById(1, widget.bookId);
    selectedIndex = ReadStatusEnum.values
        .indexOf(readStatus?.readStatus ?? ReadStatusEnum.none);
    bookStar = await DataManager.getBookStar(1, widget.bookId);
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
                      child: Text(book?.name ?? "null"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: shortInfo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: bookText(),
                    ),
                    ratingBar()
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: Colors.amber,
                unselectedItemColor: Colors.pink,
                currentIndex: selectedIndex,
                onTap: (value) async => await changeReadStatus(value),
                items: ReadStatusEnum.values
                    .map((e) => BottomNavigationBarItem(
                        icon: const Icon(Icons.abc_rounded), label: e.name))
                    .toList()),
          );
  }

  Widget shortInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const Text("Release Date:"),
            Text(book?.releaseDate ?? "Unknown")
          ],
        ),
        InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AuthorPage(authorId: book?.authorId),
          )),
          child: Card(
            child: Column(
              children: [
                const Text("Author:"),
                Text("${author?.name}  ${author?.surname}")
              ],
            ),
          ),
        ),
        Column(
          children: [const Text("Rating"), Text((book?.star ?? -1).toString())],
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
              children: [Flexible(child: Text(book?.description ?? "null"))],
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
      initialRating: (bookStar?.star ?? 0).toDouble(),
      onRatingUpdate: (value) async {
        bookStar?.star = value.round();
        await DataManager.updateStar(bookStar!);
        print("${bookStar?.star} is given to bookId: ${widget.bookId}");
      },
      allowHalfRating: false,
    );
  }

  Widget loadingCase() => const Center(child: CircularProgressIndicator());

  Future<void> changeReadStatus(int index) async {
    selectedIndex = index;
    setState(() {});
    var status = ReadStatusEnum.values[index];
    ReadStatus readStatus =
        ReadStatus(userId: 1, bookId: widget.bookId, readStatus: status);
    await DataManager.updateReadStatus(readStatus);
    print(
        "user: ${readStatus.userId} bookId: ${readStatus.bookId} has readStatus: ${readStatus.readStatus?.name}");
  }
}
