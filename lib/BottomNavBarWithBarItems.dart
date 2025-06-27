import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavbarWithBarItems extends StatefulWidget {
  const BottomNavbarWithBarItems({super.key});

  @override
  State<BottomNavbarWithBarItems> createState() => _BottomNavbarWithBarItemsState();
}

class _BottomNavbarWithBarItemsState extends State<BottomNavbarWithBarItems> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeWithTabs(),
    Center(child: Text('Search Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        iconSize: 28,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
            tooltip: 'Go to Home screen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
            label: 'Search',
            tooltip: 'Search something',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
            tooltip: 'Your profile',
          ),
        ],
      ),
    );
  }
}

class HomeWithTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home with Tabs'),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.yellow,
            indicatorWeight: 4.0,
            tabs: const [
              Tab(icon: Icon(Icons.explore), text: 'Explore'),
              Tab(icon: Icon(Icons.favorite), text: 'Favorites'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Explore Tab', style: TextStyle(fontSize: 22))),
            Center(child: Text('Favorites Tab', style: TextStyle(fontSize: 22))),
            Center(child: Text('Settings Tab', style: TextStyle(fontSize: 22))),
          ],
        ),
      ),
    );
  }
}