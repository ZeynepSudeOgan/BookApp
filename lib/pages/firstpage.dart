// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:db_project/pages/home.dart';
import 'package:db_project/pages/menu.dart';
import 'package:db_project/pages/profile.dart';
import 'package:db_project/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
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
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: HexColor("#FCF5E5"),
        items: [
          Icon(Icons.home,
              color: _selectedIndex == 0 ? Colors.black45 : Colors.black26),
          Icon(Icons.menu,
              color: _selectedIndex == 1 ? Colors.black45 : Colors.black26),
          Icon(Icons.search,
              color: _selectedIndex == 2 ? Colors.black45 : Colors.black26),
        ],
      ),
    );
  }
}
