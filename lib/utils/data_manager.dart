import 'dart:convert';
import 'dart:math';

import 'package:db_project/models/author.dart';
import 'package:db_project/models/book.dart';
import 'package:db_project/models/book_simple.dart';
import 'package:db_project/models/book_star.dart';
import 'package:db_project/models/category.dart';
import 'package:db_project/models/read_status.dart';
import 'package:db_project/models/user.dart';
import 'package:http/http.dart' as http;

class DataManager {
  static String baseUrl = "http://192.168.1.12:3001";

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

  static Future<Book?> getBookDetails(int bookId) async {
    /*
    String url = "$baseUrl/book/$bookId";
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    if (json == null) return null;
    var book = Book.fromJson(json);
    return book;
    */
    var all = await DataManager.getAllBooks();
    return all.where((element) => element.id == bookId).toList().first;
  }

  static Future<Author?> getAuthorById(int? authorId) async {
    /*
    var response = await http.get(Uri.parse("$baseUrl/author/$authorId"));
    var json = jsonDecode(response.body);
    if (json == null) return null;
    return Author.fromJson(json);
    */
    return Author(id: authorId);
  }

  static Future<List<Author>> getAuthors() async {
    return [
      Author(
          id: 1,
          name: "Sami",
          imageLink:
              "https://upload.wikimedia.org/wikipedia/tr/c/ca/Ankaral%C4%B1_Nam%C4%B1k.jpg",
          biography: "Orda burda doğdu, şurda yaişado iırada öldü"),
      Author(
          id: 2,
          name: "Ayşe",
          imageLink:
              "https://upload.wikimedia.org/wikipedia/tr/c/ca/Ankaral%C4%B1_Nam%C4%B1k.jpg",
          biography: "Dünyaya geldiği gibi gitti, arada bir kahve içti."),
      Author(
          id: 3,
          name: "Mehmet",
          imageLink:
              "https://upload.wikimedia.org/wikipedia/tr/c/ca/Ankaral%C4%B1_Nam%C4%B1k.jpg",
          biography:
              "Bazen düşündü, bazen düşündüğünü sandı, sonra uyuyakaldı."),
      Author(
          id: 4,
          name: "Fatma",
          imageLink:
              "https://upload.wikimedia.org/wikipedia/tr/c/ca/Ankaral%C4%B1_Nam%C4%B1k.jpg",
          biography:
              "Hayata gözlerini açtı, sonra kapattı. Arada bir şeyler yedi."),
    ];
  }

  static Future<List<BookSimple>> getAllBooksSimply() async {
    /*
    var response = await http.get(Uri.parse("$baseUrl/bookSimply"));
    List<dynamic> json = jsonDecode(response.body);

    var test = json.map((e) {
      if (e == null) null;
      return BookSimple.fromJson(e);
    }).toList();
    return test;
    */

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

  static Future<List<Category>> getCategories() async {
    /*
    var response = await http.get(Uri.parse("$baseUrl/category"));
    List<dynamic> json = jsonDecode(response.body);
    var test = json.map((e) => Category.fromJson(e)).toList();
    return test;
    */
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
    /*
    var response = await http.get(Uri.parse("$baseUrl/randomBooks"));
    List<dynamic> json = jsonDecode(response.body);
    var test = json.map((e) => BookSimple.fromJson(e)).toList();
    return test;
    */
    var all = await getAllBooksSimply();
    return _getRandomElements<BookSimple>(all, all.length ~/ 2);
  }

  static Future<void> updateStar(BookStar star) async {
    /*
    var body = jsonEncode({
      "userID": star.userId,
      "bookID": star.bookId,
      "star": star.star,
    });
    var response = await http.post(
      Uri.parse("$baseUrl/bookStar"),
      body: body,
      headers: {"Content-Type": "application/json"},
    );
    //TODO: Implement this method
    */
    return;
  }

  static Future<BookStar> getAvgStar(int? bookId) async {
    /*
    var response = await http.get(Uri.parse("$baseUrl/avgStar/$bookId"));
    var json = jsonDecode(response.body);
    if (json == null) return BookStar(userId: -1, bookId: -1, star: 0);
    return BookStar.fromJson(json);
    */
    return BookStar(bookId: bookId, star: 1);
  }

  static Future<BookStar> getBookStar(int? userId, int? bookId) async {
    //TODO: Implement this method
    Random random = Random();
    return BookStar(userId: userId, bookId: bookId, star: random.nextInt(5));
  }

  @Deprecated("Dont need to this method")
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
    /* var response =
        await http.get(Uri.parse("$baseUrl/bookByCategory/${category.id}"));
    List<dynamic> json = jsonDecode(response.body);
    var test = json.map((e) => BookSimple.fromJson(e)).toList();
    return test;
    */
    var books = await getAllBooksSimply();
    return [books[0], books[2], books[5]];
  }

  static Future<List<BookSimple>> getBookSimplesByAuthorId(
      int? authorId) async {
    /* var response = await http.get(Uri.parse("$baseUrl/bookByAuthor/$authorId"));
    List<dynamic> json = jsonDecode(response.body);
    var test = json.map((e) => BookSimple.fromJson(e)).toList();
    return test;
   */
    return await getAllBooksSimply();
  }

  static User testUser =
      User(id: 1, username: "testUser", password: "testUserPass");
  static Future<User?> login(String username, String password) async {
    /* var body = jsonEncode({
      "userName": username,
      "password": password,
    });
    var response = await http.post(
      Uri.parse("$baseUrl/user/login"),
      body: body,
      headers: {"Content-Type": "application/json"},
    );
    var json = jsonDecode(response.body);
    print(json);
    if (json == null) return null;
    return User.fromJson(json);*/
    return testUser;
  }

  @Deprecated("Dont need to this method")
  static Future<User> getUser(String id) async {
    var response = await http.get(Uri.parse("$baseUrl/user/$id"));
    var json = jsonDecode(response.body);

    return testUser;
  }

  static Future<void> updateUser(User updated) async {
    //TODO: Implement this method
  }

  static Future<User?> register(User newUser) async {
    /*
    var body = jsonEncode({
      "userName": newUser.username,
      "password": newUser.password,
    });
    var response = await http.post(
      Uri.parse("$baseUrl/user/register"),
      body: body,
      headers: {"Content-Type": "application/json"},
    );
    var json = jsonDecode(response.body);
    if (json == null) return null;
    return User.fromJson(json);
    */
    return testUser;
  }
}
