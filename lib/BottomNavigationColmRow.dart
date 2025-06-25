import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationColmRow extends StatefulWidget {
  const BottomNavigationColmRow({super.key});

  @override
  State<BottomNavigationColmRow> createState() => _BottomNavigationColmRowState();
}

class _BottomNavigationColmRowState extends State<BottomNavigationColmRow> {
  int _selectedIndex = 0;
  // Body content for each tab
  final List<Widget> _pages = [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Home Page'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home),
            SizedBox(width: 10),
            Text('Welcome to Home!'),
          ],
        )
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Search Page'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search),
            SizedBox(width: 10),
            Text('Start searching...'),
          ],
        )
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Profile Page'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person),
            SizedBox(width: 10),
            Text('Your Profile'),
          ],
        )
      ],
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bottom Nav with Column + Row')),
      body: Center(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
