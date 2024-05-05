import 'package:async_builder/async_builder.dart';
import 'package:db_project/models/book.dart';
import 'package:db_project/utils/data_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BookDetailPage extends StatelessWidget {
  BookDetailPage({super.key, required this.bookId});
  static const String routeName = "bookDetail";
  int bookId;
  Book? book;

  Future<void> getData() async {
    book = await DataManager.getBookDetails(bookId);
  }

  @override
  Widget build(BuildContext context) {
    return AsyncBuilder(
      future: getData(),
      builder: (context, value) => Scaffold(
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
                      child: Image.network(
                        "https://www.canyayinlari.com/productimages/117775/original/9789750715709_735.jpg",
                        width: 160,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                //Text("bookId:${book!.name}"),
                const SizedBox(height: 15),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Release Date"),
                        //Text("${book!.releaseDate}")
                      ],
                    ),
                    Column(
                      children: [
                        Text("Author"),
                      ], //yapamadımm ama yşne de yazdım bir şeyler :(
                    ),
                    Column(
                      children: [Text("Rating")],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                 Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    child: Card(
                      color: Colors.grey[900],
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("About Book"),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Flexible(
                                  child: Text("descriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescription"))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Text("Auther part"), 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network("https://i.dr.com.tr/pimages/Content/Uploads/ArtistImages/artist__260259.jpg",
                        width: 160,),
                      ),
                      const Text("Albert Camus"), //buraya nasıl author name çekeceğimi bilmediğim için direkt yazdım
                    ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
