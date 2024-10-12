import 'package:flutter/material.dart';

import '../screens/about_screen.dart';
import '../screens/catalog_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  static const List<Widget> _screens = <Widget>[
    HomePage(),
    AboutPage(),
  ];

  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        child: IndexedStack(
          index: _selectedTabIndex,
          children: _screens,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          )
        ],
        elevation: 10,
        currentIndex: _selectedTabIndex,
        onTap: _onTabItemTapped,
      ),
    );
  }

  void _onTabItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }
}
