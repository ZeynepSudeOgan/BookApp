import 'package:db_project/widgets/horizontal_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class ListTab extends StatelessWidget {
  ListTab({super.key});

  List<String> dummyList = [
    "Kitap1",
    "Kitap2",
    "Kitap1",
    "Kitap1",
    "Kitap2",
    "Kitap1",
    "Kitap1",
    "Kitap1",
    "Kitap2",
    "Kitap1",
    "Kitap2",
    "Kitap1",
    "Kitap2",
    "Kitap2"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HorizontalList(
          categoryName: "Okunacak",
          list: dummyList,
        ),
        HorizontalList(categoryName: "Okundu", list: dummyList),
        HorizontalList(categoryName: "Okunuyor", list: dummyList),
      ],
    );
  }
}
