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
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Search",
                      labelStyle: TextStyle(color: Colors.black),
                      hintStyle: TextStyle(color: Colors.black),
                      floatingLabelStyle: TextStyle(color: Colors.black),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.deepPurple,
                      )),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 3 / 4),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemBuilder: (context, index) => listItem(context),
                  itemCount: 5,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        color: Colors.black87, //black38
        child: Stack(
          children: [  
             Container(
              decoration: const BoxDecoration(
                color: Colors.black87,
                image: DecorationImage(
                  image: NetworkImage(
                    "https://www.bilgiyayinevi.com.tr/u/bilgiyayinevi/img/a/c/u/cumhuriyet-turk-mucizesi-birinci-kitap3a00f124bcfa8362a05ca538cc6953bd.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Positioned(
                bottom: 20,
                right: 10,
                left: 10,
                child: Text(
                  "Cumhuriyet Türk Mucizesi",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    backgroundColor: Colors.amber,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: null,
                ))
          ],
        ),
     ),
);
}
}
