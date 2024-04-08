import 'dart:ui';

import 'package:db_project/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: must_be_immutable
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    double searchBookHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Search",
                              suffixIcon: Icon(
                                Icons.search,
                                color: Colors.deepPurple,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: searchBookHeight,
                  width: 390,
                  child: ListView.builder(
                      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior
                          .onDrag, //Ekranı kaydırmaya başlayınca textfieldin kapanması için
                      itemBuilder: (context, index) => Container(
                            height: 200,
                            width: 200,
                            margin: const EdgeInsets.all(10),
                            color: Colors.black26,
                          )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
