import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  final List<String> items = List.generate(30, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GridView with All Properties')),
      body: GridView.builder(
        scrollDirection: Axis.vertical, // or Axis.horizontal
        reverse: false, // reverses the scroll direction
        controller: ScrollController(), // custom scroll controller
        primary: false, // set to true to use PrimaryScrollController
        physics: BouncingScrollPhysics(), // scrolling behavior
        shrinkWrap: false, // if true, takes only as much space as needed
        padding: EdgeInsets.all(16), // padding around the grid
        itemCount: items.length, // total items from the arraylist
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of columns
          mainAxisSpacing: 10, // vertical spacing
          crossAxisSpacing: 10, // horizontal spacing
          childAspectRatio: 1, // width / height ratio
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.teal[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                items[index],
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
