import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DragAndDropScreen extends StatefulWidget {
  const DragAndDropScreen({super.key});

  @override
  State<DragAndDropScreen> createState() => _DragAndDropScreenState();
}

class _DragAndDropScreenState extends State<DragAndDropScreen> {
  Color caughtColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Drag & Drop Example")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Draggable widget
          Draggable<Color>(
            data: Colors.blue,
            feedback: Container(
              width: 100,
              height: 100,
              color: Colors.blue.withOpacity(0.5),
              child: const Center(child: Text("Dragging")),
            ),
            childWhenDragging: Container(
              width: 100,
              height: 100,
              color: Colors.grey,
              child: const Center(child: Text("Empty")),
            ),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: const Center(child: Text("Drag me")),
            ),
          ),

          DragTarget<Color>(
            onAccept: (color) {
              setState(() {
                caughtColor = color;
              });
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                width: 200,
                height: 200,
                color: candidateData.isEmpty ? caughtColor : Colors.greenAccent,
                child: const Center(child: Text("Drop here")),
              );
            },
          ),
        ],
      ),
    );
  }
}
