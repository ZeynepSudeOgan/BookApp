import 'dart:math';

import 'package:db_project/models/book.dart';
import 'package:db_project/models/book_simple.dart';
import 'package:db_project/models/category.dart';

class DataManager {
  @Deprecated("Dont need to this method")
  static Future<List<Book>> getAllBooks() async {
    return [
      Book(
          id: 1,
          name: "Test1",
          imageLink: "https://cdn.langeek.co/photo/26013/original/as"),
      Book(
          id: 2,
          name: "Test2",
          imageLink: "https://i.ytimg.com/vi/JB-pWHCJM3Y/sddefault.jpg"),
      Book(
          id: 3,
          name: "Test3",
          imageLink:
              "https://pbs.twimg.com/profile_images/1257933432916783104/i9FaYvr2_400x400.jpg"),
      Book(
          id: 4,
          name: "Test4",
          imageLink:
              "https://avatars.mds.yandex.net/i?id=b9202cb7e138c39570e927a111d20cf081b2f4af-12365785-images-thumbs&n=13"),
      Book(
          id: 5,
          name: "Test5",
          imageLink:
              "https://c12.incisozluk.co/res/incisozluk//11509/2/1807822_o2efd.jpg"),
      Book(
          id: 6,
          name: "Test6",
          imageLink:
              "https://www.indyturk.com/sites/default/files/styles/1368x911/public/article/main_image/2021/08/06/725336-391754488.jpg?itok=i_XFGYKK"),
    ];
  }

  static Future<Book> getBookDetails(int bookId) async {
    var all = await DataManager.getAllBooks();

    return all.where((element) => element.id == bookId).toList().first;
  }

  static Future<List<BookSimple>> getAllBooksSimply() async {
    return [
      BookSimple(
          id: 1,
          name: "Test1",
          imageLink: "https://cdn.langeek.co/photo/26013/original/as"),
      BookSimple(
          id: 2,
          name: "Test2",
          imageLink: "https://i.ytimg.com/vi/JB-pWHCJM3Y/sddefault.jpg"),
      BookSimple(
          id: 3,
          name: "Test3",
          imageLink:
              "https://pbs.twimg.com/profile_images/1257933432916783104/i9FaYvr2_400x400.jpg"),
      BookSimple(
          id: 4,
          name: "Test4",
          imageLink:
              "https://avatars.mds.yandex.net/i?id=b9202cb7e138c39570e927a111d20cf081b2f4af-12365785-images-thumbs&n=13"),
      BookSimple(
          id: 5,
          name: "Test5",
          imageLink:
              "https://c12.incisozluk.co/res/incisozluk//11509/2/1807822_o2efd.jpg"),
      BookSimple(
          id: 6,
          name: "Test6",
          imageLink:
              "https://www.indyturk.com/sites/default/files/styles/1368x911/public/article/main_image/2021/08/06/725336-391754488.jpg?itok=i_XFGYKK"),
    ];
  }

  static Future<List<Category>> getCategoryNames() async {
    return [
      Category(
          id: 1,
          name: "Fiction",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 2,
          name: "Non-fiction",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 3,
          name: "Mystery",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 4,
          name: "Science Fiction",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 5,
          name: "Fantasy",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 6,
          name: "Romance",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 7,
          name: "Historical Fiction",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 8,
          name: "Horror",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 9,
          name: "Biography",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 10,
          name: "Autobiography",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 11,
          name: "Self-help",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 12,
          name: "Travel",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 13,
          name: "Science",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 14,
          name: "Philosophy",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
    ];
  }

  static Future<List<BookSimple>> getRecommandations() async {
    var all = await getAllBooksSimply();
    return _getRandomElements<BookSimple>(all, all.length ~/ 2);
  }

  static List<T> _getRandomElements<T>(List<T> list, int count) {
    if (list.length <= count) {
      return List<T>.from(list);
    } else {
      Random random = Random();
      List<T> copy = List.from(list);
      List<T> randomElements = [];
      for (int i = 0; i < count; i++) {
        int randomIndex = random.nextInt(copy.length);
        randomElements.add(copy[randomIndex]);
        copy.removeAt(randomIndex);
      }
      return randomElements;
    }
  }

  static Future<List<BookSimple>> getBooksByCategory(Category category) async {
    var books = await getAllBooksSimply();
    return [books[0], books[2], books[5]];
  }

  static Future<List<BookSimple>> getReadBooks(int userID) async {
    var books = await getAllBooksSimply();
    return [books[1], books[4], books[2]];
  }

  static Future<List<BookSimple>> getWillReadBooks(int userID) async {
    var books = await getAllBooksSimply();
    return [books[2], books[3], books[5], books[1]];
  }

  static Future<List<BookSimple>> getReadingBooks(int userID) async {
    var books = await getAllBooksSimply();
    return [books[1], books[2], books[3], books[4], books[5]];
  }
}
