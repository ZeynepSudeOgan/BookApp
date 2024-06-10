import 'package:async_builder/async_builder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_project/models/author.dart';
import 'package:db_project/models/book_simple.dart';
import 'package:db_project/pages/book_detail_page.dart';
import 'package:db_project/utils/data_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // If you're using GoogleFonts

class AuthorPage extends StatelessWidget {
  final int? id;
  Author? author;
  List<BookSimple> books = [];

  AuthorPage({super.key, required this.id});

  Future<void> getData() async {
    author = await DataManager.getAuthorById(id);
    books = await DataManager.getBookSimplesByAuthorId(id);
  }

  @override
  Widget build(BuildContext context) {
    return AsyncBuilder(
      future: getData(),
      waiting: (context) => const Center(child: CircularProgressIndicator()),
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          title: Text("${author?.name ?? ""} ${author?.surname ?? ""}"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (author!.imageLink != null)
                Hero(
                  tag: author!.id!,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: author!.imageLink!,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                )
              else
                const Icon(Icons.person, size: 150),
              const SizedBox(height: 20),
              Text(
                "${author!.name ?? ""} ${author!.surname ?? ""}",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                author!.biography ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                "Kitapları",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Flexible(
                // Use Flexible for the GridView
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10, // Horizontal spacing
                    mainAxisSpacing: 10, // Vertical spacing - Adjust this value
                    childAspectRatio: 2 / 3,
                  ),
                  itemCount: books.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BookDetailPage(bookId: books[index].id ?? -1),
                      ),
                    ),
                    child: _buildBookCard(books[index]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Kitap kartı widget'ı
  Widget _buildBookCard(BookSimple book) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch to fill width
      children: [
        Expanded(
          // Allow image to expand to fill available space
          child: CachedNetworkImage(
            imageUrl: book.imageLink ?? "https://via.placeholder.com/160",
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            book.name ?? "",
            style: const TextStyle(fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
