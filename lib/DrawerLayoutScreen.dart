import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerLayoutScreen extends StatefulWidget {
  const DrawerLayoutScreen({super.key});

  @override
  State<DrawerLayoutScreen> createState() => _DrawerLayoutScreenState();
}

class _DrawerLayoutScreenState extends State<DrawerLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer with All Properties"),
      ),

      // Drawer on the left
      drawer: Drawer(
        elevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // DrawerHeader with user info / branding
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage('assets/images/img.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(radius: 30, backgroundColor: Colors.white),
                  SizedBox(height: 8),
                  Text("User Name", style: TextStyle(color: Colors.white, fontSize: 18)),
                  Text("user@example.com", style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),

            // Drawer Items
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // close drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context); // close drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context); // close drawer
              },
            ),
          ],
        ),
      ),

      // Drawer on the right (optional)
      endDrawer: Drawer(
        child: Center(child: Text("This is an end drawer")),
      ),

      body: Center(child: Text("Swipe from left or tap menu icon")),
    );
  }
}
