// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:db_project/pages/home.dart';
import 'package:db_project/pages/menu.dart';
import 'package:db_project/pages/profile.dart';
import 'package:db_project/pages/search.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
   const FirstPage({super.key});

  @override
  //State<FirstPage> createState() => _FirstPageState();
  // ignore: library_private_types_in_public_api
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages=[
    //Home Page
    const HomePage(),
    //Menu Page
    const MenuPage(),
    //Search Page
    const SearchPage(),
    //Profile Page
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
