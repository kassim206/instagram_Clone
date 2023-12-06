import 'package:flutter/material.dart';
import 'package:task3/post_Screen/PostPage.dart';
import 'package:task3/home_Screen/home.dart';
import 'package:task3/profilr_Screen/profile.dart';

import '../post_Screen/Postuploud.dart';
import '../post_Screen/feedStrem.dart';
import '../post_Screen/search_post.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedTab = 0;

  List _pages = [
    MyApp6(),
    FeedScreen(),
    PostUploding(),
    proverified(),
    SearchPost(),

  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Upload"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Users"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Settings"),
        ],
      ),
    );
  }
}
