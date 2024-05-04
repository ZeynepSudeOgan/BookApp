import 'package:db_project/models/book.dart';
import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  final List<Book> _books = [
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

  Future<void> init() async {}

  List<Book> get books => _books;
  Book bookById(int id) {
    return _books.where((element) => element.id == id).toList().first;
  }
}
