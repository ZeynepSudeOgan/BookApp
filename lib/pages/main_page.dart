import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:db_project/pages/category_tab.dart';
import 'package:db_project/pages/home_tab.dart';
import 'package:db_project/pages/list_tab.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const String routeName = "main";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget? body;
  int currentIndex = 0;

  @override
  void initState() {
    buildBody();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("current index: ${currentIndex.toRadixString(2)}"),
      ),
      body: body,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black12,
        color: Colors.black,
        items: const [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.menu, color: Colors.white),
          Icon(Icons.search, color: Colors.white),
        ],
        index: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
            buildBody();
          });
        },
      ),
    );
  }

  void buildBody() {
    switch (currentIndex) {
      case 0:
        body = const HomeTab();
        break;
      case 1:
        body = ListTab();
        break;
      case 2:
        body = const CategoryTab();
        break;
      default:
        body = const HomeTab();
        break;
    }
  }
}
