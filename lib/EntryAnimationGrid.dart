import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class EntryAnimationGrid extends StatefulWidget {
  const EntryAnimationGrid({super.key});

  @override
  State<EntryAnimationGrid> createState() => _EntryAnimationGridState();
}
// 1. Entry Animation Using flutter_staggered_animations
class _EntryAnimationGridState extends State<EntryAnimationGrid> {
  final items = List.generate(12, (i) => 'Item $i');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Grid")),
      body: Expanded(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              columnCount: 3,
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child:Card(color: Colors.teal,
                    child: Center(child: Text(items[index])),
                  )
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
