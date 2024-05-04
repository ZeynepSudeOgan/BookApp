import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:db_project/pages/category_tab.dart';
import 'package:db_project/pages/drawer_child.dart';
import 'package:db_project/pages/home_tab.dart';
import 'package:db_project/pages/list_tab.dart';
import 'package:db_project/widgets/custom_search_delegate.dart';
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
      drawer: const SafeArea(
        child: Drawer(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(20))),
            child: DrawerChild()),
      ),
      appBar: AppBar(
        title: Text(appbarTitle()),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
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

  String appbarTitle() {
    switch (currentIndex) {
      case 0:
        return "Recommandations";
      case 1:
        return "My List";
      case 2:
        return "Categories";
      default:
        return "Recommandations";
    }
  }
}
