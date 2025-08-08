import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DragAndZoomScreen extends StatefulWidget {
  const DragAndZoomScreen({super.key});

  @override
  State<DragAndZoomScreen> createState() => _DragAndZoomScreenState();
}

class _DragAndZoomScreenState extends State<DragAndZoomScreen> {
  @override
  Widget build(BuildContext context) {
    Color acceptedColor = Colors.grey.shade300; // default target color
    bool isAccepted = false;

    Offset position = Offset(100, 100); // initial position
    return Scaffold(
      appBar: AppBar(title: Text("Drag & Drop")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Draggable<Color>(
              data: Colors.deepPurple, // data passed to DragTarget
              feedback: Container(
                width: 100,
                height: 100,
                color: Colors.deepPurple.withOpacity(0.7),
                child: Icon(Icons.drag_handle, color: Colors.white),
              ),
              childWhenDragging: Container(
                width: 100,
                height: 100,
                color: Colors.deepPurple.withOpacity(0.3),
                child: Center(child: Text("Dragging...", style: TextStyle(color: Colors.white))),
              ),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.deepPurple,
                child: Center(child: Text("Drag Me", style: TextStyle(color: Colors.white))),
              ),
            ),

            DragTarget<Color>(
              builder: (context, candidateData, rejectedData) {
                return Container(
                  width: 100,
                  height: 100,
                  color: isAccepted ? acceptedColor : Colors.grey.shade300,
                  child: Center(
                    child: Text(
                      isAccepted ? "Dropped!" : "Drop Here",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                );
              },
              onWillAccept: (data) {
                // You can add conditions here
                return true;
              },
              onAccept: (data) {
                setState(() {
                  acceptedColor = data;
                  isAccepted = true;
                });
              },
              onLeave: (data) {
                // Called when draggable leaves the target area
                setState(() {
                  isAccepted = false;
                });
              },
            ),
          ],
        ),
      ),
    );

  }
  /*Scaffold(
  body: GestureDetector(
  onPanUpdate: (details) {
  setState(() {
  position = details.localPosition;
  });
  },
  child: Stack(
  children: [
  Positioned(
  left: position.dx - 50, // offset to center the box on finger
  top: position.dy - 50,
  child: Container(
  width: 100,
  height: 100,
  decoration: BoxDecoration(
  color: Colors.deepPurple,
  borderRadius: BorderRadius.circular(12),
  ),
  child: Center(
  child: Text(
  'Follow Me',
  style: TextStyle(color: Colors.white),
  ),
  ),
  ),
  ),
  ],
  ),
  ),
  );*/
  /*
        Scaffold(
        body: Listener( // Listener needed to track full screen touches
          onPointerMove: (event) {
            setState(() {
              position = event.localPosition;
            });
          },
          child: Stack(
            children: [
              Positioned(
                left: position.dx - 50, // Centering the widget on touch
                top: position.dy - 50,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Drag Me',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
*/
}
